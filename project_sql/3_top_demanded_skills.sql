SELECT 
    skills,
    COUNT(sj.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s
ON s.skill_id = sj.skill_id
WHERE
    j.job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5