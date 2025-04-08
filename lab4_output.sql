SQL> begin
  2  	execute immediate 'DROP TABLE student_course_record CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE instructor_scheduled_course CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE credential_course CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE student_credentials CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE scheduled_course CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE instructor CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE student CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE course CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> begin
  2  	execute immediate 'DROP TABLE credential CASCADE CONSTRAINTS';
  3  exception
  4  	when others then
  5  	   null;
  6  end;
  7  /

PL/SQL procedure successfully completed.

SQL> 
SQL> 	set echo on
SQL> --drop tables in reverse order with CASCADE option
SQL> drop table student_course_record cascade constraints;
drop table student_course_record cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table instructor_scheduled_course cascade constraints;
drop table instructor_scheduled_course cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table credential_course cascade constraints;
drop table credential_course cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table student_credentials cascade constraints;
drop table student_credentials cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table scheduled_course cascade constraints;
drop table scheduled_course cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table instructor cascade constraints;
drop table instructor cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table student cascade constraints;
drop table student cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table course cascade constraints;
drop table course cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table credential cascade constraints;
drop table credential cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> --Column level constraints
SQL> --parent: Credential
SQL> create table credential (
  2  	credential# char(20) primary key,
  3  	school	    varchar2(250) not null,
  4  	name	    varchar2(22) not null,
  5  	type	    char(2) not null
  6  );

Table created.

SQL> 
SQL> --Table level constraints
SQL> --parent: student
SQL> create table student (
  2  	student_id    number(9) primary key,
  3  	first_name    varchar2(250) not null,
  4  	last_name     varchar2(250) not null,
  5  	status	      char(1) not null,
  6  	status_date   date not null,
  7  	phone_number  char(12) not null,
  8  	email_address varchar2(100) not null,
  9  	constraint ck_status
 10  	   check ( status in ( 'A', --active
 11  			       'AP', --academic
 12  			       'S', --suspened
 13  			       'E' ) ), --expelled
 14  	constraint ck_phone check ( regexp_like ( phone_number,
 15  						  '^\d{3}\.\d{3}\.\d{4}$' ) ), --999.999.9999
 16  	constraint ck_email check ( regexp_like ( email_address,
 17  						  '^[^@]+@[^@]+\.[^@]+$' ) ) -- username@domain.com
 18  );

Table created.

SQL> 
SQL> --parent: course
SQL> create table course (
  2  	course_code	   char(7) primary key,
  3  	name		   varchar2(250) not null,
  4  	num_of_credits	   number(1) not null,
  5  	prereq_course_code char(7),
  6  	type_flag	   char(1) check ( type_flag in ( '0',
  7  						 '1' ) ), --bool, '0' = false, '1' = true
  8  	constraint ck_credits check ( num_of_credits between 1 and 9 ),
  9  	constraint ck_course_code_format check ( regexp_like ( course_code,
 10  							       '^[A-Z]{4}[0-9]{3}$' ) ) --LLL999
 11  );

Table created.

SQL> 
SQL> --parent: instructor
SQL> create table instructor (
  2  	instructor_id number(9) primary key,
  3  	first_name    varchar2(250) not null,
  4  	last_name     varchar2(250) not null,
  5  	address       varchar2(100) not null,
  6  	city	      varchar2(50) not null,
  7  	prov	      char(2) not null,
  8  	postal_code   char(7) not null,
  9  	phone_number  char(12) not null,
 10  	email	      varchar2(100) not null,
 11  	constraint ck_prov check ( regexp_like ( prov,
 12  						 '^[A-Z]{2}$' ) ), --LL
 13  	constraint ck_postal check ( regexp_like ( postal_code,
 14  						   '^[A-Z][0-9][A-Z] [0-9][A-Z][0-9]$' ) ), --L9L9L9
 15  	constraint ck_phone_ins check ( regexp_like ( phone_number,
 16  						      '^[0-9]{3}\\.[0-9]{3}\\.[0-9]{4}$' ) ), --999.999.9999
 17  	constraint ck_email_ins check ( regexp_like ( email,
 18  						      '^[^@]+@[^@]+\\.[^@]+$' ) ) --usernmae@domain.com
 19  );

Table created.

SQL> 
SQL> -- Child: SCHEDULED_COURSE (depends on COURSE)
SQL> create table scheduled_course (
  2  	crn	      number(5),
  3  	semester_code number(6),
  4  	course_code   char(7),
  5  	section_code  char(1),
  6  	primary key ( crn ),
  7  	foreign key ( course_code )
  8  	   references course ( course_code ),
  9  	constraint ck_crn check ( regexp_like ( crn,
 10  						'^[0-9]{5}$' ) ), --99999
 11  	constraint ck_semester check ( regexp_like ( semester_code,
 12  						     '^[0-9]{6}$' ) ), --YYYYSS
 13  	constraint ck_section check ( regexp_like ( section_code,
 14  						    '^[A-Z]$' ) ) --L
 15  );

