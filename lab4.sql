spool C:\Joy_Sem2\database\gp_proj\git\DB_TABLE\lab4_output.sql

set echo on
--drop tables in reverse order with CASCADE option
drop table student_course_record cascade constraints;
drop table instructor_scheduled_course cascade constraints;
drop table credential_course cascade constraints;
drop table student_credentials cascade constraints;
drop table scheduled_course cascade constraints;
drop table instructor cascade constraints;
drop table student cascade constraints;
drop table course cascade constraints;
drop table credential cascade constraints;

--Column level constraints
--parent: Credential
create table credential (
   credential# char(20)
      constraint hero_hero_id_pk primary key,
   school      varchar2(250) not null,
   name        varchar2(22) not null,
   type        char(2) not null
);

desc credential;

--Table level constraints
--parent: student
create table student (
   student_id    number(9)
      constraint student_student_id_pk primary key,
   first_name    varchar2(250) not null,
   last_name     varchar2(250) not null,
   status        char(1) not null,
   status_date   date not null,
   phone_number  char(12) not null,
   email_address varchar2(100) not null,
   constraint student_status_ck
      check ( status in ( 'A', --active
                          'P', --academic probation
                          'S', --suspened
                          'E' ) ), --expelled
   constraint student_phone_ck check ( regexp_like ( phone_number,
                                                     '^\d{3}\.\d{3}\.\d{4}$' ) ), --999.999.9999
   constraint student_email_ck check ( regexp_like ( email_address,
                                                     '^[^@]+@[^@]+\.[^@]+$' ) ) -- username@domain.com
);

desc student;

--parent: course
create table course (
   course_code        char(7)
      constraint course_course_code_pk primary key,
   name               varchar2(250) not null,
   num_of_credits     number(1) not null,
   prereq_course_code char(7),
   type_flag          char(1) check ( type_flag in ( '0',
                                            '1' ) ), --bool, '0' = false, '1' = true
   constraint crouse_number_of_credits_ck check ( num_of_credits between 1 and 9 ),
   constraint course__course_code_fk check ( regexp_like ( course_code,
                                                           '^[A-Z]{3}[0-9]{3}$' ) ) --LLL999
);

desc course;

--parent: instructor
create table instructor (
   instructor_id number(9)
      constraint instructor_instructor_id_pk primary key,
   first_name    varchar2(250) not null,
   last_name     varchar2(250) not null,
   address       varchar2(100) not null,
   city          varchar2(50) not null,
   prov          char(2) not null,
   postal_code   char(7) not null,
   phone_number  char(12) not null,
   email         varchar2(100) not null,
   constraint instructor_prov_ck check ( regexp_like ( prov,
                                                       '^[A-Z]{2}$' ) ), --LL
   constraint instructor_postal_code_ck check ( regexp_like ( postal_code,
                                                              '^[A-Z][0-9][A-Z] [0-9][A-Z][0-9]$' ) ), --L9L9L9
   constraint instructor_phone_number_ck check ( regexp_like ( phone_number,
                                                               '^[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}$' ) ), --999.999.9999
   constraint instructor_email_ck check ( regexp_like ( email,
                                                        '^[^@]+@[^@]+\.[^@]+$' ) ) --usernmae@domain.com
);

desc instructor;

-- Child: SCHEDULED_COURSE (depends on COURSE)
create table scheduled_course (
   crn           number(5),
   semester_code number(6),
   course_code   char(7),
   section_code  char(1),
   constraint scheduled_course_crn_pk primary key ( crn ),
   constraint scheduled_course_course_code_fk foreign key ( course_code )
      references course ( course_code ),
   constraint scheduled_course_crn_ck check ( regexp_like ( crn,
                                                            '^[0-9]{5}$' ) ), --99999
   constraint scheduled_course_semester_code_ck check ( regexp_like ( semester_code,
                                                                      '^[0-9]{6}$' ) ), --YYYYSS
   constraint scheduled_course_section_code_ck check ( regexp_like ( section_code,
                                                                     '^[A-Z]$' ) ) --L
);

desc scheduled_course;

