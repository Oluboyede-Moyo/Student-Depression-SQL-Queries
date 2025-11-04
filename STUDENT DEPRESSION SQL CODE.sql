CREATE DATABASE [STUDENT DEPRESSION PROJECT]

USE  [STUDENT DEPRESSION PROJECT]

SELECT * 
FROM [Depression+Student+Dataset]

-- COUNTING THE GENDER (MALE AND FEMALE)
SELECT Gender,
	   COUNT(*) 'Gender Count'
FROM [Depression+Student+Dataset]
GROUP BY Gender

-- CHANGING THE MALE AND FEMALE COLUMN TO 'M' AND 'F' RESPECTIVELY
UPDATE [dbo].[Depression+Student+Dataset]
SET Gender = 'F' WHERE Gender = 'Female'

UPDATE [dbo].[Depression+Student+Dataset]
SET Gender = 'M' WHERE Gender = 'Male'

-- CHECKING TO SEE THE CHANGES MADE
SELECT Gender 
FROM [dbo].[Depression+Student+Dataset]

-- CHECKING FOR NULL VALUES IN GENDER COLUMN
SELECT * 
FROM [dbo].[Depression+Student+Dataset]
WHERE Gender IS NULL

-- AGE COLUMN 
SELECT Age,COUNT(*) 'Age Count'
FROM [dbo].[Depression+Student+Dataset]
GROUP BY Age
ORDER BY Age DESC

-- ADDING 'AGE GROUP' COLUMN TO PUT THE AGES IN DIFFERENT GROUPS
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD Age_Group VARCHAR(50) 

-- UPDATING THE NEW 'AGE GROUP' COLUMN
UPDATE [dbo].[Depression+Student+Dataset]
SET Age_Group = CASE WHEN Age BETWEEN 18 AND 24 THEN 'Young Adult'
				ELSE
				CASE WHEN Age BETWEEN 25 AND 30 THEN 'Adult'
				ELSE 'Middle Aged'
				END
				END

-- CHECKING THE UDATED COLUMN
SELECT Age_Group, COUNT(*)
FROM [dbo].[Depression+Student+Dataset]
GROUP BY Age_Group

-- MODIFYING THE 'ACADEMIC PRESSURE' COLUMN
SELECT DISTINCT(Academic_Pressure)
FROM [dbo].[Depression+Student+Dataset]

-- RANKING THE 'ACADEMIC PRESSURE' COLUMN WITH '1' BEING THE LEAST SERIOUS AND '5' BEING THE MOST SERIOUS
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD School_Pressure VARCHAR(30)

-- CHANGE THE ACADEMIC PRESSURE TO ACTUAL VALUES INSTEAD OF INTEGARS
UPDATE [dbo].[Depression+Student+Dataset]
SET School_Pressure = 
    CASE 
        WHEN Academic_Pressure = 5 THEN 'Extreme Pressure'
        WHEN Academic_Pressure = 4 THEN 'High Pressure'
        WHEN Academic_Pressure = 3 THEN 'Moderate Pressure'
        WHEN Academic_Pressure = 2 THEN 'Mild Pressure'
        ELSE 'Minimal Pressure'
    END

-- DELETING THE 'ACADEMIC PRESSURE' COLUMN AS IT IS NO LONGER NEEDED
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Academic_Pressure]

-- MODIFYING THE 'STUDY SATISFACTION' COLUMN
SELECT DISTINCT(Study_Satisfaction)
FROM [dbo].[Depression+Student+Dataset]

-- CREATING A NEW COLUMN TO PUT IN THE NEW VALUES OF THE 'STUDY_SATISFACTION' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD [Study Satisfaction] VARCHAR(30)

-- FILLING THE NEW COLUMN WITH VARCHAR VALUES
UPDATE [dbo].[Depression+Student+Dataset]
SET [Study Satisfaction] = 
    CASE 
        WHEN Study_Satisfaction = 5 THEN 'Very Dissatisfied'
        WHEN Study_Satisfaction = 4 THEN 'Dissatisfied '
        WHEN Study_Satisfaction = 3 THEN 'Neutral'
        WHEN Study_Satisfaction = 2 THEN 'Satisfied'
        ELSE 'Very Satisfied'
    END
