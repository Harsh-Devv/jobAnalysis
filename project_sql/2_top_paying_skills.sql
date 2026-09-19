SELECT * FROM skills_dim LIMIT 20
SELECT * FROM skills_job_dim LIMIT 20

WITH top_paying_jobs AS (SELECT
    j.job_id,
    c.name AS Company_name,
    j.job_title,
    j.salary_year_avg AS Average_Yearly_Salary
FROM
    job_postings_fact AS j
LEFT JOIN company_dim AS c
ON j.company_id = c.company_id
WHERE 
    j.salary_year_avg IS NOT NULL AND
    j.job_location = 'Anywhere' AND
    j.job_title_short = 'Data Analyst'
ORDER BY
    j.salary_year_avg DESC
LIMIT 10)

SELECT 
    t.*,
    s.skills
FROM top_paying_jobs AS t
INNER JOIN skills_job_dim AS sj
ON t.job_id = sj.job_id
INNER JOIN skills_dim AS s
ON s.skill_id = sj.skill_id
ORDER BY
    t.Average_Yearly_Salary DESC


/*
+-----------+----------------------+--------------------+
| Skill     | Frequency (Jobs)     | Share of Roles (%) |
+-----------+----------------------+--------------------+
| SQL       | 8 / 8                | 100%               |
| Python    | 7 / 8                | 88%                |
| Tableau   | 6 / 8                | 75%                |
| R         | 4 / 8                | 50%                |
| Snowflake | 3 / 8                | 38%                |
| Pandas    | 3 / 8                | 38%                |
| Excel     | 3 / 8                | 38%                |
+-----------+----------------------+--------------------+
*/