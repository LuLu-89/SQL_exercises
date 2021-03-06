#1: 
SELECT EMP_ID, EMP_NAME AS NAME, TASK_DESC AS TASK, DATE, HOURS
FROM TEST_HOURS
JOIN TEST_EMP USING (EMP_ID)
JOIN TEST_TASK USING (TASK_CD)
ORDER BY EMP_ID, DATE;

#2: 
SELECT TASK_DESC AS TASK, SUM(HOURS) AS TOTAL_HOURS
FROM TEST_HOURS
JOIN TEST_TASK USING (TASK_CD)
ORDER BY TASK DESC;

#3:
SELECT EMP_ID, EMP_NAME AS NAME, DESIGN, CODING, FUNCTIONAL_TEST, QA
FROM TEST_HOURS
JOIN TEST_EMP USING (EMP_ID)
JOIN TEST_TASK USING (TASK_CD)
PIVOT (
  SUM(DESIGN)
  SUM(CODING)
  SUM(FUNCTIONAL_TEST)
  SUM(QA)
FOR TASK IN (DESIGN, CODING, FUNCTIONAL_TEST, QA)
) 
AS EMPLOYEE_TASKS
ORDER BY NAME;

#4:
SELECT DATE, (SUM(HOURS)/(COUNT(HOURS))) AS HOURS
FROM TEST_HOURS
JOIN TEST_EMP USING (EMP_ID)
JOIN TEST_TASK USING (TASK_CD);
