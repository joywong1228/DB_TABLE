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
 10     constraint ck_status
 11        check ( status in ( 'A', --active
 12                            'P', --academic probation
 13                            'S', --suspened
 14                            'E' ) ), --expelled
 15     constraint ck_phone check ( regexp_like ( phone_number,
 16                                               '^\d{3}\.\d{3}\.\d{4}$' ) ), --999.999.9999
 17     constraint ck_email check ( regexp_like ( email_address,
 18                                               '^[^@]+@[^@]+\.[^@]+$' ) ) -- username@domain.com
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
  9     constraint ck_credits check ( num_of_credits between 1 and 9 ),
 10     constraint ck_course_code_format check ( regexp_like ( course_code,
 11                                                            '^[A-Z]{3}[0-9]{3}$' ) ) --LLL999
 12  );

Error starting at line : 52 in command -
create table course (
   course_code        char(7)
      constraint course_course_code_pk primary key,
   name               varchar2(250) not null,
   num_of_credits     number(1) not null,
   prereq_course_code char(7),
   type_flag          char(1) check ( type_flag in ( '0',
                                            '1' ) ), --bool, '0' = false, '1' = true
   constraint ck_credits check ( num_of_credits between 1 and 9 ),
   constraint ck_course_code_format check ( regexp_like ( course_code,
                                                          '^[A-Z]{3}[0-9]{3}$' ) ) --LLL999
)
Error report -
ORA-02264: name already used by an existing constraint

https://docs.oracle.com/error-help/db/ora-02264/02264. 00000 -  "name already used by an existing constraint"
*Cause:    The specified constraint name has to be unique.
*Action:   Specify a unique constraint name for the constraint.
SQL> 
SQL> desc course;

ERROR:
ORA-04043: object course does not exist
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
 12     constraint ck_prov check ( regexp_like ( prov,
 13                                              '^[A-Z]{2}$' ) ), --LL
 14     constraint ck_postal check ( regexp_like ( postal_code,
 15                                                '^[A-Z][0-9][A-Z] [0-9][A-Z][0-9]$' ) ), --L9L9L9
 16     constraint ck_phone_ins check ( regexp_like ( phone_number,
 17                                                   '^[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}$' ) ), --999.999.9999
 18     constraint ck_email_ins check ( regexp_like ( email,
 19                                                   '^[^@]+@[^@]+\.[^@]+$' ) ) --usernmae@domain.com
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
  9     constraint ck_crn check ( regexp_like ( crn,
 10                                             '^[0-9]{5}$' ) ), --99999
 11     constraint ck_semester check ( regexp_like ( semester_code,
 12                                                  '^[0-9]{6}$' ) ), --YYYYSS
 13     constraint ck_section check ( regexp_like ( section_code,
 14                                                 '^[A-Z]$' ) ) --L
 15  );

Error starting at line : 92 in command -
create table scheduled_course (
   crn           number(5),
   semester_code number(6),
   course_code   char(7),
   section_code  char(1),
   constraint scheduled_course_crn_pk primary key ( crn ),
   constraint scheduled_course_course_code_fk foreign key ( course_code )
      references course ( course_code ),
   constraint ck_crn check ( regexp_like ( crn,
                                           '^[0-9]{5}$' ) ), --99999
   constraint ck_semester check ( regexp_like ( semester_code,
                                                '^[0-9]{6}$' ) ), --YYYYSS
   constraint ck_section check ( regexp_like ( section_code,
                                               '^[A-Z]$' ) ) --L
)
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
SQL> 
SQL> desc scheduled_course;

ERROR:
ORA-04043: object scheduled_course does not exist
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
 14     constraint ck_cred_status
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

Error starting at line : 133 in command -
create table credential_course (
   credential# char(20),
   course_code char(7),
   constraint credential_course_credential#_pk primary key ( credential#,
                                                             course_code ),
   constraint credential_course_credentail#_fk foreign key ( credential# )
      references credential ( credential# ),
   constraint credential_course_course_code_fk foreign key ( course_code )
      references course ( course_code )
)
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
SQL> 
SQL> desc credential_course;

ERROR:
ORA-04043: object credential_course does not exist
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

Error starting at line : 147 in command -
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
)
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
SQL> 
SQL> desc instructor_scheduled_course;

ERROR:
ORA-04043: object instructor_scheduled_course does not exist
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
 20     constraint ck_grade
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

Error starting at line : 163 in command -
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
   constraint ck_grade
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
)
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
SQL> 
SQL> desc student_course_record;

ERROR:
ORA-04043: object student_course_record does not exist
SQL> 
SQL> --alter
SQL> 
SQL> --coz this table is in column-level
SQL> alter table credential
  2     add constraint ck_type
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

Error starting at line : 216 in command -
alter table course modify (
   name varchar2(100)
)
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
SQL> 
SQL> desc course;

ERROR:
ORA-04043: object course does not exist
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
CREDENTIAL
INSTRUCTOR
STUDENT
STUDENT_CREDENTIALS

