SELECT 
    skills,
    -- (SUM(salary_year_avg) / COUNT(*)) AS mostPayingskill
    ROUND(AVG(salary_year_avg),2) AS mostPayingskill
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s
ON s.skill_id = sj.skill_id
WHERE
    j.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    mostPayingskill DESC
LIMIT 25