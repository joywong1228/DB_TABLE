--lab 5

spool C:\Joy_Sem2\database\gp_proj\git\DB_TABLE\lab5_output.sql

set echo on

-- ==============================
-- DELETE in reverse order
-- ==============================
delete from student_course_record;
delete from instructor_scheduled_course;
delete from credential_course;
delete from student_credentials;
delete from scheduled_course;
delete from instructor;
delete from student;
delete from course;
delete from credential;

-- ==========================================
-- Insert Sample Data for CPRG-250 Project
-- ==========================================

-- ================================
-- 1. Insert into STUDENT table
-- ================================
insert into student values ( 1001,
                             'Alice',
                             'Nguyen',
                             'A',
                             to_date('2023-09-01','YYYY-MM-DD'),
                             '403.555.1234',
                             'alice@example.com' );
insert into student values ( 1002,
                             'Bob',
                             'Chan',
                             'AP',
                             to_date('2023-09-15','YYYY-MM-DD'),
                             '403.555.5678',
                             'bob@example.com' );
insert into student values ( 1003,
                             'Clara',
                             'Smith',
                             'S',
                             to_date('2023-10-10','YYYY-MM-DD'),
                             '403.555.9999',
                             'clara@example.com' );
insert into student values ( 1004,
                             'David',
                             'Lee',
                             'A',
                             to_date('2023-08-20','YYYY-MM-DD'),
                             '403.555.0001',
                             'david@example.com' );
insert into student values ( 1005,
                             'Eva',
                             'Brown',
                             'A',
                             to_date('2023-11-01','YYYY-MM-DD'),
                             '403.555.3333',
                             'eva@example.com' );

-- ================================
-- 2. Insert into CREDENTIAL table
-- ================================
insert into credential values ( 'CT001',
                                'Tech Institute',
                                'Web Development',
                                'CT' );
insert into credential values ( 'CT002',
                                'Tech Institute',
                                'UI/UX Design',
                                'CT' );
insert into credential values ( 'DP001',
                                'Tech Institute',
                                'Software Development',
                                'DP' );
insert into credential values ( 'DP002',
                                'Tech Institute',
                                'Cybersecurity',
                                'DP' );

-- ===============================
-- 3. Insert into COURSE table (20 courses)
-- ===============================
insert into course values ( 'WDV1001',
                            'HTML/CSS',
                            3,
                            null,
                            '1' );
insert into course values ( 'WDV1002',
                            'JavaScript Basics',
                            3,
                            'WDV1001',
                            '1' );
insert into course values ( 'WDV1003',
                            'React JS',
                            3,
                            'WDV1002',
                            '1' );
insert into course values ( 'UXD1001',
                            'UX Principles',
                            3,
                            null,
                            '1' );
insert into course values ( 'UXD1002',
                            'UI Design',
                            3,
                            'UXD1001',
                            '1' );
insert into course values ( 'UXD1003',
                            'Adobe XD',
                            3,
                            'UXD1002',
                            '1' );
insert into course values ( 'SD1001',
                            'Programming I',
                            3,
                            null,
                            '1' );
insert into course values ( 'SD1002',
                            'Programming II',
                            3,
                            'SD1001',
                            '1' );
insert into course values ( 'SD1003',
                            'Database Basics',
                            3,
                            null,
                            '1' );
insert into course values ( 'SD1004',
                            'OOP in Java',
                            3,
                            'SD1002',
                            '1' );
insert into course values ( 'SD1005',
                            'Data Structures',
                            3,
                            'SD1004',
                            '1' );
insert into course values ( 'CYB1001',
                            'Networking',
                            3,
                            null,
                            '1' );
insert into course values ( 'CYB1002',
                            'Linux Admin',
                            3,
                            'CYB1001',
                            '1' );
insert into course values ( 'CYB1003',
                            'Ethical Hacking',
                            3,
                            'CYB1002',
                            '1' );
insert into course values ( 'CYB1004',
                            'Cyber Law',
                            3,
                            'CYB1003',
                            '1' );