SQL> 
SQL> select constraint_name name,
  2         constraint_type type
  3    from user_constraints;

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
ORDERS_CUSTOMER#_FK                                                                                                              R
ORDERITEMS_ORDER#_FK                                                                                                             R
BOOKS_PUBID_FK                                                                                                                   R
BOOKAUTHOR_AUTHORID_FK                                                                                                           R
ORDERITEMS_ISBN_FK                                                                                                               R
BOOKAUTHOR_ISBN_FK                                                                                                               R
SYS_C0010209                                                                                                                     R
MISSION_HERO_ID_FK                                                                                                               R
STUDENT_CREDENTIAL_CREDENTIAL#_FK                                                                                                R
STUDENT_CREDENTIAL_STUDENT_ID_FK                                                                                                 R
TD_TO_DEST_FK                                                                                                                    R

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
VT_TO_RATING_FK                                                                                                                  R
TD_TO_VT_FK                                                                                                                      R
TC_TO_VT_FK                                                                                                                      R
CUST_TO_AGENT_FK                                                                                                                 R
AT_TO_AGENT_FK                                                                                                                   R
TC_TO_CUST_FK                                                                                                                    R
AT_TO_TRAINING_FK                                                                                                                R
BIN$GMcddDRITZ+Lmd+eyPx/nQ==$0                                                                                                   C
BIN$b02k0TGaREGKw+mZ0/uxMw==$0                                                                                                   C
BIN$2lr8cxs9QWmugAZlb5jH7Q==$0                                                                                                   C
BIN$ouPTN72kSN+e/HSyBkolGg==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$qTOlAKG1SIiK3uA9oGC3jQ==$0                                                                                                   C
BIN$rmIkKFi1SXq9mBEGDDzLNQ==$0                                                                                                   C
BIN$avk9cCzvQ0CPYKI5jymUgQ==$0                                                                                                   C
BIN$D0pkcgOZRUujCZBrRD/oNg==$0                                                                                                   C
BIN$ccz9vPSCTR+mf7Bu0UkjRw==$0                                                                                                   C
BIN$lcg33j6VRXm7l79B2EMwrw==$0                                                                                                   C
BIN$7l7940izSzGWxf3rN6gXFA==$0                                                                                                   C
BIN$zmOc8lxARg6WVed3nIiu7g==$0                                                                                                   C
BIN$whOE/pp7TTmZTkjLb2cFbQ==$0                                                                                                   C
BIN$/IWiJ35qQySa6R8ChL6crg==$0                                                                                                   C
BIN$O2uobCfcQIWgCGrfiVN7qw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$x2zmAZFwR+OypUmT8X8OwQ==$0                                                                                                   C
BIN$RPeztMoGQI6uZAuUpsfnoQ==$0                                                                                                   C
BIN$g+GZlSt7SXS8peO1Z9xWNA==$0                                                                                                   C
BIN$ND3YTnh6RT+9nDvbxbqAlQ==$0                                                                                                   C
BIN$8f+LgVvOQwOJx5GE5Rl76w==$0                                                                                                   C
BIN$8iOdMneETP6rSA/lt88HAw==$0                                                                                                   C
BIN$gyvDM4z6Q3aIhO7y64tQLw==$0                                                                                                   C
BIN$PODFBw+UT++t+i1UI+P0rw==$0                                                                                                   C
BIN$lRulHhHMTvSS8p69UtNGGQ==$0                                                                                                   C
BIN$rsG6hd8SR9qX4d7ctVI0yg==$0                                                                                                   C
BIN$OlkjWrFwR/GZWUqrCDY0GQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$DZ6PO4+PQdOPhj2WUnO5TA==$0                                                                                                   C
BIN$DQn15YxpTTaX724FOwnv/Q==$0                                                                                                   C
BIN$fHdLVBXCQxGWUl93npGzUA==$0                                                                                                   C
BIN$qb6UJ67fSy+TYIV5jmdU5w==$0                                                                                                   C
BIN$XYySPkZKSyyqSNjMLflOTQ==$0                                                                                                   C
BIN$kzXUBtcJRV23NQVo+bZUbQ==$0                                                                                                   C
BIN$lbQmxNSgTYiBbzNPDOAjMA==$0                                                                                                   C
BIN$dUzzgtuaSbGTWOg/uF5X5g==$0                                                                                                   C
BIN$1+/44l08QVWYJKUM0rksEA==$0                                                                                                   C
BIN$hZ+aOpTXTWexEUmN3Clcxg==$0                                                                                                   C
BIN$Kq/E1nRdQRmp9v5+OYpXLg==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$oiCJecnOSs2sMT8RiJls/A==$0                                                                                                   C
BIN$8egRlD/lSx2xQIfq+s0tzQ==$0                                                                                                   C
BIN$4jUO99SqTp2SQEy7+5zZ9Q==$0                                                                                                   C
BIN$xtVGnzDfRnOGj6j4hjg/kA==$0                                                                                                   C
BIN$r9aSBFocQh6ZFMdmXLVNsw==$0                                                                                                   C
BIN$i8QS456iTZiiMqowTcbMDQ==$0                                                                                                   C
BIN$984sDArLRsqOGBCpnTQNrQ==$0                                                                                                   C
BIN$2+ZO1GhMSuCM+fMMMEg8rg==$0                                                                                                   C
BIN$fW4Uy0gsTPuRV7KcjGXbiw==$0                                                                                                   C
BIN$KSxbIePwRmWffD8DDVEw7g==$0                                                                                                   C
BIN$q2iW4Bb/Tfeiki4FCS9tVA==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$fFFD6DsIQVesNyrjZo2+vw==$0                                                                                                   C
BIN$vF9SFnoeSi6f5G8+0E16bQ==$0                                                                                                   C
BIN$cDjTfZEZQdmxoUnvIsJO1A==$0                                                                                                   C
BIN$fgKCRddTQyGBVuqs1JpTpQ==$0                                                                                                   C
BIN$fXomZviSS5eQu6vOnffCJQ==$0                                                                                                   C
BIN$DbIOR1JcR+GSr0k75/FItQ==$0                                                                                                   C
BIN$xA+GjFwARA6jIGdiq/uDeQ==$0                                                                                                   C
BIN$q5nOsbRgQjuDLGmNMvPQVQ==$0                                                                                                   C
BIN$4xUxfwoST7Oczw7k5vw4Tw==$0                                                                                                   C
BIN$B2zkL2kNQtOY9r0p312h1g==$0                                                                                                   C
BIN$Sia1KW0GSS+OcMYtNkcApQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$Kha/6YebRcOAkfk3odh9cQ==$0                                                                                                   C
BIN$R1rJg1NATaynYt7TyMxbWg==$0                                                                                                   C
BIN$bnmyhTy/TYqBm2hniJ64RA==$0                                                                                                   C
BIN$Tp61PeS7Q+qot9t/byyl4Q==$0                                                                                                   C
BIN$2YDc0IQARh21IjU30/Ranw==$0                                                                                                   C
BIN$iufO93xuQKmNVCreOPYuRg==$0                                                                                                   C
BIN$5vnA0TtPQPmI7eel3Nl08g==$0                                                                                                   C
BIN$wlF/yePDS9WZU0sQz/dnmA==$0                                                                                                   C
BIN$BaiVlmXzTGKffDOluP2Wtw==$0                                                                                                   C
BIN$3hZlIrRVRnWQrG7TUQK+2Q==$0                                                                                                   C
BIN$x34IyHFjTn2p+faueGWN7A==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$9PuIQd03QHSfZGqNHDPKQg==$0                                                                                                   C
BIN$UVMzJP6XRRev44opJVEPcA==$0                                                                                                   C
BIN$n2FXnxX9Tv+axu0ZZjBqLw==$0                                                                                                   C
BIN$d4v+GkAlRquebmuiat6RWw==$0                                                                                                   C
BIN$NnUoAL0hT9iX4FtbFA2GTg==$0                                                                                                   C
BIN$5OrLLwmZT3KQfSYpUKX7hg==$0                                                                                                   C
BIN$eM1LXzHCSxuLyBp03NKtwg==$0                                                                                                   C
SYS_C008314                                                                                                                      C
SYS_C008315                                                                                                                      C
CUSTOMERS_REGION_CK                                                                                                              C
SYS_C008318                                                                                                                      C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C008325                                                                                                                      C
SYS_C008326                                                                                                                      C
ODERITEMS_QUANTITY_CK                                                                                                            C
SYS_C008334                                                                                                                      C
SYS_C008335                                                                                                                      C
ACCTMANAGER_REGION_CK                                                                                                            C
BIN$B7FWFRXvQN2qqUgKHjySVw==$0                                                                                                   C
BIN$ObqR8fMISW+Uy8Y9gbYMiw==$0                                                                                                   C
BIN$o6+Fje8iRwCL/0/qKQ8BAg==$0                                                                                                   C
BIN$UEPOob8XQ8ODCmR2BIYDRw==$0                                                                                                   C
BIN$draVQtnBRCyjvTb7x3ph7w==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$jpzJEYT9SXeWiV5jUqiPbg==$0                                                                                                   C
BIN$WfYnOXnSSWG2bcylFNdW3A==$0                                                                                                   C
BIN$sQ0+cwxeQ1WQyvYM5WD3EQ==$0                                                                                                   C
BIN$2GEQlV4bTcawL0fyJCHLSg==$0                                                                                                   C
BIN$hH6caHCXSE6Q+2s+RoOAsQ==$0                                                                                                   C
BIN$sZif8bQdTGiEEcw18SbZlQ==$0                                                                                                   C
BIN$e9r1k+2YTw+A05TPyg11Bw==$0                                                                                                   C
BIN$nHYHix3YR7ePlf4Vmpr6Sg==$0                                                                                                   C
BIN$qd5T1uCTRHWVXX6b9A5wYQ==$0                                                                                                   C
BIN$OLR7C0bGQ8uHXISupvSCNg==$0                                                                                                   C
BIN$oBw4jFn7Sv6v9kHwvqYS5w==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$YsP8drrSQNeWBcAmkDS9Fg==$0                                                                                                   C
BIN$moDzisPmTgKoYU0YjNvPaQ==$0                                                                                                   C
BIN$IeLRMJuTRhS8VFP9UAK1yQ==$0                                                                                                   C
BIN$ci6qZWnDQ2q2VzPrapwUjQ==$0                                                                                                   C
BIN$n4Vvz01KS9mvCPm7D2ZUoA==$0                                                                                                   C
BIN$BB/CQtdIQpqpDmO3mjTR1Q==$0                                                                                                   C
BIN$+g3t0DMiSzaypFjb+j2YEQ==$0                                                                                                   C
BIN$KT8Vz+uvSqSmifU1VDWp+w==$0                                                                                                   C
BIN$V/fxEY/8TK20/0CKC1V1fw==$0                                                                                                   C
BIN$GOppXFiiQoyvBfL2WPtxUg==$0                                                                                                   C
BIN$mpadw77STaKlsO4ja+iuZw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$DcvZ31wJQ/6Lsg9heaFApg==$0                                                                                                   C
BIN$FoSdkEVMRuybZs2yZHvRPg==$0                                                                                                   C
BIN$gV8oWDrcRg6RGNxqMU+o1w==$0                                                                                                   C
BIN$e+yMfGpiQvOO4LJvm+4wsg==$0                                                                                                   C
BIN$fww/RDegSXmAI990aWMLaw==$0                                                                                                   C
BIN$siAwaAnrREq+9DeQPS/3CQ==$0                                                                                                   C
BIN$HbIoj0//SxCp+L7mJwoGXg==$0                                                                                                   C
BIN$h+SPwxo0TOutPinkco/5KA==$0                                                                                                   C
BIN$P2cbVQ2nS/WOM02tlQkEVg==$0                                                                                                   C
BIN$Yi0GM3reS5OfR7KDklc6+Q==$0                                                                                                   C
BIN$Yumq3IttSk+51jdGi2/MYw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$3FOFfcwHSu6l5r3Kn4bnmA==$0                                                                                                   C
BIN$j+9QkreKRYGjZZE2bLkF7A==$0                                                                                                   C
BIN$qDbIoAjEQmK2av5kyWuFzg==$0                                                                                                   C
BIN$zF2yKHWLSdOSbJ+ImGcshw==$0                                                                                                   C
BIN$5Sh3o9TDTAi7u9Gzs8Y2zA==$0                                                                                                   C
BIN$ER1pjda6S0yE6CFZfJKgTg==$0                                                                                                   C
BIN$5h+GkeVoScCGwPIDwOWTeA==$0                                                                                                   C
BIN$81cfzeKUTTaSJN4QLjJUDQ==$0                                                                                                   C
BIN$ZjSwD6qUTSG8G1ZoM/QAmQ==$0                                                                                                   C
BIN$SJJaRmMRS1GIWqJ2s31+qQ==$0                                                                                                   C
BIN$0tIyQkUtQSq6GhwHmr7HcA==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$sOFks4A6QwG0tgtW10K1zA==$0                                                                                                   C
BIN$R/JxXm5LQrunkQDPE+eiVA==$0                                                                                                   C
BIN$QxiVJ2fFQiae2tAbmn1lmA==$0                                                                                                   C
BIN$RCJTCgnGTVecA2FXezT2Bg==$0                                                                                                   C
BIN$ZzP5/NSSQNafXTjlNP9u0A==$0                                                                                                   C
BIN$vqQ6s9BZSA2oLpBmZgz99g==$0                                                                                                   C
BIN$+gWP0m83R0SYPk0tR3WuIQ==$0                                                                                                   C
BIN$ZBg4uNX5RCOKT4m9P2upAA==$0                                                                                                   C
BIN$0gngrlHNT46/e5/0hrQuRg==$0                                                                                                   C
BIN$v1kQbb0DTPSdks6hDDTB7Q==$0                                                                                                   C
BIN$Rulzas1TR4mw00kW4hVo0w==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$PCg3qVMVTuS9mLhbRPnJdA==$0                                                                                                   C
BIN$Hrp0tCv1QXSCFa5Ye9TtOg==$0                                                                                                   C
BIN$YZq5wzqjTlSasXqE7JugxA==$0                                                                                                   C
BIN$f9AJueiGQc+dobDePTVR7g==$0                                                                                                   C
BIN$RDkJU2VfT9ORqhNYIgL9SQ==$0                                                                                                   C
BIN$bvvyhh5zT1S3BSoYsesMyQ==$0                                                                                                   C
BIN$DsMiMJp5RLygL8mr+Q1bSg==$0                                                                                                   C
BIN$BKA8CbLaRpSyatbdISjzJg==$0                                                                                                   C
BIN$aE/R3HtpQUCYRLLFR1YX+g==$0                                                                                                   C
SYS_C0010195                                                                                                                     C
BIN$0jTviFaBTq2sSZVCuZhBQQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$8vpLzyFOQ0Ss3Bcdk3cz/Q==$0                                                                                                   C
BIN$/iusdptnSSW85/BM0qUgAA==$0                                                                                                   C
SYS_C0010204                                                                                                                     C
SYS_C0010205                                                                                                                     C
CK_CREDITS                                                                                                                       C
BIN$5ycWW9JKQWGuStQkY6KOnw==$0                                                                                                   C
BIN$6WEPG6GOQTGypZovQayR8A==$0                                                                                                   C
BIN$YqBuY551QZ+yz4IGrTJ1lg==$0                                                                                                   C
BIN$ZkO+9VnRRP6YA4YgQPqSbA==$0                                                                                                   C
BIN$kPtLjkkaQB2E0TFVwX3UqA==$0                                                                                                   C
BIN$xkHRVyx8TI2WyAt4U5OYPg==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$dFTuH8nQQS6hMVNTMFjJLA==$0                                                                                                   C
BIN$O6DQ8ahQQTaTQgbJiwBLig==$0                                                                                                   C
BIN$X0OLzVQVSAOyL5yjRdiSaA==$0                                                                                                   C
BIN$ki31Xu17SqamF7KlvqJo+Q==$0                                                                                                   C
BIN$BP2Q+c6IStWe+m44RXtfMA==$0                                                                                                   C
BIN$9DDoOjSoThOtXAIl/C49Hg==$0                                                                                                   C
BIN$XwcAP0AmShWTIY8SzczGww==$0                                                                                                   C
BIN$Perz2nC+R9OFIvsm1nSuZw==$0                                                                                                   C
BIN$67uwfdR1TtWdPoPwKXGtzg==$0                                                                                                   C
BIN$DxaMnkThR/GANigp4UUpNw==$0                                                                                                   C
BIN$/vUCjpDPRoawhln8oBRWSw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$mkeF6rUwSP2cfDA7buaRig==$0                                                                                                   C
BIN$1LyTccUUR8WB6SJw2jGUaA==$0                                                                                                   C
BIN$eSDkt4i+RIWjvwrx8BySuQ==$0                                                                                                   C
BIN$KPOniqhUQJS2rrv4K+RCeQ==$0                                                                                                   C
BIN$R2r3NMzHRwGKy3QH/lLYKQ==$0                                                                                                   C
BIN$5cDdRsNhRb2ghAAUmCn6Ww==$0                                                                                                   C
BIN$WJwEMgwqQy+/Yi6WH49jCg==$0                                                                                                   C
BIN$a0B/qTRaQG2K10EHyO/JkQ==$0                                                                                                   C
BIN$1ZmwSqMfSpCHgyeOZ081Yw==$0                                                                                                   C
BIN$zNJYcAUrRfW1Tt9buU4Eaw==$0                                                                                                   C
BIN$JuYuYNqTREuCSc1Q9DnGEg==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$/8E9R+12Ti+kF4Vutmy77Q==$0                                                                                                   C
BIN$8nc6thDMQje08CkB4ROJbA==$0                                                                                                   C
BIN$kpmRJwWFSn2LUZwUra4FBQ==$0                                                                                                   C
BIN$gGfV8m/dQgyokZR52Xg2fg==$0                                                                                                   C
BIN$SqbvmGroRp6bAyzR4+13uA==$0                                                                                                   C
BIN$fB/mwar8T3a4uE/7dmYYbw==$0                                                                                                   C
BIN$iIqCTSY9QBO0Xhipa2IXDQ==$0                                                                                                   C
BIN$DHXdz/pxRRiIdZeYah7quQ==$0                                                                                                   C
BIN$VpEs3GR4SHC6mRzzlOA9aA==$0                                                                                                   C
BIN$oqFiQRijShqoCY3KveUnag==$0                                                                                                   C
BIN$17vlV/N4SgqSF7aInaJtPw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$LfN/lc96SD2ltqZi5vwefg==$0                                                                                                   C
BIN$NJymgdF2SnuEeYOp/oRuUw==$0                                                                                                   C
BIN$D8o8YU3mT0GsSS0IO9iv0Q==$0                                                                                                   C
BIN$rrCvJ3OHTuOyhGBcZFauDA==$0                                                                                                   C
BIN$tO8bAftUTzykTBBzA21ptQ==$0                                                                                                   C
BIN$dUTHQyDXQPSCX9L9nOc7vw==$0                                                                                                   C
BIN$KpdfEV/pR8OCe3kpT7ZIQw==$0                                                                                                   C
BIN$XKNrrPbsSUSxD1n2mPVkqg==$0                                                                                                   C
BIN$I9fkqQ8bTMWpOC39aJ+LsQ==$0                                                                                                   C
BIN$ww372PWOQTyzMt7U8erAnA==$0                                                                                                   C
BIN$/wVtlsFKR3eGGPXyJGiIhQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$G2XVcaUUR5KvkeQliRGsug==$0                                                                                                   C
BIN$qFdLVBjMT4mkfvBe+zKkYQ==$0                                                                                                   C
BIN$FocpDUKXSuCEuPPUdWuwgQ==$0                                                                                                   C
BIN$+KGESHHdRtuDMLvkRDwU8A==$0                                                                                                   C
BIN$j5e0y9ZHRnCazTzvUChykA==$0                                                                                                   C
BIN$3hI18TxvSveWdQGMrOzG1A==$0                                                                                                   C
BIN$VhrfG6gtRCiWV3qMkHkXgg==$0                                                                                                   C
BIN$b3hCaPEORwuEVLMQvuQOAQ==$0                                                                                                   C
BIN$GzBQCGbpQsimkxV9feljHw==$0                                                                                                   C
BIN$pOvRRHJDTH++keK9JSF1og==$0                                                                                                   C
BIN$+hVi8K5+SgC272dee5xGCw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$Z63akwi8QaaHgihnQwC5bg==$0                                                                                                   C
BIN$y6TksUj7Tc+QYTqFg87kmw==$0                                                                                                   C
BIN$H0vQsEo2S1+jQ9DRPpstXA==$0                                                                                                   C
BIN$BqMYnjExTOed4/yzCl+0pg==$0                                                                                                   C
BIN$6oDq0fpWRdehvs6pDe1RCg==$0                                                                                                   C
BIN$qT9ZhN1+TZK1ao4ajbA71A==$0                                                                                                   C
BIN$rZ1IJoMDQzGhwo9i6ztIKA==$0                                                                                                   C
BIN$dlETgohSTwuyobQ5wxy9Yg==$0                                                                                                   C
BIN$YjOysLClTB2IW6q3ZQ6Luw==$0                                                                                                   C
BIN$LFGMGX+GROKNuu8pyDyf7g==$0                                                                                                   C
BIN$nWyfnDUuQByoiJCKMhK+Vw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$P2k0q9zfRKam9gTfqSiN5A==$0                                                                                                   C
BIN$yLur7KjaRUaW5yyjP5FPpQ==$0                                                                                                   C
BIN$gT55bDHeRd+MjqZKu79CKg==$0                                                                                                   C
BIN$IJ9+X8DORdKNzDlU4XXhtg==$0                                                                                                   C
BIN$5/rMnRRxRBG933ApiiOEAg==$0                                                                                                   C
BIN$z4xEHhqnTaaHWvtpJu31ow==$0                                                                                                   C
BIN$kA59X4Q+RdqxH5VOvcLh+g==$0                                                                                                   C
BIN$XS7XEbKvSaOQSKMW1VdCZw==$0                                                                                                   C
BIN$cSn2IneBTP2NkJttvL+4mA==$0                                                                                                   C
BIN$k3QybUO3TmeL5AvKQxMezg==$0                                                                                                   C
BIN$DLQaLKWWQkqDwC6IGcW9yQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$BL2y8pJLQLGQ9Lyttbt/LQ==$0                                                                                                   C
BIN$wNAAKpDnRUSLqIBtQNgg7A==$0                                                                                                   C
BIN$XhYR4ZxsQAqDsDDqgsycbA==$0                                                                                                   C
BIN$qX+MfLXRRJqW6pIq/Cjp7A==$0                                                                                                   C
BIN$3zq/XDW9Rf2WV/w8HAH4WQ==$0                                                                                                   C
BIN$SjP9A6ZfT4Sg5yJFpYHj1g==$0                                                                                                   C
BIN$K2tqDTUzR++zDGPJeYZZ4Q==$0                                                                                                   C
BIN$yuprPAj0TMiF0D/k3HMbVg==$0                                                                                                   C
BIN$Cjk7UDk5QUeaKqym7aHfnQ==$0                                                                                                   C
BIN$NJv+5nxJTyeQLzJy7+5+uw==$0                                                                                                   C
BIN$Jp0/Qyg6Q6+oxnYIXOaIEQ==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$1amR7PMfSoeYKe1TGd38Cw==$0                                                                                                   C
BIN$uFiTxliiTjCfYvXjK+m8TQ==$0                                                                                                   C
BIN$Dx+lfe3vTNC8sb003AG9gA==$0                                                                                                   C
BIN$8BfosHKDT+S17nQMBYD60g==$0                                                                                                   C
BIN$z16ei0UQRQ2ReNz+IRTVcQ==$0                                                                                                   C
BIN$iydM21lkT2i1SajEijgNXA==$0                                                                                                   C
BIN$lGMJhi5eReSwuW7I3M8GmA==$0                                                                                                   C
BIN$8vm3mLiORCydECLPS8+5lQ==$0                                                                                                   C
BIN$YqVGzLMpRkG50Rpsr5c8Dw==$0                                                                                                   C
BIN$1TVsnbaHTem1qAOIlLfiGw==$0                                                                                                   C
HERO_POWER_LEVEL_CK                                                                                                              C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
HERO_HERO_TYPE_CK                                                                                                                C
HERO_HERO_TYPE_NN                                                                                                                C
BIN$V6Q1PFWZRHqYr737pkcTkA==$0                                                                                                   C
BIN$6QQ/P0psSKihj9UAAEMBrg==$0                                                                                                   C
BIN$enG8Cu8xTCqI0SSBhUVk5g==$0                                                                                                   C
BIN$rxJn8+sLSvWgmo3kWnB9Uw==$0                                                                                                   C
BIN$NWxjJvdQQ0uxpoxeqgrLqg==$0                                                                                                   C
BIN$QKt/A9zJRPOgp3r9sWK+KQ==$0                                                                                                   C
BIN$1tAjT3lpRZ6WVRImfWknMw==$0                                                                                                   C
BIN$hpe4BiDDTSqGfRh59lgiLQ==$0                                                                                                   C
BIN$QKjnG09fRTaLriDnIwJV6w==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$MvZes05qS9C4xtxTMDC26Q==$0                                                                                                   C
BIN$XFNhcPm7QeuZEk4iDupgiw==$0                                                                                                   C
BIN$FuZWjIEJQNq/EgjCTESdIA==$0                                                                                                   C
BIN$Mq8fly4LRrWtcxsfTsWG/A==$0                                                                                                   C
BIN$0o1bs1pYSIShJN5nL7kv5w==$0                                                                                                   C
BIN$ZmTFd0r3QKGdqRcfnOkIqA==$0                                                                                                   C
BIN$zxLRv2w4SBSJK953xzJUhQ==$0                                                                                                   C
BIN$riiQu6BGSD2Aas6G2V2u1Q==$0                                                                                                   C
BIN$cm5UeNLBQkGrR/Y/JT9H8w==$0                                                                                                   C
BIN$4pkDUqDbTlS3NpITQ7ARtw==$0                                                                                                   C
BIN$t1ueNtFsTpmH70/MVajWMw==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$zeGKM/DvSV+GlD3PpGfdGQ==$0                                                                                                   C
BIN$llMcJhofQFm1B5SPMY9zMQ==$0                                                                                                   C
BIN$8I1omfbiRy6qRhzYhRhgdQ==$0                                                                                                   C
BIN$mUuXTYZKQTGu9ka3m2fVQg==$0                                                                                                   C
BIN$b/hk7CEmSomhBam6nrU/7w==$0                                                                                                   C
BIN$6szw+dmJRN2Z0cc0byERRQ==$0                                                                                                   C
SYS_C0011057                                                                                                                     C
SYS_C0011058                                                                                                                     C
SYS_C0011059                                                                                                                     C
CK_TYPE                                                                                                                          C
SYS_C0011061                                                                                                                     C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C0011062                                                                                                                     C
SYS_C0011063                                                                                                                     C
SYS_C0011064                                                                                                                     C
SYS_C0011065                                                                                                                     C
SYS_C0011066                                                                                                                     C
CK_STATUS                                                                                                                        C
CK_PHONE                                                                                                                         C
CK_EMAIL                                                                                                                         C
SYS_C0011074                                                                                                                     C
SYS_C0011075                                                                                                                     C
SYS_C0011076                                                                                                                     C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C0011077                                                                                                                     C
SYS_C0011078                                                                                                                     C
SYS_C0011079                                                                                                                     C
SYS_C0011080                                                                                                                     C
SYS_C0011081                                                                                                                     C
CK_PROV                                                                                                                          C
CK_POSTAL                                                                                                                        C
CK_PHONE_INS                                                                                                                     C
CK_EMAIL_INS                                                                                                                     C
CK_CRED_STATUS                                                                                                                   C
BIN$Jt2d81x1ST2ylNRoslNn3w==$0                                                                                                   C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C009880                                                                                                                      C
SYS_C009881                                                                                                                      C
SYS_C009882                                                                                                                      C
SYS_C009918                                                                                                                      C
BIN$o5I40iQyQ56h9IX2M/cp3Q==$0                                                                                                   C
BIN$AgkR390ITt+zkrvxzisnrA==$0                                                                                                   C
BIN$pBCAP6eHRQOEjt77jVALPw==$0                                                                                                   C
BIN$gq7vbpAfSn+f+WCkvfqWZw==$0                                                                                                   C
BIN$FAJ8CBuzQTWNjjeWKhOctA==$0                                                                                                   C
BIN$anDn+0QkSNmwZ4wVKLJhjg==$0                                                                                                   C
DEST_CITY_NN                                                                                                                     C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
DEST_COUNTRY_NN                                                                                                                  C
SYS_C009924                                                                                                                      C
DEST_COUNTRY_CK                                                                                                                  C
RATING_DESC_NN                                                                                                                   C
T_REGION_CK                                                                                                                      C
TR_NN                                                                                                                            C
TOUR_DESC_NN                                                                                                                     C
TOUR_RATING_CODE_NN                                                                                                              C
SYS_C009938                                                                                                                      C
A_LAST_NAME_NN                                                                                                                   C
SYS_C009940                                                                                                                      C

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
SYS_C009941                                                                                                                      C
AGENT_LEVEL_CK                                                                                                                   C
AGENT_SPECIALITY_CK                                                                                                              C
SYS_C009945                                                                                                                      C
SYS_C009946                                                                                                                      C
SYS_C009947                                                                                                                      C
SYS_C009948                                                                                                                      C
SYS_C009949                                                                                                                      C
SYS_C009950                                                                                                                      C
CUSTOMERS_CUSTOMER#_PK                                                                                                           P
ORDERS_ORDER#_PK                                                                                                                 P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
PUBLISHER_PUBID_PK                                                                                                               P
AUTHOR_AUTHORID_PK                                                                                                               P
BOOKS_ISBN_PK                                                                                                                    P
ORDERITEMS_PK                                                                                                                    P
BOOKAUTHOR_PK                                                                                                                    P
ACCTMANAGER_AMID_PK                                                                                                              P
ACCTBONUS_AMID_PK                                                                                                                P
BIN$y1NROvqkRgCQWoBk2qTZYg==$0                                                                                                   P
BIN$uLyHa8VgSBmrb7E++6HSjg==$0                                                                                                   P
BIN$OJnyZOyyQuyEXiV6Fie9hQ==$0                                                                                                   P
BIN$tMHAD59YTvqaQUnlfH+RUw==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$EG1srDC5Qxih10KVvIvFyw==$0                                                                                                   P
BIN$L7a9HbJjQfmmTL9Xs+/dUQ==$0                                                                                                   P
BIN$mMT1sGlfTHuykuY2t2bWaA==$0                                                                                                   P
BIN$SUdW7ft7RN6EbPvS2IoFcg==$0                                                                                                   P
BIN$AQeXEOncRXGZRjgCVuGQ9Q==$0                                                                                                   P
BIN$hO4/UGa7S46sxRBJA6Wcdg==$0                                                                                                   P
BIN$kPkv8C4YRCyTiLr/NJWSWw==$0                                                                                                   P
BIN$QQvo+kwkSOCdHljIUAv6qA==$0                                                                                                   P
BIN$KKUPNt1XQSiMFwE6DlxbNg==$0                                                                                                   P
BIN$Ap7lEhxaSq6dXSElNENTPQ==$0                                                                                                   P
BIN$QA44XTccTW2xMmvO7/H8Pg==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$UnZgpsm7TRyGI5OS7xwtcA==$0                                                                                                   P
BIN$cvB01xBiRqKa0AdHRgb4ag==$0                                                                                                   P
BIN$1AJR/rP1TxKMJGoStZEMTQ==$0                                                                                                   P
BIN$jtwAMnrsTKeU8sUCRF2DwA==$0                                                                                                   P
BIN$XXw6wPUMQQ2NZapD/3r1Gw==$0                                                                                                   P
BIN$i+chRFWRTo+PcI2OSgZ4wA==$0                                                                                                   P
BIN$hS4mmwzQSIGc1H+HrdDVzw==$0                                                                                                   P
BIN$9PPY9gTGSJS7oz4zWb3AGA==$0                                                                                                   P
BIN$pNRZl3JtQia/1fEP+/jGgQ==$0                                                                                                   P
BIN$zNOu70izRbyJLNpYB5yq0g==$0                                                                                                   P
BIN$MJUNWL9oQ3WeXQ60CwB7WQ==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$8TRiJPaPTVyKyhQkdL3Bvw==$0                                                                                                   P
BIN$eCUSpGvIQZap7M+zYnXzEQ==$0                                                                                                   P
BIN$3CQ9gTFmTcK6e5MYXbp4Tw==$0                                                                                                   P
BIN$zxlXcFM5SgqEH23fOSj2lw==$0                                                                                                   U
BIN$BZS5Hj8vTG+eKxkqXEfV1g==$0                                                                                                   P
BIN$XCCar6dhQuyPNupecOKJKw==$0                                                                                                   U
BIN$BWs4c0BoToGOy73Ch7Qr3w==$0                                                                                                   P
BIN$Si9K9wwNSLu2MZev20B64g==$0                                                                                                   P
BIN$A+rXTy2ZQfSX5EbijPJzzw==$0                                                                                                   P
SYS_C009795                                                                                                                      P
BIN$JEY+o24SQ4Kpu7UN5oJetw==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$yX8PT/hoRYmxXm9I9OaJmA==$0                                                                                                   P
BIN$UPf3NI/6RqWJ7JdH3mMWJw==$0                                                                                                   U
BIN$/OWx9ID2Rf2JwUe2vtd1yQ==$0                                                                                                   P
BIN$Tay9sgslQMKDxh8f7zDPwA==$0                                                                                                   P
BIN$cIdip03BQd6xtBXh1QwWrw==$0                                                                                                   P
BIN$4+sY0dqpRDq70sR6pAh18w==$0                                                                                                   U
BIN$N7XapUIeSZm7k18ftkhhEA==$0                                                                                                   P
BIN$cZkAP1rRQJ2tgdG/6ieQkQ==$0                                                                                                   U
SYS_C009883                                                                                                                      P
BIN$qQPUY72oQ4qPHZFDoPO40Q==$0                                                                                                   P
BIN$dugVXyz0TgC2k+VGcoznlw==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$kg1Cn/UPTFqwHerP7FnxRA==$0                                                                                                   P
BIN$nMB1/mICQM6oLiGEWJmgqQ==$0                                                                                                   U
SYS_C009908                                                                                                                      P
BIN$c0vtwQdfTEqX8eQp5nEGpA==$0                                                                                                   P
SYS_C009919                                                                                                                      P
DESTINATION_PK                                                                                                                   P
RATING_PK                                                                                                                        P
VT_PK                                                                                                                            P
TD_PK                                                                                                                            P
AGENT_PK                                                                                                                         P
CUSTOMER_PK                                                                                                                      P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
TC_PK                                                                                                                            P
TRAINING_PK                                                                                                                      P
AT_PK                                                                                                                            P
BIN$7KV70xY6RkG0Th0mivsPgQ==$0                                                                                                   P
BIN$rg6AOKGbRJ+CSqHu+Bk4AQ==$0                                                                                                   U
BIN$hHsURthVTZ2rTg3/tl8WBg==$0                                                                                                   P
BIN$uraZGgGHR/ypffDmyYSA6g==$0                                                                                                   U
BIN$W5cnJ5YFS5Wy4vBuAWAtZg==$0                                                                                                   P
BIN$IEYTNLxDQgW+WHQuhstEQA==$0                                                                                                   U
BIN$N42xlyZUTiCKuQw/JNjHsQ==$0                                                                                                   P
BIN$XRCo9sYvQgayJO2+lMQxzQ==$0                                                                                                   U

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$bTke9TFHRAuphwZ8sGcgtA==$0                                                                                                   P
BIN$1IWVT91jQNODn+6hJ2V7WQ==$0                                                                                                   U
BIN$Q9c6vBzJSIOA81eJr3pTKQ==$0                                                                                                   P
BIN$Kzs4uSlyQGiLTN8hGapdRQ==$0                                                                                                   U
SYS_C0010197                                                                                                                     P
SYS_C0010198                                                                                                                     U
BIN$LfMoQ9SOSJGfRcU0Wi5d2Q==$0                                                                                                   P
SYS_C0010207                                                                                                                     P
SYS_C0010208                                                                                                                     P
BIN$l7gy5KD2RTqpyedAS/mNsA==$0                                                                                                   P
BIN$SCJfoBNUT7q4D3xicURojA==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$7lq2dWBzQ8Sboj1KgngJKg==$0                                                                                                   P
BIN$IV0Bhm+HRC6ltcxTk69VgA==$0                                                                                                   P
BIN$UHY+2oLERiWPo90R/vLfww==$0                                                                                                   P
BIN$fw5/GwCqReemFWrjO/BbKw==$0                                                                                                   P
BIN$a2XTxPtwRPu7DR0S1q51Hw==$0                                                                                                   P
BIN$8xtjesWaTniJ44GxhmXiTQ==$0                                                                                                   P
BIN$57si9A1zSrSlIw3c0crxXQ==$0                                                                                                   P
BIN$kuwVDkiuSKmuuEFJBh2pSA==$0                                                                                                   P
BIN$8lrlq3rbQAux1K/h6pW4yw==$0                                                                                                   P
BIN$j3eAYRjXSpWE04rdlw6lDw==$0                                                                                                   P
BIN$dEbDmND0Q0GrtAUADxOgvQ==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$uQe7/6zGRiSeSqrXSOxHvw==$0                                                                                                   P
BIN$I08eJKQkS0us+a3OWzQTNg==$0                                                                                                   P
BIN$RQR6x0CAS5ySWJI2+USxEg==$0                                                                                                   P
BIN$zVOaOhi9QjGyb1pofmKrAg==$0                                                                                                   P
BIN$6ENTce/3TdunlMuahVOOkg==$0                                                                                                   P
BIN$LfM95/NTT/SBh+tqwzI53g==$0                                                                                                   P
BIN$itEWybMDQ5CEcK6LmLnlVQ==$0                                                                                                   P
BIN$RulR1jukRVGqeZ/9kgZjNQ==$0                                                                                                   P
BIN$vhVi9hYCScWK0JBB0uRJpg==$0                                                                                                   P
BIN$nP8TfH3FRyacNiYDhGiBJw==$0                                                                                                   P
BIN$7BWN5zRPSdGkygEVa0wZbQ==$0                                                                                                   P

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$jmtyAPxXQCytC/gQHgBrtQ==$0                                                                                                   P
BIN$d3eWEP44T466Hgo1fY0Y0Q==$0                                                                                                   P
BIN$r18eRPliSSKHlgrOGlnNrw==$0                                                                                                   P
BIN$LmNDYICPRdWPxOBDtoDasA==$0                                                                                                   P
BIN$kMHufCEyRAupupuUU0tJHw==$0                                                                                                   P
BIN$KykEsbGSRryWkvpOPGmkLw==$0                                                                                                   P
BIN$UJJWH38dSy+18gBkHsgUnA==$0                                                                                                   P
BIN$4tmaS+ELSTCpPxkscrmEHg==$0                                                                                                   U
BIN$Gkg628xHTLyOBiUYD6j7Sw==$0                                                                                                   U
BIN$02naxXBnRTi7/3hDDKapcQ==$0                                                                                                   P
BIN$gXR2uNvTRBKC1d3j0+k0ag==$0                                                                                                   U

NAME                                                                                                                             T
-------------------------------------------------------------------------------------------------------------------------------- -
BIN$vvcybPcbR/CgmYx+E9ylxA==$0                                                                                                   U
HERO_ID_PK                                                                                                                       P
BIN$7xmRLLaWTyqRVuTYHzEedA==$0                                                                                                   U
HERO_HERO_NAME_UK                                                                                                                U
BIN$MbJOxyrNRYOLEzq6jE+05Q==$0                                                                                                   U
MISSION_MISSION_ID_UK                                                                                                            U
HERO_HERO_ID_PK                                                                                                                  P
STUDENT_STUDENT_ID_PK                                                                                                            P
INSTRUCTOR_INSTRUCTOR_ID_PK                                                                                                      P
STUDENT_CREDENTIAL_CREDENTIAL#_PK                                                                                                P

505 rows selected. 

SQL> 
SQL> spool off
