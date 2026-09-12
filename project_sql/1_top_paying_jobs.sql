-- TOP 10 Highest paying jobs for 'Data Analyst' role with work from home facility available with the companys offering that job

SELECT  
    job_id,
    job_title_short,
    company_dim.company_id,
    company_dim.name,
    job_work_from_home,
    salary_year_avg
FROM 
    job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND
    job_work_from_home = true
ORDER BY salary_year_avg DESC
LIMIT 10;