insert into course values ( 'CYB1005',
                            'Security Audit',
                            3,
                            'CYB1004',
                            '1' );
insert into course values ( 'GNR1001',
                            'Communication Skills',
                            2,
                            null,
                            '1' );
insert into course values ( 'GNR1002',
                            'Team Projects',
                            2,
                            null,
                            '1' );
insert into course values ( 'GNR1003',
                            'Critical Thinking',
                            2,
                            null,
                            '1' );
insert into course values ( 'GNR1004',
                            'Capstone Project',
                            3,
                            'GNR1002',
                            '1' );

-- ======================================
-- 4. Insert into CREDENTIAL_COURSE
-- - 2 certificates (2-3 courses each)
-- - 2 diplomas (5 courses each)
-- ======================================
-- Certificate: Web Development
insert into credential_course values ( 'CT001',
                                       'WDV1001' );
insert into credential_course values ( 'CT001',
                                       'WDV1002' );
insert into credential_course values ( 'CT001',
                                       'WDV1003' );

-- Certificate: UI/UX Design
insert into credential_course values ( 'CT002',
                                       'UXD1001' );
insert into credential_course values ( 'CT002',
                                       'UXD1002' );
insert into credential_course values ( 'CT002',
                                       'UXD1003' );

-- Diploma: Software Development
insert into credential_course values ( 'DP001',
                                       'SD1001' );
insert into credential_course values ( 'DP001',
                                       'SD1002' );
insert into credential_course values ( 'DP001',
                                       'SD1003' );
insert into credential_course values ( 'DP001',
                                       'SD1004' );
insert into credential_course values ( 'DP001',
                                       'SD1005' );

-- Diploma: Cybersecurity
insert into credential_course values ( 'DP002',
                                       'CYB1001' );
insert into credential_course values ( 'DP002',
                                       'CYB1002' );
insert into credential_course values ( 'DP002',
                                       'CYB1003' );
insert into credential_course values ( 'DP002',
                                       'CYB1004' );
insert into credential_course values ( 'DP002',
                                       'CYB1005' );

-- ===================================
-- 5. Insert into SCHEDULED_COURSE
-- Assume all in semester 202401
-- ===================================
insert into scheduled_course values ( 10101,
                                      202401,
                                      'WDV1001',
                                      'A' );
insert into scheduled_course values ( 10102,
                                      202401,
                                      'WDV1002',
                                      'A' );
insert into scheduled_course values ( 10103,
                                      202401,
                                      'WDV1003',
                                      'A' );
insert into scheduled_course values ( 10104,
                                      202401,
                                      'UXD1001',
                                      'A' );
insert into scheduled_course values ( 10105,
                                      202401,
                                      'UXD1002',
                                      'A' );
insert into scheduled_course values ( 10106,
                                      202401,
                                      'UXD1003',
                                      'A' );
insert into scheduled_course values ( 10107,
                                      202401,
                                      'SD1001',
                                      'A' );
insert into scheduled_course values ( 10108,
                                      202401,
                                      'SD1002',
                                      'A' );
insert into scheduled_course values ( 10109,
                                      202401,
                                      'SD1003',
                                      'A' );
insert into scheduled_course values ( 10110,
                                      202401,
                                      'SD1004',
                                      'A' );
insert into scheduled_course values ( 10111,
                                      202401,
                                      'SD1005',
                                      'A' );
insert into scheduled_course values ( 10112,
                                      202401,
                                      'CYB1001',
                                      'A' );
insert into scheduled_course values ( 10113,
                                      202401,
                                      'CYB1002',
                                      'A' );
insert into scheduled_course values ( 10114,
                                      202401,
                                      'CYB1003',
                                      'A' );
insert into scheduled_course values ( 10115,
                                      202401,
                                      'CYB1004',
                                      'A' );
insert into scheduled_course values ( 10116,
                                      202401,
                                      'CYB1005',
                                      'A' );

