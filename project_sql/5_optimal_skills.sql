WITH high_demand AS (
    SELECT
        s.skill_id, 
        s.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS s
    ON s.skill_id = sj.skill_id
    WHERE
        j.job_title_short = 'Data Analyst'AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
    GROUP BY
        s.skill_id
), high_pay AS (
    SELECT 
        sj.skill_id,
        -- (SUM(salary_year_avg) / COUNT(*)) AS mostPayingskill
        ROUND(AVG(salary_year_avg),0) AS mostPayingskill
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS s
    ON s.skill_id = sj.skill_id
    WHERE
        j.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        sj.skill_id
)

SELECT
    high_demand.skill_id,
    high_demand.skills,
    demand_count,
    mostPayingskill
FROM
    high_demand
INNER JOIN high_pay ON high_demand.skill_id = high_pay.skill_id
ORDER BY
    demand_count DESC,
    mostPayingskill DESC
LIMIT
    25


SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25;
