SQL> 
SQL> set echo on
SQL> --drop tables in reverse order with CASCADE option
SQL> drop table student_course_record cascade constraints;

Error starting at line : 5 in command -
drop table student_course_record cascade constraints
Error report -
ORA-00942: table or view does not exist

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.
SQL> drop table instructor_scheduled_course cascade constraints;

Error starting at line : 6 in command -
drop table instructor_scheduled_course cascade constraints
Error report -
ORA-00942: table or view does not exist

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.
SQL> drop table credential_course cascade constraints;

Error starting at line : 7 in command -
drop table credential_course cascade constraints
Error report -
ORA-00942: table or view does not exist

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.
SQL> drop table student_credentials cascade constraints;

Table STUDENT_CREDENTIALS dropped.

SQL> drop table scheduled_course cascade constraints;

Error starting at line : 9 in command -
drop table scheduled_course cascade constraints
Error report -
ORA-00942: table or view does not exist

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.
SQL> drop table instructor cascade constraints;

Table INSTRUCTOR dropped.

SQL> drop table student cascade constraints;

Table STUDENT dropped.

SQL> drop table course cascade constraints;

Error starting at line : 12 in command -
drop table course cascade constraints
Error report -
ORA-00942: table or view does not exist

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.
SQL> drop table credential cascade constraints;

Table CREDENTIAL dropped.

SQL> 
SQL> --Column level constraints
SQL> --parent: Credential
SQL> create table credential (
  2     credential# char(20)
  3        constraint hero_hero_id_pk primary key,
  4     school      varchar2(250) not null,
  5     name        varchar2(22) not null,
  6     type        char(2) not null
  7  );

Table CREDENTIAL created.

SQL> 
SQL> desc credential;
Name        Null?    Type          
----------- -------- ------------- 
CREDENTIAL# NOT NULL CHAR(20)      
SCHOOL      NOT NULL VARCHAR2(250) 
NAME        NOT NULL VARCHAR2(22)  
TYPE        NOT NULL CHAR(2)       
SQL> 
SQL> --Table level constraints
SQL> --parent: student
SQL> create table student (
  2     student_id    number(9)
  3        constraint student_student_id_pk primary key,
  4     first_name    varchar2(250) not null,
  5     last_name     varchar2(250) not null,
  6     status        char(1) not null,
  7     status_date   date not null,
  8     phone_number  char(12) not null,
  9     email_address varchar2(100) not null,
 10     constraint student_status_ck
 11        check ( status in ( 'A', --active
 12                            'P', --academic probation
 13                            'S', --suspened
 14                            'E' ) ), --expelled
 15     constraint student_phone_ck check ( regexp_like ( phone_number,
 16                                                       '^\d{3}\.\d{3}\.\d{4}$' ) ), --999.999.9999
 17     constraint student_email_ck check ( regexp_like ( email_address,
 18                                                       '^[^@]+@[^@]+\.[^@]+$' ) ) -- username@domain.com
 19  );

Table STUDENT created.

SQL> 
SQL> desc student;
Name          Null?    Type          
------------- -------- ------------- 
STUDENT_ID    NOT NULL NUMBER(9)     
FIRST_NAME    NOT NULL VARCHAR2(250) 
LAST_NAME     NOT NULL VARCHAR2(250) 
STATUS        NOT NULL CHAR(1)       
STATUS_DATE   NOT NULL DATE          
PHONE_NUMBER  NOT NULL CHAR(12)      
EMAIL_ADDRESS NOT NULL VARCHAR2(100) 
SQL> 
SQL> --parent: course
SQL> create table course (
  2     course_code        char(7)
  3        constraint course_course_code_pk primary key,
  4     name               varchar2(250) not null,
  5     num_of_credits     number(1) not null,
  6     prereq_course_code char(7),
  7     type_flag          char(1) check ( type_flag in ( '0',
  8                                              '1' ) ), --bool, '0' = false, '1' = true
  9     constraint crouse_number_of_credits_ck check ( num_of_credits between 1 and 9 ),
 10     constraint course__course_code_fk check ( regexp_like ( course_code,
 11                                                             '^[A-Z]{3}[0-9]{3}$' ) ) --LLL999
 12  );

