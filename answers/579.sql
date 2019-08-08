SELECT 
    e1.Id AS id, 
    e1.Month AS month, 
    (
        SELECT SUM(e2.Salary)
        FROM Employee e2
        WHERE 
            e2.Month <= e1.Month
            AND
            e2.month >= e1.month - 2
            AND
            e2.Id = e1.Id
    ) AS Salary
FROM Employee e1
WHERE (e1.Id, e1.Month) NOT IN
(
    SELECT Id, MAX(DISTINCT Month)
    FROM Employee
    GROUP BY Id
)
ORDER BY Id, Month DESC