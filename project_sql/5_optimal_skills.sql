with top_demanded_skills AS
(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS total_jobs_per_skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_postings_fact.job_title_short = 'Data Analyst' AND
        job_work_from_home = true AND
        salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),
 avg_salary AS (
SELECT
    skills_dim.skill_id,
   -- COUNT(job_postings_fact.job_id) AS total_jobs_per_skill,
    ROUND (AVG(salary_year_avg), 0) AS avg_sal_skill
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = true AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
)

SELECT 
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
    top_demanded_skills.total_jobs_per_skill,
    avg_sal_skill
FROM 
    top_demanded_skills
INNER JOIN avg_salary ON top_demanded_skills.skill_id = avg_salary.skill_id
WHERE total_jobs_per_skill > 10
ORDER BY   
      avg_sal_skill DESC,
      top_demanded_skills.total_jobs_per_skill DESC


SELECT  
    skills_dim.skills,
    skills_dim.skill_id,
    COUNT(job_postings_fact.job_id) AS demand_count,
    AVG(salary_year_avg) AS salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
    job_title_short = 'Data Analyst' AND
    job_work_from_home = true AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(job_postings_fact.job_id) > 10
ORDER BY 
    demand_count DESC,
    salary DESC
LIMIT 25