Table COURSE created.

SQL> 
SQL> desc course;
Name               Null?    Type          
------------------ -------- ------------- 
COURSE_CODE        NOT NULL CHAR(7)       
NAME               NOT NULL VARCHAR2(250) 
NUM_OF_CREDITS     NOT NULL NUMBER(1)     
PREREQ_COURSE_CODE          CHAR(7)       
TYPE_FLAG                   CHAR(1)       
SQL> 
SQL> --parent: instructor
SQL> create table instructor (
  2     instructor_id number(9)
  3        constraint instructor_instructor_id_pk primary key,
  4     first_name    varchar2(250) not null,
  5     last_name     varchar2(250) not null,
  6     address       varchar2(100) not null,
  7     city          varchar2(50) not null,
  8     prov          char(2) not null,
  9     postal_code   char(7) not null,
 10     phone_number  char(12) not null,
 11     email         varchar2(100) not null,
 12     constraint instructor_prov_ck check ( regexp_like ( prov,
 13                                                         '^[A-Z]{2}$' ) ), --LL
 14     constraint instructor_postal_code_ck check ( regexp_like ( postal_code,
 15                                                                '^[A-Z][0-9][A-Z] [0-9][A-Z][0-9]$' ) ), --L9L9L9
 16     constraint instructor_phone_number_ck check ( regexp_like ( phone_number,
 17                                                                 '^[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}$' ) ), --999.999.9999
 18     constraint instructor_email_ck check ( regexp_like ( email,
 19                                                          '^[^@]+@[^@]+\.[^@]+$' ) ) --usernmae@domain.com
 20  );

Table INSTRUCTOR created.

SQL> 
SQL> desc instructor;
Name          Null?    Type          
------------- -------- ------------- 
INSTRUCTOR_ID NOT NULL NUMBER(9)     
FIRST_NAME    NOT NULL VARCHAR2(250) 
LAST_NAME     NOT NULL VARCHAR2(250) 
ADDRESS       NOT NULL VARCHAR2(100) 
CITY          NOT NULL VARCHAR2(50)  
PROV          NOT NULL CHAR(2)       
POSTAL_CODE   NOT NULL CHAR(7)       
PHONE_NUMBER  NOT NULL CHAR(12)      
EMAIL         NOT NULL VARCHAR2(100) 
SQL> 
SQL> -- Child: SCHEDULED_COURSE (depends on COURSE)
SQL> create table scheduled_course (
  2     crn           number(5),
  3     semester_code number(6),
  4     course_code   char(7),
  5     section_code  char(1),
  6     constraint scheduled_course_crn_pk primary key ( crn ),
  7     constraint scheduled_course_course_code_fk foreign key ( course_code )
  8        references course ( course_code ),
  9     constraint scheduled_course_crn_ck check ( regexp_like ( crn,
 10                                                              '^[0-9]{5}$' ) ), --99999
 11     constraint scheduled_course_semester_code_ck check ( regexp_like ( semester_code,
 12                                                                        '^[0-9]{6}$' ) ), --YYYYSS
 13     constraint scheduled_course_section_code_ck check ( regexp_like ( section_code,
 14                                                                       '^[A-Z]$' ) ) --L
 15  );

Table SCHEDULED_COURSE created.

