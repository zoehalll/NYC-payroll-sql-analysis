# NYC Payroll Analysis (SQL) 

## Overview
Analysis of NYC Citywide Payroll Data for 2025 fiscal year to compare pay and overtime across agencies, job titles, and boroughs.  

## Dataset 
NYC Open Data, Citywide Payroll data, https://data.cityofnewyork.us/City-Government/Citywide-Payroll-Data-Fiscal-Year-/k397-673e/about_data
Fiscal Year: 2025 
Records Analyzed: 550219
* Raw data not included because it contains employee identities

# Tools 
SQL Server Developer Edition, SQL Server Management Studio (T-SQL)

## Data cleaning notes
- Import warning: up to 100 cells in OT_Hours and Total_OT_Paid left blank due to zero hours recorded 
- Excluded rows with zero or negative regular gross pay.
- One record had no work location borough and was excluded from Q4. 
- Averages (Q3, Q5) include only employees with ACTIVE status as of June 30; totals (Q1, Q2, Q6) include all.
- Some departments appear under multiple agency names; each is ranked separately.

## Questions and Findings 
**Q1: Which agencies have the highest total regular pay?
- The Department of education (Pedagogical) had the highest total regular pay, with the NYPD and NYFD with 2nd and 3rd highest pay.

**Q2: Which job titles have the highest average salaries? (at least 50 employees) 
- The highest average salary was $222,844 for the Captain D/A Deputy Chief position at the NYPD. 

**Q3: Which agenices spend the most on overtime? 
- The NYPD, NYFD, and Department of Correction spend the most on overtime. They each spent totals of $1,087,811,663 , $568,051,984 , and $363,371,346 on overtime pay. 

**Q4: How do headcount and salary compare across the boroughs? 
- A borough labeled 'Other' in the dataset has the highest headcount of 2328 employees with an average regular pay of $117,823. The main boroughs of NYC ended low in the rankings for salary despite very high headcounts. Due to the larger influx of employment in these areas, there is a larger pool of data that could have caused a smaller median pay in these areas. 

**Q5:  What are the top 3 job titles in each agency with the highest average regular pay? 
- Within each agency, the highest paid roles are often senior management roles that often had the title "Deputy" or "Council" in them. For the City Council, the top position was Deputy Director with an average regular salary of $160,734 followed by Council Member with $142,811 and Legislative Administrative Manager with $111,941. At Bronx District Attorney, the highest paid role of Assistant Direct Attorney, where the average salary ($125,682) was about twice that of the 2nd highest paid position, Community Coordinator with a salary of $68,051.
  
## Takeaways 
Higher roles at government departments tend to pay the most overall and tend to give the most in overtime. The Department of Education, Police Department, and Fire Department also hire the most employees given that they are also government departments and therefore hire more people across the state of New York. 

## Files 
'payroll.sql' - all queries used in analysis 
