SELECT * FROM hr_analytics_pipeline.hr_data;

SELECT COUNT(*) AS total_rows
FROM hr_data;

SELECT *
FROM hr_data
LIMIT 10;

SELECT attrition, COUNT(*) AS employees
FROM hr_data
GROUP BY attrition;



## 1. What is the overall attrition rate?
SELECT ROUND(AVG(attrition) * 100,2) AS attrition_rate_percent
FROM hr_data;

##2. Which departments have the highest attrition?
SELECT department, ROUND(AVG(attrition) * 100,2) AS attrition_rate_percent
FROM hr_data
GROUP BY department
ORDER BY 2 DESC;

##3. Which job roles have the highest attrition?
SELECT jobrole, ROUND(AVG(attrition) * 100,2) AS attrition_rate_percent
FROM hr_data
GROUP BY jobrole
ORDER BY 2 DESC;

##4. Does overtime relate to attrition?
SELECT overtime, ROUND(AVG(attrition) * 100,2) AS attrition_rate_percent
FROM hr_data
GROUP BY overtime
ORDER BY 2 DESC;

##5. Is attrition higher among lower salary employees?
SELECT salary_level, ROUND(AVG(attrition) * 100,2) AS attrition_rate_percent
FROM hr_data
GROUP BY salary_level
ORDER BY 2 DESC;


UPDATE hr_data
SET tenure_group = 'New'
WHERE tenure_group IS NULL
   OR tenure_group = '';

##6. Which tenure group has the highest attrition?
SELECT tenure_group, ROUND(AVG(attrition) * 100, 2) AS attrition_rate_percent
FROM hr_data
GROUP BY tenure_group
ORDER BY 2 DESC;

##7. What is the average monthly income by department?
SELECT department, ROUND(AVG(monthlyincome), 2) AS monthly_income
FROM hr_data
GROUP BY department
ORDER BY 2 DESC;

##8. What is the average engagement score by attrition status?
SELECT attrition, ROUND(AVG(engagement_score), 2) AS engagement
FROM hr_data
GROUP BY attrition 
ORDER BY 2 DESC;

#9. Which combination of department and overtime has the highest attrition?
SELECT 
    department,
    overtime,
    ROUND(AVG(attrition) * 100, 2) AS attrition_rate_percent
FROM hr_data
GROUP BY department, overtime
ORDER BY attrition_rate_percent DESC;