-- ===================================
-- 6. Insert into STUDENT_CREDENTIALS
-- - 2 students with 1 credential
-- - 1 student with 2 credentials
-- ===================================
insert into student_credentials values ( 'CT001',
                                         1001,
                                         to_date('2023-09-01','YYYY-MM-DD'),
                                         null,
                                         'A',
                                         3.5 );
insert into student_credentials values ( 'DP001',
                                         1002,
                                         to_date('2023-09-01','YYYY-MM-DD'),
                                         null,
                                         'A',
                                         3.8 );
insert into student_credentials values ( 'CT002',
                                         1003,
                                         to_date('2023-09-01','YYYY-MM-DD'),
                                         null,
                                         'A',
                                         3.4 );
insert into student_credentials values ( 'DP002',
                                         1003,
                                         to_date('2023-09-01','YYYY-MM-DD'),
                                         null,
                                         'A',
                                         3.6 );

-- ===================================
-- 7. Insert into STUDENT_COURSE_RECORD
-- - Insert 20 records
-- ===================================
insert into student_course_record values ( 10101,
                                           202401,
                                           1001,
                                           'WDV1001',
                                           'CT001',
                                           'A' );
insert into student_course_record values ( 10102,
                                           202401,
                                           1001,
                                           'WDV1002',
                                           'CT001',
                                           'B+' );
insert into student_course_record values ( 10103,
                                           202401,
                                           1001,
                                           'WDV1003',
                                           'CT001',
                                           'A-' );
insert into student_course_record values ( 10107,
                                           202401,
                                           1002,
                                           'SD1001',
                                           'DP001',
                                           'B' );
insert into student_course_record values ( 10108,
                                           202401,
                                           1002,
                                           'SD1002',
                                           'DP001',
                                           'A' );
insert into student_course_record values ( 10109,
                                           202401,
                                           1002,
                                           'SD1003',
                                           'DP001',
                                           'A-' );
insert into student_course_record values ( 10110,
                                           202401,
                                           1002,
                                           'SD1004',
                                           'DP001',
                                           'B+' );
insert into student_course_record values ( 10111,
                                           202401,
                                           1002,
                                           'SD1005',
                                           'DP001',
                                           'A' );
insert into student_course_record values ( 10104,
                                           202401,
                                           1003,
                                           'UXD1001',
                                           'CT002',
                                           'A' );
insert into student_course_record values ( 10105,
                                           202401,
                                           1003,
                                           'UXD1002',
                                           'CT002',
                                           'B+' );
insert into student_course_record values ( 10106,
                                           202401,
                                           1003,
                                           'UXD1003',
                                           'CT002',
                                           'A' );
insert into student_course_record values ( 10112,
                                           202401,
                                           1003,
                                           'CYB1001',
                                           'DP002',
                                           'B' );
insert into student_course_record values ( 10113,
                                           202401,
                                           1003,
                                           'CYB1002',
                                           'DP002',
                                           'B+' );
insert into student_course_record values ( 10114,
                                           202401,
                                           1003,
                                           'CYB1003',
                                           'DP002',
                                           'A-' );
insert into student_course_record values ( 10115,
                                           202401,
                                           1003,
                                           'CYB1004',
                                           'DP002',
                                           'A' );
insert into student_course_record values ( 10116,
                                           202401,
                                           1003,
                                           'CYB1005',
                                           'DP002',
                                           'A+' );
-- extra to reach 20 records
insert into student_course_record values ( 10101,
                                           202401,
                                           1004,
                                           'WDV1001',
                                           'CT001',
                                           'C' );
insert into student_course_record values ( 10102,
                                           202401,
                                           1004,
                                           'WDV1002',
                                           'CT001',
                                           'B-' );
insert into student_course_record values ( 10103,
                                           202401,
                                           1004,
                                           'WDV1003',
                                           'CT001',
                                           'C+' );
insert into student_course_record values ( 10104,
                                           202401,
                                           1005,
                                           'UXD1001',
                                           'CT002',
                                           'B' );

