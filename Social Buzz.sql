CREATE DATABASE FORAGE;

USE FORAGE;


SELECT * FROM Content;
SELECT * FROM Reactions;
SELECT * FROM ReactionTypes;

--Checking for Null values
SELECT * FROM Reactions
WHERE Content_ID IS NULL
   OR User_ID IS NULL
   OR Reaction_Type IS NULL;

--Deleteing Null values
DELETE FROM Reactions
WHERE Content_ID IS NULL
   OR User_ID IS NULL
   OR Reaction_Type IS NULL;


--Applying "JOIN" to 3 tables(Content, Reaction & ReactionTypes) and Creating a new Table as "Final_Result"
SELECT Reactions.Content_ID, Reactions.Reaction_Type, Content.Content_Type, Content.Category, ReactionTypes.Score
INTO Final_Result
FROM Reactions
JOIN Content ON Reactions.Content_ID = Content.Content_ID
JOIN ReactionTypes ON Reactions.Reaction_Type = ReactionTypes.Reaction_Type;


SELECT * FROM Final_Result;


--Top 5 performing categories 
SELECT TOP 5 Category, 
SUM(Score) AS TotalScore
INTO Top_Categories
FROM Final_Result
GROUP BY Category
ORDER BY TotalScore DESC;


SELECT * FROM Top_Categories;