SQL> 
SQL> desc scheduled_course;
Name          Null?    Type      
------------- -------- --------- 
CRN           NOT NULL NUMBER(5) 
SEMESTER_CODE          NUMBER(6) 
COURSE_CODE            CHAR(7)   
SECTION_CODE           CHAR(1)   
SQL> 
SQL> -- Child: STUDENT_CREDENTIALS (depends on STUDENT, CREDENTIAL)
SQL> create table student_credentials (
  2     credential#       char(20),
  3     student_id        number(9),
  4     start_date        date,
  5     completion_date   date,
  6     credential_status char(1),
  7     gpa               number(2,1),
  8     constraint student_credential_credential#_pk primary key ( credential#,
  9                                                                student_id ),
 10     constraint student_credential_credential#_fk foreign key ( credential# )
 11        references credential ( credential# ),
 12     constraint student_credential_student_id_fk foreign key ( student_id )
 13        references student ( student_id ),
 14     constraint student_credentials_credential_status_ck
 15        check ( credential_status in ( 'A', --active
 16                                       'G', --granted
 17                                       'E' ) ) --expired
 18  );

Table STUDENT_CREDENTIALS created.

SQL> 
SQL> desc student_credentials;
Name              Null?    Type        
----------------- -------- ----------- 
CREDENTIAL#       NOT NULL CHAR(20)    
STUDENT_ID        NOT NULL NUMBER(9)   
START_DATE                 DATE        
COMPLETION_DATE            DATE        
CREDENTIAL_STATUS          CHAR(1)     
GPA                        NUMBER(2,1) 
SQL> 
SQL> -- Child: CREDENTIAL_COURSE (depends on CREDENTIAL, COURSE)
SQL> create table credential_course (
  2     credential# char(20),
  3     course_code char(7),
  4     constraint credential_course_credential#_pk primary key ( credential#,
  5                                                               course_code ),
  6     constraint credential_course_credentail#_fk foreign key ( credential# )
  7        references credential ( credential# ),
  8     constraint credential_course_course_code_fk foreign key ( course_code )
  9        references course ( course_code )
 10  );

Table CREDENTIAL_COURSE created.

SQL> 
SQL> desc credential_course;
Name        Null?    Type     
----------- -------- -------- 
CREDENTIAL# NOT NULL CHAR(20) 
COURSE_CODE NOT NULL CHAR(7)  
SQL> 
SQL> -- Child: INSTRUCTOR_SCHEDULED_COURSE (depends on INSTRUCTOR, SCHEDULED_COURSE)
SQL> create table instructor_scheduled_course (
  2     crn           number(5),
  3     semester_code number(6),
  4     instructor_id number(9),
  5     constraint instructor_scheduled_course_crn_pk primary key ( crn,
  6                                                                 semester_code,
  7                                                                 instructor_id ),
  8     constraint instructor_scheduled_course_crn_fk foreign key ( crn )
  9        references scheduled_course ( crn ),
 10     constraint instructor_scheduled_course_instructor_id_fk foreign key ( instructor_id )
 11        references instructor ( instructor_id )
 12  );

Table INSTRUCTOR_SCHEDULED_COURSE created.

