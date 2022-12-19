SELECT
    schools.id, schools.name, courses.name AS "course", companies.name AS "company", roles.name AS "role"
FROM
    applicants
JOIN
    users
ON
    users.id = applicants."userId"
JOIN
    educations
ON
    educations."userId" = users.id
JOIN
    schools
ON
    educations."schoolId" = schools.id
JOIN
    courses
ON
    educations."courseId" = courses.id
JOIN
    jobs
ON
    applicants."jobId" = jobs.id
JOIN
    companies
ON
    companies.id = jobs."companyId"
JOIN
    roles
ON
    roles.id = jobs."roleId"
WHERE
    company.id = 10
AND
    roles.name = 'Software Engineer'
AND
    jobs.active = true
;