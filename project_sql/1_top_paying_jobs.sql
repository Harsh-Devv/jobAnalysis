-- SELECT *
-- FROM job_postings_fact
-- LIMIT 50;

-- SELECT *
-- FROM company_dim
-- LIMIT 50

SELECT
    j.job_id,
    c.name AS Company_name,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg AS Average_Yearly_Salary,
    j.job_posted_date
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
LIMIT 10