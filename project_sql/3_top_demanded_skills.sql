
SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS total_jobs_per_skill
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst' AND
      job_work_from_home = true
GROUP BY skills_dim.skills
ORDER BY total_jobs_per_skill DESC
LIMIT 10;
