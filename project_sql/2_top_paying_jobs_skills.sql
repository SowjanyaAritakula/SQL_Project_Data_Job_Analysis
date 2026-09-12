
WITH top_paying_jobs AS (
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
LIMIT 10
)

SELECT 
    skills_dim.skills,
    top_paying_jobs.*,
FROM skills_dim
INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN top_paying_jobs ON skills_job_dim.job_id = top_paying_jobs.job_id
ORDER BY salary_year_avg DESC
LIMIT 10

/*

Leading Insights
SQL is the #1 skill, appearing in 8 of the top postings — making it the most essential skill for Data Analyst roles.
Python ranks #2, appearing in 7 postings, showing strong demand for programming and data analysis capabilities.
Tableau is the leading visualization tool, appearing in 6 postings.
R appears in 4 postings, indicating that statistical programming remains relevant for analyst positions.
Excel, Pandas, and Snowflake each appear in 3 postings, showing demand for spreadsheet analysis, Python-based data manipulation, and cloud data warehousing.
Azure, Power BI, and AWS appear in 2 postings each, suggesting that cloud and BI-platform knowledge is useful but less universal in this sample.
Overall, the strongest skill combination is SQL + Python + Tableau, covering data querying, analysis/programming, and visualization.
The postings show a shift beyond traditional Excel-based analysis toward programming, BI tools, cloud platforms, and modern data infrastructure.

[
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "company_id": 5835,
    "name": "AT&T",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_id": 183972,
    "name": "Pinterest Job Advertisements",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_id": 183972,
    "name": "Pinterest Job Advertisements",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_id": 183972,
    "name": "Pinterest Job Advertisements",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_id": 183972,
    "name": "Pinterest Job Advertisements",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_id": 183972,
    "name": "Pinterest Job Advertisements",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_id": 381287,
    "name": "Uclahealthcareers",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_id": 381287,
    "name": "Uclahealthcareers",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_id": 381287,
    "name": "Uclahealthcareers",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_id": 381287,
    "name": "Uclahealthcareers",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_id": 381287,
    "name": "Uclahealthcareers",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_id": 1261,
    "name": "Inclusively",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_id": 4707,
    "name": "Motional",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_id": 19724,
    "name": "SmartAsset",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_id": 2686,
    "name": "Get It Recruit - Information Technology",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_id": 2686,
    "name": "Get It Recruit - Information Technology",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_id": 2686,
    "name": "Get It Recruit - Information Technology",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "r"
  }
]
*/