SQL> 
SQL> desc instructor_scheduled_course;
Name          Null?    Type      
------------- -------- --------- 
CRN           NOT NULL NUMBER(5) 
SEMESTER_CODE NOT NULL NUMBER(6) 
INSTRUCTOR_ID NOT NULL NUMBER(9) 
SQL> 
SQL> -- Child: STUDENT_COURSE_RECORD (depends on STUDENT, SCHEDULED_COURSE, CREDENTIAL)
SQL> create table student_course_record (
  2     crn           number(5),
  3     semester_code number(6),
  4     student_id    number(9),
  5     course_code   char(7),
  6     credential#   char(20),
  7     letter_grade  varchar2(2),
  8     constraint student_course_record_all_pk
  9        primary key ( crn,
 10                      semester_code,
 11                      student_id,
 12                      course_code,
 13                      credential# ),
 14     foreign key ( crn )
 15        references scheduled_course ( crn ),
 16     foreign key ( student_id )
 17        references student ( student_id ),
 18     foreign key ( credential# )
 19        references credential ( credential# ),
 20     constraint student_course_record_letter_grade_ck
 21        check ( letter_grade in ( 'A+',
 22                                  'A',
 23                                  'A-',
 24                                  'B+',
 25                                  'B',
 26                                  'B-',
 27                                  'C+',
 28                                  'C',
 29                                  'C-',
 30                                  'D+',
 31                                  'D',
 32                                  'F',
 33                                  'I' ) )
 34  );

Table STUDENT_COURSE_RECORD created.

SQL> 
SQL> desc student_course_record;
Name          Null?    Type        
------------- -------- ----------- 
CRN           NOT NULL NUMBER(5)   
SEMESTER_CODE NOT NULL NUMBER(6)   
STUDENT_ID    NOT NULL NUMBER(9)   
COURSE_CODE   NOT NULL CHAR(7)     
CREDENTIAL#   NOT NULL CHAR(20)    
LETTER_GRADE           VARCHAR2(2) 
SQL> 
SQL> --alter
SQL> 
SQL> --coz this table is in column-level
SQL> alter table credential
  2     add constraint credential_type_ck
  3        check ( type in ( 'MI', --micro
  4                          'FT', --fast track
  5                          'CT', --certificate
  6                          'DP', --diploma
  7                          'AD', --applied degree
  8                          'D' ) );

Table CREDENTIAL altered.

SQL>  --degree
SQL> 
SQL> --modify column size
SQL> 
SQL> desc credential;
Name        Null?    Type          
----------- -------- ------------- 
CREDENTIAL# NOT NULL CHAR(20)      
SCHOOL      NOT NULL VARCHAR2(250) 
NAME        NOT NULL VARCHAR2(22)  
TYPE        NOT NULL CHAR(2)       
SQL> 
SQL> alter table course modify (
  2     name varchar2(100)
  3  );

Table COURSE altered.

SQL> 
SQL> desc course;
Name               Null?    Type          
------------------ -------- ------------- 
COURSE_CODE        NOT NULL CHAR(7)       
NAME               NOT NULL VARCHAR2(100) 
NUM_OF_CREDITS     NOT NULL NUMBER(1)     
PREREQ_COURSE_CODE          CHAR(7)       
TYPE_FLAG                   CHAR(1)       
SQL> 
SQL> alter table student modify (
  2     email_address varchar2(150)
  3  );

Table STUDENT altered.

SQL> 
SQL> desc student;
Name          Null?    Type          
------------- -------- ------------- 
STUDENT_ID    NOT NULL NUMBER(9)     
FIRST_NAME    NOT NULL VARCHAR2(250) 
LAST_NAME     NOT NULL VARCHAR2(250) 
STATUS        NOT NULL CHAR(1)       
STATUS_DATE   NOT NULL DATE          
PHONE_NUMBER  NOT NULL CHAR(12)      
EMAIL_ADDRESS NOT NULL VARCHAR2(150) 
SQL> 
SQL> select table_name
  2    from user_tables
  3   where table_name in ( 'CREDENTIAL',
  4                         'STUDENT',
  5                         'COURSE',
  6                         'INSTRUCTOR',
  7                         'SCHEDULED_COURSE',
  8                         'STUDENT_CREDENTIALS',
  9                         'CREDENTIAL_COURSE',
 10                         'INSTRUCTOR_SCHEDULED_COURSE',
 11                         'STUDENT_COURSE_RECORD' );

TABLE_NAME
--------------------------------------------------------------------------------------------------------------------------------
COURSE
CREDENTIAL
CREDENTIAL_COURSE
INSTRUCTOR
INSTRUCTOR_SCHEDULED_COURSE
SCHEDULED_COURSE
STUDENT
STUDENT_COURSE_RECORD
STUDENT_CREDENTIALS

9 rows selected. 

SQL> 
SQL> select constraint_name name,
  2         constraint_type type
  3    from user_constraints
  4   where table_name in ( 'CREDENTIAL',
  5                         'STUDENT',
  6                         'COURSE',
  7                         'INSTRUCTOR',
  8                         'SCHEDULED_COURSE',
  9                         'STUDENT_CREDENTIALS',
 10                         'CREDENTIAL_COURSE',
 11                         'INSTRUCTOR_SCHEDULED_COURSE',
 12                         'STUDENT_COURSE_RECORD' );

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SCHEDULED_COURSE_COURSE_CODE_FK                                                                                                  R
STUDENT_CREDENTIAL_CREDENTIAL#_FK                                                                                                R
STUDENT_CREDENTIAL_STUDENT_ID_FK                                                                                                 R
CREDENTIAL_COURSE_CREDENTAIL#_FK                                                                                                 R
CREDENTIAL_COURSE_COURSE_CODE_FK                                                                                                 R
INSTRUCTOR_SCHEDULED_COURSE_CRN_FK                                                                                               R
INSTRUCTOR_SCHEDULED_COURSE_INSTRUCTOR_ID_FK                                                                                     R
SYS_C0011142                                                                                                                     R
SYS_C0011143                                                                                                                     R
SYS_C0011144                                                                                                                     R
SCHEDULED_COURSE_CRN_CK                                                                                                          C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SCHEDULED_COURSE_SEMESTER_CODE_CK                                                                                                C
SCHEDULED_COURSE_SECTION_CODE_CK                                                                                                 C
STUDENT_CREDENTIALS_CREDENTIAL_STATUS_CK                                                                                         C
STUDENT_COURSE_RECORD_LETTER_GRADE_CK                                                                                            C
CREDENTIAL_TYPE_CK                                                                                                               C
SYS_C0011093                                                                                                                     C
SYS_C0011094                                                                                                                     C
SYS_C0011096                                                                                                                     C
SYS_C0011092                                                                                                                     C
SYS_C0011097                                                                                                                     C
SYS_C0011098                                                                                                                     C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C0011099                                                                                                                     C
SYS_C0011100                                                                                                                     C
SYS_C0011101                                                                                                                     C
STUDENT_STATUS_CK                                                                                                                C
STUDENT_PHONE_CK                                                                                                                 C
STUDENT_EMAIL_CK                                                                                                                 C
SYS_C0011106                                                                                                                     C
SYS_C0011107                                                                                                                     C
SYS_C0011108                                                                                                                     C
CROUSE_NUMBER_OF_CREDITS_CK                                                                                                      C
COURSE__COURSE_CODE_FK                                                                                                           C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C0011112                                                                                                                     C
SYS_C0011113                                                                                                                     C
SYS_C0011114                                                                                                                     C
SYS_C0011115                                                                                                                     C
SYS_C0011116                                                                                                                     C
SYS_C0011117                                                                                                                     C
SYS_C0011118                                                                                                                     C
SYS_C0011119                                                                                                                     C
INSTRUCTOR_PROV_CK                                                                                                               C
INSTRUCTOR_POSTAL_CODE_CK                                                                                                        C
INSTRUCTOR_PHONE_NUMBER_CK                                                                                                       C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
INSTRUCTOR_EMAIL_CK                                                                                                              C
SCHEDULED_COURSE_CRN_PK                                                                                                          P
STUDENT_CREDENTIAL_CREDENTIAL#_PK                                                                                                P
CREDENTIAL_COURSE_CREDENTIAL#_PK                                                                                                 P
INSTRUCTOR_SCHEDULED_COURSE_CRN_PK                                                                                               P
STUDENT_COURSE_RECORD_ALL_PK                                                                                                     P
HERO_HERO_ID_PK                                                                                                                  P
STUDENT_STUDENT_ID_PK                                                                                                            P
COURSE_COURSE_CODE_PK                                                                                                            P
INSTRUCTOR_INSTRUCTOR_ID_PK                                                                                                      P

54 rows selected. 

SQL> 
SQL> spool off
