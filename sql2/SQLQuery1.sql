
-- Mini Project: Employee Management System

CREATE DATABASE EmployeeManagementDB;
GO

USE EmployeeManagementDB;
GO

-- 1. Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- 2. Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-- 3. Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeID INT,
    ProjectStatus VARCHAR(30),
    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

-- Insert departments
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'Analytics'),
(3, 'HR');

-- Insert employees
INSERT INTO Employees VALUES
(101, 'Rahul', 1, 45000, '2024-01-15'),
(102, 'Priya', 2, 52000, '2023-06-10'),
(103, 'Amit', 1, 40000, '2024-03-20'),
(104, 'Sneha', 3, 35000, '2022-11-05'),
(105, 'Kiran', 2, 60000, '2021-08-12');

-- Insert projects
INSERT INTO Projects VALUES
(201, 'Website Development', 101, 'In Progress'),
(202, 'Sales Dashboard', 102, 'Completed'),
(203, 'Database Migration', 103, 'In Progress'),
(204, 'Employee Analytics', 105, 'Completed');

-- Check the data
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Projects;


SELECT
    e.EmployeeName,
    d.DepartmentName,
    e.Salary,
    p.ProjectName,
    p.ProjectStatus
FROM Employees e
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p
    ON e.EmployeeID = p.EmployeeID;