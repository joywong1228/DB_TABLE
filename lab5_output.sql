SQL> 
SQL> set echo on
SQL> 
SQL> -- ==============================
SQL> -- DELETE in reverse order
SQL> -- ==============================
SQL> delete from student_course_record;

0 rows deleted.

SQL> delete from instructor_scheduled_course;

0 rows deleted.

SQL> delete from credential_course;

0 rows deleted.

SQL> delete from student_credentials;

0 rows deleted.

SQL> delete from scheduled_course;

0 rows deleted.

SQL> delete from instructor;

0 rows deleted.

SQL> delete from student;

0 rows deleted.

SQL> delete from course;

0 rows deleted.

SQL> delete from credential;

0 rows deleted.

SQL> 
SQL> -- ==========================================
SQL> -- Insert Sample Data for CPRG-250 Project
SQL> -- ==========================================
SQL> 
SQL> -- ================================
SQL> -- 1. Insert into STUDENT table
SQL> -- ================================
SQL> insert into student values ( 1001,
  2  				  'Alice',
  3  				  'Nguyen',
  4  				  'A',
  5  				  to_date('2023-09-01','YYYY-MM-DD'),
  6  				  '403.555.1234',
  7  				  'alice@example.com' );

1 row created.

SQL> insert into student values ( 1002,
  2  				  'Bob',
  3  				  'Chan',
  4  				  'AP',
  5  				  to_date('2023-09-15','YYYY-MM-DD'),
  6  				  '403.555.5678',
  7  				  'bob@example.com' );
                             'AP',
                             *
ERROR at line 4:
ORA-12899: value too large for column "SYSTEM"."STUDENT"."STATUS" (actual: 2, 
maximum: 1) 


SQL> insert into student values ( 1003,
  2  				  'Clara',
  3  				  'Smith',
  4  				  'S',
  5  				  to_date('2023-10-10','YYYY-MM-DD'),
  6  				  '403.555.9999',
  7  				  'clara@example.com' );

1 row created.

SQL> insert into student values ( 1004,
  2  				  'David',
  3  				  'Lee',
  4  				  'A',
  5  				  to_date('2023-08-20','YYYY-MM-DD'),
  6  				  '403.555.0001',
  7  				  'david@example.com' );

1 row created.

SQL> insert into student values ( 1005,
  2  				  'Eva',
  3  				  'Brown',
  4  				  'A',
  5  				  to_date('2023-11-01','YYYY-MM-DD'),
  6  				  '403.555.3333',
  7  				  'eva@example.com' );

1 row created.

SQL> 
SQL> -- ================================
SQL> -- 2. Insert into CREDENTIAL table
SQL> -- ================================
SQL> insert into credential values ( 'CT001',
  2  				     'Tech Institute',
  3  				     'Web Development',
  4  				     'CT' );

1 row created.

SQL> insert into credential values ( 'CT002',
  2  				     'Tech Institute',
  3  				     'UI/UX Design',
  4  				     'CT' );

1 row created.

SQL> insert into credential values ( 'DP001',
  2  				     'Tech Institute',
  3  				     'Software Development',
  4  				     'DP' );

1 row created.

SQL> insert into credential values ( 'DP002',
  2  				     'Tech Institute',
  3  				     'Cybersecurity',
  4  				     'DP' );

1 row created.

SQL> 
SQL> -- ===============================
SQL> -- 3. Insert into COURSE table (20 courses)
SQL> -- ===============================
SQL> insert into course values ( 'WDV1001',
  2  				 'HTML/CSS',
  3  				 3,
  4  				 null,
  5  				 '1' );
insert into course values ( 'WDV1001',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'WDV1002',
  2  				 'JavaScript Basics',
  3  				 3,
  4  				 'WDV1001',
  5  				 '1' );
insert into course values ( 'WDV1002',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'WDV1003',
  2  				 'React JS',
  3  				 3,
  4  				 'WDV1002',
  5  				 '1' );
insert into course values ( 'WDV1003',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'UXD1001',
  2  				 'UX Principles',
  3  				 3,
  4  				 null,
  5  				 '1' );
insert into course values ( 'UXD1001',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'UXD1002',
  2  				 'UI Design',
  3  				 3,
  4  				 'UXD1001',
  5  				 '1' );