-- Child: STUDENT_CREDENTIALS (depends on STUDENT, CREDENTIAL)
create table student_credentials (
   credential#       char(20),
   student_id        number(9),
   start_date        date,
   completion_date   date,
   credential_status char(1),
   gpa               number(2,1),
   constraint student_credential_credential#_pk primary key ( credential#,
                                                              student_id ),
   constraint student_credential_credential#_fk foreign key ( credential# )
      references credential ( credential# ),
   constraint student_credential_student_id_fk foreign key ( student_id )
      references student ( student_id ),
   constraint student_credentials_credential_status_ck
      check ( credential_status in ( 'A', --active
                                     'G', --granted
                                     'E' ) ) --expired
);

desc student_credentials;

-- Child: CREDENTIAL_COURSE (depends on CREDENTIAL, COURSE)
create table credential_course (
   credential# char(20),
   course_code char(7),
   constraint credential_course_credential#_pk primary key ( credential#,
                                                             course_code ),
   constraint credential_course_credentail#_fk foreign key ( credential# )
      references credential ( credential# ),
   constraint credential_course_course_code_fk foreign key ( course_code )
      references course ( course_code )
);

desc credential_course;

-- Child: INSTRUCTOR_SCHEDULED_COURSE (depends on INSTRUCTOR, SCHEDULED_COURSE)
create table instructor_scheduled_course (
   crn           number(5),
   semester_code number(6),
   instructor_id number(9),
   constraint instructor_scheduled_course_crn_pk primary key ( crn,
                                                               semester_code,
                                                               instructor_id ),
   constraint instructor_scheduled_course_crn_fk foreign key ( crn )
      references scheduled_course ( crn ),
   constraint instructor_scheduled_course_instructor_id_fk foreign key ( instructor_id )
      references instructor ( instructor_id )
);

desc instructor_scheduled_course;

-- Child: STUDENT_COURSE_RECORD (depends on STUDENT, SCHEDULED_COURSE, CREDENTIAL)
create table student_course_record (
   crn           number(5),
   semester_code number(6),
   student_id    number(9),
   course_code   char(7),
   credential#   char(20),
   letter_grade  varchar2(2),
   constraint student_course_record_all_pk
      primary key ( crn,
                    semester_code,
                    student_id,
                    course_code,
                    credential# ),
   foreign key ( crn )
      references scheduled_course ( crn ),
   foreign key ( student_id )
      references student ( student_id ),
   foreign key ( credential# )
      references credential ( credential# ),
   constraint student_course_record_letter_grade_ck
      check ( letter_grade in ( 'A+',
                                'A',
                                'A-',
                                'B+',
                                'B',
                                'B-',
                                'C+',
                                'C',
                                'C-',
                                'D+',
                                'D',
                                'F',
                                'I' ) )
);

desc student_course_record;

--alter

--coz this table is in column-level
alter table credential
   add constraint credential_type_ck
      check ( type in ( 'MI', --micro
                        'FT', --fast track
                        'CT', --certificate
                        'DP', --diploma
                        'AD', --applied degree
                        'D' ) ); --degree

--modify column size

desc credential;

alter table course modify (
   name varchar2(100)
);

desc course;

alter table student modify (
   email_address varchar2(150)
);

desc student;

select table_name
  from user_tables
 where table_name in ( 'CREDENTIAL',
                       'STUDENT',
                       'COURSE',
                       'INSTRUCTOR',
                       'SCHEDULED_COURSE',
                       'STUDENT_CREDENTIALS',
                       'CREDENTIAL_COURSE',
                       'INSTRUCTOR_SCHEDULED_COURSE',
                       'STUDENT_COURSE_RECORD' );

select constraint_name name,
       constraint_type type
  from user_constraints
 where table_name in ( 'CREDENTIAL',
                       'STUDENT',
                       'COURSE',
                       'INSTRUCTOR',
                       'SCHEDULED_COURSE',
                       'STUDENT_CREDENTIALS',
                       'CREDENTIAL_COURSE',
                       'INSTRUCTOR_SCHEDULED_COURSE',
                       'STUDENT_COURSE_RECORD' );

spool off