-- ===================================
-- 8. Insert into INSTRUCTOR
-- - At least 10 instructors
-- ===================================
insert into instructor values ( 2001,
                                'Sam',
                                'Wong',
                                '123 Main St',
                                'Calgary',
                                'AB',
                                'T2N 1N4',
                                '403.111.1111',
                                'sam@institute.ca' );
insert into instructor values ( 2002,
                                'Linda',
                                'Taylor',
                                '456 Oak St',
                                'Calgary',
                                'AB',
                                'T2N 2B4',
                                '403.222.2222',
                                'linda@institute.ca' );
insert into instructor values ( 2003,
                                'Mark',
                                'Lee',
                                '789 Pine St',
                                'Calgary',
                                'AB',
                                'T2N 3C4',
                                '403.333.3333',
                                'mark@institute.ca' );
insert into instructor values ( 2004,
                                'Jane',
                                'Kim',
                                '135 Maple St',
                                'Calgary',
                                'AB',
                                'T2N 4D4',
                                '403.444.4444',
                                'jane@institute.ca' );
insert into instructor values ( 2005,
                                'Tom',
                                'Singh',
                                '246 Birch St',
                                'Calgary',
                                'AB',
                                'T2N 5E4',
                                '403.555.5555',
                                'tom@institute.ca' );
insert into instructor values ( 2006,
                                'Emily',
                                'Zhao',
                                '357 Cedar St',
                                'Calgary',
                                'AB',
                                'T2N 6F4',
                                '403.666.6666',
                                'emily@institute.ca' );
insert into instructor values ( 2007,
                                'Alex',
                                'Jones',
                                '468 Fir St',
                                'Calgary',
                                'AB',
                                'T2N 7G4',
                                '403.777.7777',
                                'alex@institute.ca' );
insert into instructor values ( 2008,
                                'Sophia',
                                'Chen',
                                '579 Elm St',
                                'Calgary',
                                'AB',
                                'T2N 8H4',
                                '403.888.8888',
                                'sophia@institute.ca' );
insert into instructor values ( 2009,
                                'Lucas',
                                'Brown',
                                '680 Poplar St',
                                'Calgary',
                                'AB',
                                'T2N 9I4',
                                '403.999.9999',
                                'lucas@institute.ca' );
insert into instructor values ( 2010,
                                'Nina',
                                'Patel',
                                '791 Ash St',
                                'Calgary',
                                'AB',
                                'T2N 0J4',
                                '403.000.0000',
                                'nina@institute.ca' );

-- ===================================
-- 9. INSTRUCTOR_SCHEDULED_COURSE
-- - Link instructors to scheduled courses
-- ===================================
insert into instructor_scheduled_course values ( 10101,
                                                 202401,
                                                 2001 );
insert into instructor_scheduled_course values ( 10102,
                                                 202401,
                                                 2001 );
insert into instructor_scheduled_course values ( 10103,
                                                 202401,
                                                 2002 );
insert into instructor_scheduled_course values ( 10104,
                                                 202401,
                                                 2003 );
insert into instructor_scheduled_course values ( 10105,
                                                 202401,
                                                 2003 );
insert into instructor_scheduled_course values ( 10106,
                                                 202401,
                                                 2004 );
insert into instructor_scheduled_course values ( 10107,
                                                 202401,
                                                 2005 );
insert into instructor_scheduled_course values ( 10108,
                                                 202401,
                                                 2005 );
insert into instructor_scheduled_course values ( 10109,
                                                 202401,
                                                 2006 );
insert into instructor_scheduled_course values ( 10110,
                                                 202401,
                                                 2007 );
insert into instructor_scheduled_course values ( 10111,
                                                 202401,
                                                 2008 );
insert into instructor_scheduled_course values ( 10112,
                                                 202401,
                                                 2009 );
insert into instructor_scheduled_course values ( 10113,
                                                 202401,
                                                 2010 );
insert into instructor_scheduled_course values ( 10114,
                                                 202401,
                                                 2001 );
insert into instructor_scheduled_course values ( 10115,
                                                 202401,
                                                 2002 );
insert into instructor_scheduled_course values ( 10116,
                                                 202401,
                                                 2003 );



spool off