insert into course values ( 'UXD1002',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'UXD1003',
  2  				 'Adobe XD',
  3  				 3,
  4  				 'UXD1002',
  5  				 '1' );
insert into course values ( 'UXD1003',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'SD1001',
  2  				 'Programming I',
  3  				 3,
  4  				 null,
  5  				 '1' );
insert into course values ( 'SD1001',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'SD1002',
  2  				 'Programming II',
  3  				 3,
  4  				 'SD1001',
  5  				 '1' );
insert into course values ( 'SD1002',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'SD1003',
  2  				 'Database Basics',
  3  				 3,
  4  				 null,
  5  				 '1' );
insert into course values ( 'SD1003',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'SD1004',
  2  				 'OOP in Java',
  3  				 3,
  4  				 'SD1002',
  5  				 '1' );
insert into course values ( 'SD1004',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'SD1005',
  2  				 'Data Structures',
  3  				 3,
  4  				 'SD1004',
  5  				 '1' );
insert into course values ( 'SD1005',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'CYB1001',
  2  				 'Networking',
  3  				 3,
  4  				 null,
  5  				 '1' );
insert into course values ( 'CYB1001',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'CYB1002',
  2  				 'Linux Admin',
  3  				 3,
  4  				 'CYB1001',
  5  				 '1' );
insert into course values ( 'CYB1002',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'CYB1003',
  2  				 'Ethical Hacking',
  3  				 3,
  4  				 'CYB1002',
  5  				 '1' );
insert into course values ( 'CYB1003',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'CYB1004',
  2  				 'Cyber Law',
  3  				 3,
  4  				 'CYB1003',
  5  				 '1' );
insert into course values ( 'CYB1004',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'CYB1005',
  2  				 'Security Audit',
  3  				 3,
  4  				 'CYB1004',
  5  				 '1' );
insert into course values ( 'CYB1005',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'GNR1001',
  2  				 'Communication Skills',
  3  				 2,
  4  				 null,
  5  				 '1' );
insert into course values ( 'GNR1001',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'GNR1002',
  2  				 'Team Projects',
  3  				 2,
  4  				 null,
  5  				 '1' );
insert into course values ( 'GNR1002',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'GNR1003',
  2  				 'Critical Thinking',
  3  				 2,
  4  				 null,
  5  				 '1' );
insert into course values ( 'GNR1003',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> insert into course values ( 'GNR1004',
  2  				 'Capstone Project',
  3  				 3,
  4  				 'GNR1002',
  5  				 '1' );
insert into course values ( 'GNR1004',
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_COURSE_CODE_FORMAT) violated 


SQL> 
SQL> -- ======================================
SQL> -- 4. Insert into CREDENTIAL_COURSE
SQL> -- - 2 certificates (2-3 courses each)
SQL> -- - 2 diplomas (5 courses each)
SQL> -- ======================================
SQL> -- Certificate: Web Development
SQL> insert into credential_course values ( 'CT001',
  2  					    'WDV1001' );
insert into credential_course values ( 'CT001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'CT001',
  2  					    'WDV1002' );
insert into credential_course values ( 'CT001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'CT001',
  2  					    'WDV1003' );
insert into credential_course values ( 'CT001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> 
SQL> -- Certificate: UI/UX Design
SQL> insert into credential_course values ( 'CT002',
  2  					    'UXD1001' );
insert into credential_course values ( 'CT002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'CT002',
  2  					    'UXD1002' );
insert into credential_course values ( 'CT002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'CT002',
  2  					    'UXD1003' );
insert into credential_course values ( 'CT002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> 
SQL> -- Diploma: Software Development
SQL> insert into credential_course values ( 'DP001',
  2  					    'SD1001' );
insert into credential_course values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP001',
  2  					    'SD1002' );
insert into credential_course values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP001',
  2  					    'SD1003' );
insert into credential_course values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP001',
  2  					    'SD1004' );
insert into credential_course values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP001',
  2  					    'SD1005' );
insert into credential_course values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> 
SQL> -- Diploma: Cybersecurity
SQL> insert into credential_course values ( 'DP002',
  2  					    'CYB1001' );
insert into credential_course values ( 'DP002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP002',
  2  					    'CYB1002' );
