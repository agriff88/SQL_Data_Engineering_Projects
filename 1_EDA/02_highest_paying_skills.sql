/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count,
    round(Median(jpf.salary_year_avg), 0) AS median_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
 ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = TRUE
group by
    sd.skills
Having COUNT(jpf.*) > 100
ORDER by median_salary DESC
LIMIT 25;

/*
┌────────────┬──────────────┬───────────────┐
│   skills   │ demand_count │ median_salary │
│  varchar   │    int64     │    double     │
├────────────┼──────────────┼───────────────┤
│ rust       │          232 │      210000.0 │
│ terraform  │         3248 │      184000.0 │
│ golang     │          912 │      184000.0 │
│ spring     │          364 │      175500.0 │
│ neo4j      │          277 │      170000.0 │
│ gdpr       │          582 │      169616.0 │
│ zoom       │          127 │      168438.0 │
│ graphql    │          445 │      167500.0 │
│ mongo      │          265 │      162250.0 │
│ fastapi    │          204 │      157500.0 │
│ django     │          265 │      155000.0 │
│ bitbucket  │          478 │      155000.0 │
│ crystal    │          129 │      154224.0 │
│ c          │          444 │      151500.0 │
│ atlassian  │          249 │      151500.0 │
│ typescript │          388 │      151000.0 │
│ kubernetes │         4202 │      150500.0 │
│ ruby       │          736 │      150000.0 │
│ node       │          179 │      150000.0 │
│ css        │          262 │      150000.0 │
│ airflow    │         9996 │      150000.0 │
│ redis      │          605 │      149000.0 │
│ vmware     │          136 │      148798.0 │
│ ansible    │          475 │      148798.0 │
│ jupyter    │          400 │      147500.0 │
└────────────┴──────────────┴───────────────┘
A few interesting findings
- Rust has the highest median salary at $210,000, but appears in only 232 postings.
- Terraform has a median salary of $184,000 across 3,248 postings.
- Kubernetes appears in 4,202 postings, with a median salary of $150,500.
- Airflow has the highest demand among these 25 skills, appearing in 9,996 postings, with a median salary of $150,000.
/*