Table created.

SQL> 
SQL> -- Child: STUDENT_CREDENTIALS (depends on STUDENT, CREDENTIAL)
SQL> create table student_credentials (
  2  	credential#	  char(20),
  3  	student_id	  number(9),
  4  	start_date	  date,
  5  	completion_date   date,
  6  	credential_status char(1),
  7  	gpa		  number(2,1),
  8  	primary key ( credential#,
  9  		      student_id ),
 10  	foreign key ( credential# )
 11  	   references credential ( credential# ),
 12  	foreign key ( student_id )
 13  	   references student ( student_id ),
 14  	constraint ck_cred_status
 15  	   check ( credential_status in ( 'A', --active
 16  					  'G', --granted
 17  					  'E' ) ) --expired
 18  );

Table created.

SQL> 
SQL> -- Child: CREDENTIAL_COURSE (depends on CREDENTIAL, COURSE)
SQL> create table credential_course (
  2  	credential# char(20),
  3  	course_code char(7),
  4  	primary key ( credential#,
  5  		      course_code ),
  6  	foreign key ( credential# )
  7  	   references credential ( credential# ),
  8  	foreign key ( course_code )
  9  	   references course ( course_code )
 10  );

Table created.

SQL> 
SQL> -- Child: INSTRUCTOR_SCHEDULED_COURSE (depends on INSTRUCTOR, SCHEDULED_COURSE)
SQL> create table instructor_scheduled_course (
  2  	crn	      number(5),
  3  	semester_code number(6),
  4  	instructor_id number(9),
  5  	primary key ( crn,
  6  		      semester_code,
  7  		      instructor_id ),
  8  	foreign key ( crn )
  9  	   references scheduled_course ( crn ),
 10  	foreign key ( instructor_id )
 11  	   references instructor ( instructor_id )
 12  );

Table created.

SQL> 
SQL> -- Child: STUDENT_COURSE_RECORD (depends on STUDENT, SCHEDULED_COURSE, CREDENTIAL)
SQL> create table student_course_record (
  2  	crn	      number(5),
  3  	semester_code number(6),
  4  	student_id    number(9),
  5  	course_code   char(7),
  6  	credential#   char(20),
  7  	letter_grade  varchar2(2),
  8  	   primary key ( crn,
  9  			 semester_code,
 10  			 student_id,
 11  			 course_code,
 12  			 credential# ),
 13  	foreign key ( crn )
 14  	   references scheduled_course ( crn ),
 15  	foreign key ( student_id )
 16  	   references student ( student_id ),
 17  	foreign key ( credential# )
 18  	   references credential ( credential# ),
 19  	constraint ck_grade
 20  	   check ( letter_grade in ( 'A+',
 21  				     'A',
 22  				     'A-',
 23  				     'B+',
 24  				     'B',
 25  				     'B-',
 26  				     'C+',
 27  				     'C',
 28  				     'C-',
 29  				     'D+',
 30  				     'D',
 31  				     'F',
 32  				     'I' ) )
 33  );

Table created.

SQL> 
SQL> --alter
SQL> 
SQL> --coz this table is in column-level
SQL> alter table credential
  2  	add constraint ck_type
  3  	   check ( type in ( 'MI', --micro
  4  			     'FT', --fast track
  5  			     'CT', --certificate
  6  			     'DP', --diploma
  7  			     'AD', --applied degree
  8  			     'D' ) ); --degree
  9  
SQL> --modify column size
SQL> 
SQL> alter table course modify (
  2  	name varchar2(100)
  3  );

Table altered.

SQL> 
SQL> alter table student modify (
  2  	email_address varchar2(150)
  3  );

Table altered.

SQL> 
SQL> select table_name
  2    from user_tables
  3   where table_name in ( 'CREDENTIAL',
  4  			    'STUDENT',
  5  			    'COURSE',
  6  			    'INSTRUCTOR',
  7  			    'SCHEDULED_COURSE',
  8  			    'STUDENT_CREDENTIALS',
  9  			    'CREDENTIAL_COURSE',
 10  			    'INSTRUCTOR_SCHEDULED_COURSE',
 11  			    'STUDENT_COURSE_RECORD' );

TABLE_NAME                                                                      
--------------------------------------------------------------------------------
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
SQL> 
SQL> spool off
