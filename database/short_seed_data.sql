
SET FOREIGN_KEY_CHECKS = 0;


-- ERP DATABASE

CREATE DATABASE IF NOT EXISTS `erp_db`;
USE `erp_db`;

-- Settings
DELETE FROM `settings` WHERE setting_key IN ('maintenance_on','alert');
INSERT INTO `settings` (setting_key, setting_value) VALUES ('maintenance_on','false'), ('alert','Short-seed: demo data');

-- Courses
DELETE FROM `courses` WHERE course_id IS NOT NULL;
INSERT INTO `courses` (course_id, code, title, credits) VALUES
(1,'CS101','Intro to Programming',4);

-- Instructors
DELETE FROM `instructors` WHERE user_id IN (2);
INSERT INTO `instructors` (user_id, department) VALUES
(2,'Computer Science');

-- Students
DELETE FROM `students` WHERE user_id IN (3,4);
INSERT INTO `students` (user_id, roll_no, program, year) VALUES
(3,'2024001','B.Tech CS',2),
(4,'2024002','M.Tech CS',1);

-- Sections
DELETE FROM `sections` WHERE section_id IN (1);
INSERT INTO `sections` (section_id, course_id, instructor_id, day_time, room, capacity, semester, year) VALUES
(1,1,2,'Mon/Wed 10:00','A-101',50,'Fall',2025);

-- Enrollments
DELETE FROM `enrollments` WHERE enrollment_id IN (1);
INSERT INTO `enrollments` (enrollment_id, student_id, section_id, status) VALUES
(1,3,1,'enrolled');

-- Grades
DELETE FROM `grades` WHERE enrollment_id = 1;
INSERT INTO `grades` (grade_id, enrollment_id, component, score, final_grade) VALUES
(101,1,'quiz (20)',16.00,'B'),
(102,1,'midsem (30)',20.00,'B'),
(103,1,'endsem (50)',40.00,'B');


-- AUTH DATABASE

CREATE DATABASE IF NOT EXISTS `auth_db`;
USE `auth_db`;

DELETE FROM `users_auth` WHERE user_id IN (1,2,3,4);
INSERT INTO `users_auth` (user_id, username, role, password_hash, status) VALUES
(1,'admin1','Admin','$2a$10$Cl/ea9o74nAUqSwI8/wygulY/hYeDPgdXx4IllnznsivOPPMFs8uC','active'),
(2,'inst1','Instructor','$2a$10$l3/zG/VL24/ZsrifJbGZL.4o/nHzp2lEW4jcqtMK7YGBjIQEqI0XK','active'),
(3,'stu1','Student','$2a$10$Bbq0JcAVO/9TMeP0jQSEt.cUo1zSSrSSwzqpv3.f2rQYXECtfjNoa','active'),
(4,'stu2','Student','$2a$10$92AIx9aLDwg8Tk3bD.3GCOpQ.Y/n.eZrMxZjb.JL/t9fh/BGh2Cny','active');


SET FOREIGN_KEY_CHECKS = 1;