insert into credential_course values ( 'DP002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP002',
  2  					    'CYB1003' );
insert into credential_course values ( 'DP002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP002',
  2  					    'CYB1004' );
insert into credential_course values ( 'DP002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> insert into credential_course values ( 'DP002',
  2  					    'CYB1005' );
insert into credential_course values ( 'DP002',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011025) violated - parent key not 
found 


SQL> 
SQL> -- ===================================
SQL> -- 5. Insert into SCHEDULED_COURSE
SQL> -- Assume all in semester 202401
SQL> -- ===================================
SQL> insert into scheduled_course values ( 10101,
  2  					   202401,
  3  					   'WDV1001',
  4  					   'A' );
insert into scheduled_course values ( 10101,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10102,
  2  					   202401,
  3  					   'WDV1002',
  4  					   'A' );
insert into scheduled_course values ( 10102,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10103,
  2  					   202401,
  3  					   'WDV1003',
  4  					   'A' );
insert into scheduled_course values ( 10103,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10104,
  2  					   202401,
  3  					   'UXD1001',
  4  					   'A' );
insert into scheduled_course values ( 10104,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10105,
  2  					   202401,
  3  					   'UXD1002',
  4  					   'A' );
insert into scheduled_course values ( 10105,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10106,
  2  					   202401,
  3  					   'UXD1003',
  4  					   'A' );
insert into scheduled_course values ( 10106,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10107,
  2  					   202401,
  3  					   'SD1001',
  4  					   'A' );
insert into scheduled_course values ( 10107,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10108,
  2  					   202401,
  3  					   'SD1002',
  4  					   'A' );
insert into scheduled_course values ( 10108,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10109,
  2  					   202401,
  3  					   'SD1003',
  4  					   'A' );
insert into scheduled_course values ( 10109,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10110,
  2  					   202401,
  3  					   'SD1004',
  4  					   'A' );
insert into scheduled_course values ( 10110,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10111,
  2  					   202401,
  3  					   'SD1005',
  4  					   'A' );
insert into scheduled_course values ( 10111,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10112,
  2  					   202401,
  3  					   'CYB1001',
  4  					   'A' );
insert into scheduled_course values ( 10112,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10113,
  2  					   202401,
  3  					   'CYB1002',
  4  					   'A' );
insert into scheduled_course values ( 10113,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10114,
  2  					   202401,
  3  					   'CYB1003',
  4  					   'A' );
insert into scheduled_course values ( 10114,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10115,
  2  					   202401,
  3  					   'CYB1004',
  4  					   'A' );
insert into scheduled_course values ( 10115,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> insert into scheduled_course values ( 10116,
  2  					   202401,
  3  					   'CYB1005',
  4  					   'A' );
insert into scheduled_course values ( 10116,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011018) violated - parent key not 
found 


SQL> 
SQL> -- ===================================
SQL> -- 6. Insert into STUDENT_CREDENTIALS
SQL> -- - 2 students with 1 credential
SQL> -- - 1 student with 2 credentials
SQL> -- ===================================
SQL> insert into student_credentials values ( 'CT001',
  2  					      1001,
  3  					      to_date('2023-09-01','YYYY-MM-DD'),
  4  					      null,
  5  					      'A',
  6  					      3.5 );

1 row created.

SQL> insert into student_credentials values ( 'DP001',
  2  					      1002,
  3  					      to_date('2023-09-01','YYYY-MM-DD'),
  4  					      null,
  5  					      'A',
  6  					      3.8 );
insert into student_credentials values ( 'DP001',
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011022) violated - parent key not 
found 


SQL> insert into student_credentials values ( 'CT002',
  2  					      1003,
  3  					      to_date('2023-09-01','YYYY-MM-DD'),
  4  					      null,
  5  					      'A',
  6  					      3.4 );

1 row created.

SQL> insert into student_credentials values ( 'DP002',
  2  					      1003,
  3  					      to_date('2023-09-01','YYYY-MM-DD'),
  4  					      null,
  5  					      'A',
  6  					      3.6 );

1 row created.

SQL> 
SQL> -- ===================================
SQL> -- 7. Insert into STUDENT_COURSE_RECORD
SQL> -- - Insert 20 records
SQL> -- ===================================
SQL> insert into student_course_record values ( 10101,
  2  						202401,
  3  						1001,
  4  						'WDV1001',
  5  						'CT001',
  6  						'A' );
insert into student_course_record values ( 10101,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10102,
  2  						202401,
  3  						1001,
  4  						'WDV1002',
  5  						'CT001',
  6  						'B+' );
insert into student_course_record values ( 10102,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10103,
  2  						202401,
  3  						1001,
  4  						'WDV1003',
  5  						'CT001',
  6  						'A-' );
insert into student_course_record values ( 10103,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10107,
  2  						202401,
  3  						1002,
  4  						'SD1001',
  5  						'DP001',
  6  						'B' );
insert into student_course_record values ( 10107,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011032) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10108,
  2  						202401,
  3  						1002,
  4  						'SD1002',
  5  						'DP001',
  6  						'A' );
