SELECT * FROM bloodbank.db;

-- Total blood banks in India
SELECT COUNT(*) Total_Banks
FROM bloodbank.db;

-- State wise blood banks present in India
SELECT State,
COUNT(*) state_count from bloodbank.db
Group BY State
Order BY state_count desc;

-- State with less than 30 units
SELECT State,
COUNT(*) low_state_count from bloodbank.db
Group BY State
HAVING COUNT(*) < 30
Order BY low_state_count;

-- Category wise blood banks present in India
SELECT State,Category,COUNT(*) AS Category_count
FROM bloodbank.db
GROUP BY State,Category
ORDER BY Category_count desc;

-- Highest availability of blood component
SELECT State,COUNT(*) AS Blood_component
FROM bloodbank.db
WHERE Blood_Component_Available = 'YES'
GROUP BY State
ORDER BY Blood_component desc;

-- List of states has Apheresis facility
SELECT State,COUNT(*) AS Apheresis_service
FROM bloodbank.db
WHERE Apheresis = 'YES'
GROUP BY State
ORDER BY Apheresis_service desc;

-- No.of blood banks supports 24/7 state wise
SELECT State,COUNT(*) AS Service_24
FROM bloodbank.db
WHERE Service_Time like '%24%'
GROUP BY State
ORDER BY Service_24 desc;

-- Blood banks functionality: Total/Partial Functional
SELECT Blood_Bank_Name,State,City,Mobile,
case 
WHEN Blood_Component_Available = 'YES' and
Apheresis = 'YES' and Service_Time like '%24%' and License != ''
then 'Totally functional'
else 'Partially functional'
end as Functionality_check
FROM bloodbank.db
