--Q1: Which agencies have the highest total regular pay? 
Select Agency_Name AS agency,
       COUNT(*) AS employees,
       ROUND(SUM(Regular_Gross_Paid), 0) AS total_regular_pay
FROM payroll
WHERE Regular_Gross_Paid > 0
GROUP BY Agency_Name
ORDER BY total_regular_pay DESC;

--Q2: Which job titles have the highest average salaries? (at least 50 employees) 
SELECT ROUND(AVG(Regular_Gross_Paid),0) AS average_pay, Title_Description as Title, COUNT(*) as employees
from payroll
WHERE Regular_Gross_Paid > 0
  AND Leave_Status_as_of_June_30 = 'Active'
GROUP BY Title_Description
HAVING COUNT(*) >= 50
ORDER BY average_pay DESC;

--Q3: Which agenices spend the most on overtime? 
SELECT agency_Name AS agency,
       COUNT(*) AS employees,
       ROUND(SUM(Total_OT_Paid), 0) AS total_ot_paid,
       ROUND(SUM(OT_Hours), 0) AS total_ot_hours,
       ROUND(AVG(Total_OT_Paid), 0) AS avg_ot_per_employee
FROM payroll
GROUP BY Agency_Name
ORDER BY total_ot_paid DESC;

--Q4: How do headcount and salary compare across the boroughs? 
SELECT Work_Location_Borough as Borough, 
        COUNT(*) as Employees,
        ROUND(AVG(Regular_Gross_Paid), 0) AS Average_regular_pay
from Payroll 
WHERE Regular_Gross_Paid > 0 AND Work_Location_Borough IS NOT NULL
GROUP BY Work_Location_Borough
ORDER BY Average_regular_pay DESC; 

--Q5: What are the top 3 job titles in each agency with the highest average regular pay? 
WITH Title_Pay AS (
    SELECT Agency_name, Title_Description, 
    COUNT(*) AS employees, 
    AVG(Regular_Gross_Paid) as Average_regular_pay 
From Payroll 
WHERE Regular_Gross_Paid > 0 
AND Leave_status_as_of_June_30 = 'Active'
GROUP BY Agency_Name, Title_Description
    HAVING COUNT(*) >= 20
), 
Ranked as (
    SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY Agency_Name ORDER BY average_regular_pay DESC) AS rank_in_agency
    From Title_Pay 
) 
    SELECT Agency_name, Title_description, employees, 
    ROUND(average_regular_pay, 0) AS average_regular_pay, 
    rank_in_agency
From ranked 
WHERE rank_in_agency <= 3
ORDER BY Agency_Name, rank_in_agency; 