insert into student_course_record values ( 10108,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011032) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10109,
  2  						202401,
  3  						1002,
  4  						'SD1003',
  5  						'DP001',
  6  						'A-' );
insert into student_course_record values ( 10109,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011032) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10110,
  2  						202401,
  3  						1002,
  4  						'SD1004',
  5  						'DP001',
  6  						'B+' );
insert into student_course_record values ( 10110,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011032) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10111,
  2  						202401,
  3  						1002,
  4  						'SD1005',
  5  						'DP001',
  6  						'A' );
insert into student_course_record values ( 10111,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011032) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10104,
  2  						202401,
  3  						1003,
  4  						'UXD1001',
  5  						'CT002',
  6  						'A' );
insert into student_course_record values ( 10104,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10105,
  2  						202401,
  3  						1003,
  4  						'UXD1002',
  5  						'CT002',
  6  						'B+' );
insert into student_course_record values ( 10105,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10106,
  2  						202401,
  3  						1003,
  4  						'UXD1003',
  5  						'CT002',
  6  						'A' );
insert into student_course_record values ( 10106,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10112,
  2  						202401,
  3  						1003,
  4  						'CYB1001',
  5  						'DP002',
  6  						'B' );
insert into student_course_record values ( 10112,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10113,
  2  						202401,
  3  						1003,
  4  						'CYB1002',
  5  						'DP002',
  6  						'B+' );
insert into student_course_record values ( 10113,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10114,
  2  						202401,
  3  						1003,
  4  						'CYB1003',
  5  						'DP002',
  6  						'A-' );
insert into student_course_record values ( 10114,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10115,
  2  						202401,
  3  						1003,
  4  						'CYB1004',
  5  						'DP002',
  6  						'A' );
insert into student_course_record values ( 10115,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10116,
  2  						202401,
  3  						1003,
  4  						'CYB1005',
  5  						'DP002',
  6  						'A+' );
