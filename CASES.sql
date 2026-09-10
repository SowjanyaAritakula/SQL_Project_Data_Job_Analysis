SELECT  
    job_title_short,
    job_location,
    CASE    
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'other'
    END AS location_category
FROM job_postings_fact;




SELECT
     COUNT(job_id) AS total_no_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'  --how many jobs in a specific locatio
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' 
GROUP BY location_category;



SELECT
     COUNT(job_id) AS total_no_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'  --how many jobs in a specific locatio
    END AS location_category
FROM job_postings_fact;

