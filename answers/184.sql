-- 思路1：
SELECT d.Name AS Department, e1.Name AS Employee, e1.Salary
FROM Employee e1 JOIN Department d ON e1.DepartmentId = d.Id
WHERE
    0 = (
        SELECT COUNT(*)
        FROM Employee e2
        WHERE
            e2.DepartmentId = e1.DepartmentId
            AND
            e2.Salary > e1.Salary
    )
ORDER BY Department

-- 思路2:
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee e JOIN Department d ON e.DepartmentId = d.Id
WHERE 
    (e.DepartmentId, Salary) 
    IN
    (
        SELECT DepartmentId, MAX(Salary)
        FROM Employee
        GROUP BY DepartmentId
    )
ORDER BY Department