insert into student_course_record values ( 10116,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> -- extra to reach 20 records
SQL> insert into student_course_record values ( 10101,
  2  						202401,
  3  						1004,
  4  						'WDV1001',
  5  						'CT001',
  6  						'C' );
insert into student_course_record values ( 10101,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10102,
  2  						202401,
  3  						1004,
  4  						'WDV1002',
  5  						'CT001',
  6  						'B-' );
insert into student_course_record values ( 10102,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10103,
  2  						202401,
  3  						1004,
  4  						'WDV1003',
  5  						'CT001',
  6  						'C+' );
insert into student_course_record values ( 10103,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> insert into student_course_record values ( 10104,
  2  						202401,
  3  						1005,
  4  						'UXD1001',
  5  						'CT002',
  6  						'B' );
insert into student_course_record values ( 10104,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011031) violated - parent key not 
found 


SQL> 
SQL> -- ===================================
SQL> -- 8. Insert into INSTRUCTOR
SQL> -- - At least 10 instructors
SQL> -- ===================================
SQL> insert into instructor values ( 2001,
  2  				     'Sam',
  3  				     'Wong',
  4  				     '123 Main St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 1N4',
  8  				     '403.111.1111',
  9  				     'sam@institute.ca' );
insert into instructor values ( 2001,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2002,
  2  				     'Linda',
  3  				     'Taylor',
  4  				     '456 Oak St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 2B4',
  8  				     '403.222.2222',
  9  				     'linda@institute.ca' );
insert into instructor values ( 2002,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2003,
  2  				     'Mark',
  3  				     'Lee',
  4  				     '789 Pine St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 3C4',
  8  				     '403.333.3333',
  9  				     'mark@institute.ca' );
insert into instructor values ( 2003,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2004,
  2  				     'Jane',
  3  				     'Kim',
  4  				     '135 Maple St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 4D4',
  8  				     '403.444.4444',
  9  				     'jane@institute.ca' );
insert into instructor values ( 2004,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2005,
  2  				     'Tom',
  3  				     'Singh',
  4  				     '246 Birch St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 5E4',
  8  				     '403.555.5555',
  9  				     'tom@institute.ca' );
insert into instructor values ( 2005,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2006,
  2  				     'Emily',
  3  				     'Zhao',
  4  				     '357 Cedar St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 6F4',
  8  				     '403.666.6666',
  9  				     'emily@institute.ca' );
insert into instructor values ( 2006,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2007,
  2  				     'Alex',
  3  				     'Jones',
  4  				     '468 Fir St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 7G4',
  8  				     '403.777.7777',
  9  				     'alex@institute.ca' );
insert into instructor values ( 2007,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2008,
  2  				     'Sophia',
  3  				     'Chen',
  4  				     '579 Elm St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 8H4',
  8  				     '403.888.8888',
  9  				     'sophia@institute.ca' );
insert into instructor values ( 2008,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2009,
  2  				     'Lucas',
  3  				     'Brown',
  4  				     '680 Poplar St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 9I4',
  8  				     '403.999.9999',
  9  				     'lucas@institute.ca' );
insert into instructor values ( 2009,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> insert into instructor values ( 2010,
  2  				     'Nina',
  3  				     'Patel',
  4  				     '791 Ash St',
  5  				     'Calgary',
  6  				     'AB',
  7  				     'T2N 0J4',
  8  				     '403.000.0000',
  9  				     'nina@institute.ca' );
insert into instructor values ( 2010,
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.CK_EMAIL_INS) violated 


SQL> 
SQL> -- ===================================
SQL> -- 9. INSTRUCTOR_SCHEDULED_COURSE
SQL> -- - Link instructors to scheduled courses
SQL> -- ===================================
SQL> insert into instructor_scheduled_course values ( 10101,
  2  						      202401,
  3  						      2001 );
insert into instructor_scheduled_course values ( 10101,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10102,
  2  						      202401,
  3  						      2001 );
insert into instructor_scheduled_course values ( 10102,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10103,
  2  						      202401,
  3  						      2002 );
insert into instructor_scheduled_course values ( 10103,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10104,
  2  						      202401,
  3  						      2003 );
insert into instructor_scheduled_course values ( 10104,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10105,
  2  						      202401,
  3  						      2003 );
insert into instructor_scheduled_course values ( 10105,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10106,
  2  						      202401,
  3  						      2004 );
insert into instructor_scheduled_course values ( 10106,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10107,
  2  						      202401,
  3  						      2005 );
insert into instructor_scheduled_course values ( 10107,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10108,
  2  						      202401,
  3  						      2005 );
insert into instructor_scheduled_course values ( 10108,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10109,
  2  						      202401,
  3  						      2006 );
insert into instructor_scheduled_course values ( 10109,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10110,
  2  						      202401,
  3  						      2007 );
insert into instructor_scheduled_course values ( 10110,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10111,
  2  						      202401,
  3  						      2008 );
insert into instructor_scheduled_course values ( 10111,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10112,
  2  						      202401,
  3  						      2009 );
insert into instructor_scheduled_course values ( 10112,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10113,
  2  						      202401,
  3  						      2010 );
insert into instructor_scheduled_course values ( 10113,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10114,
  2  						      202401,
  3  						      2001 );
insert into instructor_scheduled_course values ( 10114,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10115,
  2  						      202401,
  3  						      2002 );
insert into instructor_scheduled_course values ( 10115,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> insert into instructor_scheduled_course values ( 10116,
  2  						      202401,
  3  						      2003 );
insert into instructor_scheduled_course values ( 10116,
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C0011028) violated - parent key not 
found 


SQL> 
SQL> 
SQL> 
SQL> spool off
