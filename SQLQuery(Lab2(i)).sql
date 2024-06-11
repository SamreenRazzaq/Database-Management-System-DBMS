/*SELECT TOP (1000) [RegNo.]
      ,[FirstName]
      ,[LastName]
      ,[GPA]
      ,[Contact]
  FROM [Student_Table(2021-CE-13)].[dbo].[Student_Table]*/

  SELECT * FROM Student_Table
  SELECT GPA FROM Student_Table

  SELECT GPA FROM Student_Table
  WHERE GPA > 3.5

  SELECT GPA FROM Student_Table
  WHERE GPA <= 3.5

  SELECT GPA FROM Student_Table
  WHERE GPA IS NULL

 SELECT FirstName + LastName FROM Student_Table

 SELECT GPA FROM Student_Table
 WHERE GPA <= (4/2+1.3)
SELECT GPA FROM Student_Table
WHERE GPA <= (2*2-0.8)






