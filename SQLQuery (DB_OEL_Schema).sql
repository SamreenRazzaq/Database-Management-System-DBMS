--Student:
SELECT TOP (1000) [Stu-id]
      ,[first name]
      ,[last name]
      ,[DBO]
      ,[address]
      ,[contact]
      ,[cnic]
  FROM [DB OEL].[dbo].[Student]

  --Subject:
SELECT TOP (1000) [Sub-id]
      ,[Sub-Name]
      ,[credit-hour]
  FROM [DB OEL].[dbo].[Subject]

  --CLO:
  SELECT TOP (1000) [Sub-id]
      ,[CLO-num]
      ,[description]
  FROM [DB OEL].[dbo].[CLO]

  --Assessment:
  SELECT TOP (1000) [Sub-id]
      ,[Stu-id]
      ,[marks]
      ,[CLO-num]
  FROM [DB OEL].[dbo].[Assessment]

  --Rubric:
  SELECT TOP (1000) [Sub-id]
      ,[CLO-num]
      ,[description]
  FROM [DB OEL].[dbo].[Rubric]

  --Rubric Level:
  SELECT TOP (1000) [levels]
      ,[Sub-id]
      ,[CLO-num]
      ,[description]
  FROM [DB OEL].[dbo].[Rubric-Level]
