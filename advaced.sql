SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS DATE
FROM
    job_postings_fact;


-- MONTHL WISE TREND ANALYSIS OF JOB POSTINGS
SELECT 
    COUNT(job_id) as total_job_posted,
    EXTRACT (MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    date_month
ORDER BY total_job_posted DESC;


SELECT
    count(job_id),
    EXTRACT (MONTH FROM job_posted_date) AS posting_month
FROM job_postings_fact
GROUP BY
    posting_month
LIMIT 10;

--CREATING TABLE FROM TABLES
CREATE TABLE january_jobs AS 
    SELECT
        *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April
CREATE TABLE april_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May
CREATE TABLE may_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June
CREATE TABLE june_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July
CREATE TABLE july_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August
CREATE TABLE august_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September
CREATE TABLE september_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October
CREATE TABLE october_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November
CREATE TABLE november_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December
CREATE TABLE december_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

SELECT job_posted_date 
    FROM march_jobs;

-- IF ELSE WHEN THEN



--Topic 3: Subquery
SELECT * 
FROM(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) 
    AS january;

SELECT * FROM january;

-- CTE 

WITH january_jobs_new AS ( 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT * FROM january_jobs_new;

-- subquery
-- companies that doesn't require any degree
/*
SELECT  
    company_id,
    job_no_degree_mention
FROM  
    job_postings_fact
WHERE   
    job_no_degree_mention = true;
*/ -- put it in subquery

SELECT 
    company_id,
    name
FROM company_dim 
WHERE company_id IN(
    SELECT  
        DISTINCT company_id -- DISTINCT 64103 ROWS else job posting lo vachinavannitlo pai query filter cheskuntdi
    FROM  
        job_postings_fact
    WHERE   
        job_no_degree_mention = true
    ORDER BY company_id
        )

        

SELECT * FROM company_dim;

WITH company_job_count AS( 
    SELECT 
        COUNT(*) AS total_jobs,
        company_id
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    name,
    company_job_count.total_jobs
FROM
    company_dim
    LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY 
        company_job_count.total_jobs DESC;


WITH skills_to_remote AS 
    (
        SELECT 
            skill_id  
        FROM 
            skills_job_dim
        
    )



WITH skill_job_remote AS 
    (
    SELECT 
       COUNT(*) AS total_jobs_per_skill,
        skill_id
    FROM skills_job_dim WHERE job_id IN(
        SELECT 
            job_id 
        FROM 
            job_postings_fact  
        WHERE
            job_location = 'Anywhere')
    GROUP BY skill_id
    )
SELECT 
    skills,
    skill_job_remote.skill_id,
    total_jobs_per_skill
FROM
    skills_dim 
    INNER JOIN skill_job_remote ON skill_job_remote.skill_id = skills_dim.skill_id
ORDER BY total_jobs_per_skill DESC
 LIMIT 5;