-- DROP THE OLD 'STUDY SATISFACTION' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Study_Satisfaction]

-- MODIFYING THE [Have_you_ever_had_suicidal_thoughts] COLUMN
SELECT DISTINCT([Have_you_ever_had_suicidal_thoughts])
FROM[dbo].[Depression+Student+Dataset]

-- CREATING A NEW COLUMN TO PUT IN THE NEW VALUES OF THE '[Have_you_ever_had_suicidal_thoughts]' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD [Suicidal Thoughts] VARCHAR(30)

-- FILLING THE NEW COLUMN WITH VARCHAR VALUES
UPDATE [dbo].[Depression+Student+Dataset]
SET [Suicidal Thoughts] = 
    CASE 
        WHEN Have_you_ever_had_suicidal_thoughts = 0 THEN 'No'
        ELSE 'Yes'
    END

-- DROP THE OLD 'Have_you_ever_had_suicidal_thoughts' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Have_you_ever_had_suicidal_thoughts]

SELECT * FROM[dbo].[Depression+Student+Dataset]

-- MODIFYING THE 'FINANCIAL STRESS' COLUMN
SELECT DISTINCT(Financial_Stress)
FROM [dbo].[Depression+Student+Dataset]

-- CREATING A NEW COLUMN TO PUT IN THE NEW VALUES OF THE 'Financial_Stress' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD [Financial Stress] VARCHAR(30)

-- FILLING THE NEW COLUMN WITH  VALUES
UPDATE [dbo].[Depression+Student+Dataset]
SET [Financial Stress] = 
    CASE 
        WHEN Financial_Stress = 5 THEN 'Extreme Stress'
        WHEN Financial_Stress = 4 THEN 'High Stress'
        WHEN Financial_Stress = 3 THEN 'Moderate Stress'
        WHEN Financial_Stress = 2 THEN 'Mild Stress'
        ELSE 'No Stress'
    END

-- DELETING THE OLD 'FINANCIAL STRESS' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Financial_Stress]

-- MODIFYING THE '[Family_History_of_Mental_Illness]' COLUMN
SELECT DISTINCT([Family_History_of_Mental_Illness])
FROM [dbo].[Depression+Student+Dataset]

-- CREATING A NEW COLUMN TO PUT IN THE NEW VALUES OF THE '[Family_History_of_Mental_Illness]' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD [Family History of Mental Illness] VARCHAR(20)

-- FILLING THE NEW COLUMN WITH  VALUES
UPDATE [dbo].[Depression+Student+Dataset]
SET [Family History of Mental Illness] = 
    CASE 
        WHEN [Family_History_of_Mental_Illness] = 0 THEN 'Absent'
        ELSE 'Present'
    END

-- DELETING THE OLD COLUMN OF '[Family_History_of_Mental_Illness]'
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Family_History_of_Mental_Illness]

-- MODIFYING THE '[Depression]' COLUMN
SELECT DISTINCT([Depression])
FROM [dbo].[Depression+Student+Dataset]

-- CREATING A NEW COLUMN TO PUT IN THE NEW VALUES OF THE '[Depression]' COLUMN
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD [Depression Status] VARCHAR(30)

-- FILLING THE NEW COLUMN WITH  VALUES
UPDATE [dbo].[Depression+Student+Dataset]
SET [Depression Status] = 
    CASE 
    WHEN [Depression] = 0 THEN 'Existent'
        ELSE 'Non-Existent'
    END

-- DELETING THE OLD COLUMN OF '[Depression]'
ALTER TABLE [dbo].[Depression+Student+Dataset]
DROP COLUMN [Depression]

-- ADDING AN INDEX COLUMN TO EACH RECORD FOR UNIQUE IDENTIFICATION
ALTER TABLE [dbo].[Depression+Student+Dataset]
ADD Index_Column INT IDENTITY(1,1)

select * from [Depression+Student+Dataset]
