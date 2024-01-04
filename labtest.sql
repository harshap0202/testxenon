create database labtest;
use labtest;

CREATE TABLE Department (
    DEPT_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    LOCATION VARCHAR(50)
);

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY INT,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES Department(DEPT_ID)
);

select * from employee;

select * from department;

insert into department (dept_id, name, location)
values
	(1, 'Administration', 'Pune'),
    (2, 'Quality Assurance', 'Nashik'),
    (3, 'Sales Division', 'Mumbai'),
    (4, 'IT Support', 'Nashik');
    
select * from department;

insert into employee (ID, NAME, SALARY, DEPT_ID)
values
    (1, 'Harshwardhan Patil', 75000, 2),
    (2, 'Rushikesh Sonar', 60000, 2),
    (3, 'Riddhi Patil', 55000, 1),
    (4, 'Vaibhav Burkul', 65000, 1),
    (5, 'Raj Rathod', 70000, 2),
    (6, 'Shrutika Mali', 60000, 3),
    (7, 'Vaibhav Patil', 62000, 2),
    (8, 'Harshada Targe', 58000, 3),
    (9, 'Utkarsha Bhadane', 60000, 2),
    (10, 'Girish Shah', 68000, 4);

select * from employee;

SELECT Dept.NAME AS Department_Name,
       COUNT(Emp.ID) AS Number_of_Employees
FROM Department Dept
LEFT JOIN Employee Emp ON Dept.DEPT_ID = Emp.DEPT_ID
GROUP BY Dept.DEPT_ID
ORDER BY Number_of_Employees DESC, Department_Name ASC;

DELIMITER //
create procedure CalculateFactorial(in inputNumber int)
begin
    declare factorial int;
    declare i int;
    
    set factorial = 1;    
    if inputNumber < 0 then
        select "Given number is negative";
    elseif inputNumber = 0 or inputNumber = 1 then
        select 1;
    else
        set i = 1;
        while i <= inputNumber do
            set factorial = factorial * i;
            set i = i + 1;
        end while;
        select factorial;
    end if;
end;
//
DELIMITER ;

call CalculateFactorial(5);
