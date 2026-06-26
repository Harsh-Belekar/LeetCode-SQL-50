SELECT 
    department, 
    employee, 
    salary 
FROM
(
    SELECT 
        d.name AS department,
        e.name AS employee, 
        e.salary AS salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS ranks
    FROM Employee e 
    LEFT JOIN Department d
    ON e.departmentId = d.id
) AS temp
WHERE ranks <= 3;
