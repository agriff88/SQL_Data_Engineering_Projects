SELECT 
  job_id,
  job_title_short,
  salary_year_avg,
  company_id
FROM 
  job_postings_fact
LIMIT 10;

SELECT 
    company_id,
    Name
FROM
    company_dim
LIMIT 10;

Select
    *
From
    company_dim
LIMIT 10;

SELECT *
From information_schema.table_constraints
WHERE table_catalog = 'data_jobs'; 

SELECT
jpf.job_id
ds.name AS company

