--
-- 1. Find the sum of the salaries of all instructors, the maximum salary, the minimum salary, and the average salary.
--
SELECT sum(salary),
   max(salary),
   min(salary),
   avg(salary)
FROM Instructor;
--
-- 2. Find the sum of the salaries of all instructors of the 'History' department, as well as the maximum salary, the minimum salary, and the average salary in this department.
--
SELECT sum(salary),
   max(salary),
   min(salary),
   avg(salary)
FROM Instructor
WHERE dept_name = 'History';
--
-- 3. Retrieve the total number of instructors in the institution
--
SELECT count(*)
FROM Instructor;
--
-- 4. Retrieve the total number of instructors in the 'Computer science' department
--
SELECT count(*)
FROM Instructor
WHERE dept_name = 'Comp.Sci.';
--
-- 5. Count the number of distinct salary values in the database.
--
SELECT count(distinct salary)
FROM Instructor;