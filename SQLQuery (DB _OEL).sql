--CLO-Wise Class Result:

SELECT
	Assessment.[Stu-id] AS 'Student ID',
    CLO.[CLO-num] AS 'CLO Number',
    CLO.description AS 'CLO Description',
    AVG(Assessment.marks) AS 'Average Marks'
FROM CLO
LEFT JOIN Assessment
ON
    CLO.[Sub-id] = Assessment.[Sub-id]
    AND CLO.[CLO-num] = Assessment.[CLO-num]
GROUP BY
    CLO.[CLO-num], CLO.description, Assessment.[Stu-id]
ORDER BY
    CLO.[CLO-num], Assessment.[Stu-id];

--Assessment-Wise Class Result:
SELECT
	Assessment.[Stu-id] AS 'Student ID',
    Subject.[Sub-Name] AS 'Subject Name',
	Assessment.[Sub-id] AS 'Subject ID',
    Assessment.[CLO-num] AS 'CLO Number',
    Assessment.[marks] AS 'Assessment Marks'
FROM Assessment
LEFT JOIN Subject
ON 
	Assessment.[Sub-id] = Subject.[Sub-id]
ORDER BY
    Assessment.[Sub-id], Assessment.[CLO-num], Assessment.[marks];


