-- Select command
	SELECT * FROM celebs;
	
--Relational Databases
    --INTEGER, a positive or negative whole number
    --TEXT, a text string
    --DATE, the date formatted as YYYY-MM-DD
    --REAL, a decimal value

--Statements
	--A statement is text that the database recognizes as a valid command. Statements always end in a semicolon ;
	CREATE TABLE table_name (
	   column_1 data_type, 
	   column_2 data_type, 
	   column_3 data_type
	);
	SELECT * FROM celebs;

--Create
	CREATE TABLE celebs (
	   id INTEGER, 
	   name TEXT, 
	   age INTEGER
	);
	
-- Insert
	INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 22);
	INSERT INTO celebs (id, name, age) VALUES (2, 'Beyonce Knowles', 33); 
	INSERT INTO celebs (id, name, age) VALUES (3, 'Jeremy Lin', 26); 
	INSERT INTO celebs (id, name, age) VALUES (4, 'Taylor Swift', 26); 

-- SELECT
	SELECT name FROM celebs;
	SELECT * FROM celebs;
	
-- ALTER
	-- The ALTER TABLE statement adds a new column to a table. 
	-- You can use this command when you want to add columns to a table. 
	ALTER TABLE celebs
	ADD COLUMN twitter_handle TEXT
	
-- UPDATE
	--The UPDATE statement edits a row in a table. 
	--You can use the UPDATE statement when you want to change existing records.
	UPDATE celebs 
	SET twitter_handle = '@taylorswift13' 
	WHERE id = 4; 
	
-- DELETE
	--The DELETE FROM statement deletes one or more rows from a table. 
	--You can use the statement when you want to delete existing records.
	
	--Delete all of the rows that have a NULL value in the twitter handle column.
	DELETE FROM celebs 
	WHERE twitter_handle IS NULL;

-- Constraints
	--Constraints that add information about how a column can be used are invoked 
	--after specifying the data type for a column. They can be used to tell the 
	--database to reject inserted data that does not adhere to a certain restriction. 
	--The statement below sets constraints on the celebs table.
	
	CREATE TABLE celebs (
	   id INTEGER PRIMARY KEY, 
	   name TEXT UNIQUE,
	   date_of_birth TEXT NOT NULL,
	   date_of_death TEXT DEFAULT 'Not Applicable'
	);
	
	--1. PRIMARY KEY columns can be used to uniquely identify the row. 
	--Attempts to insert a row with an identical value to a row already in the table 
	--.will result in a constraint violation which will not allow you to insert the 
	--new row.

	--2. UNIQUE columns have a different value for every row. 
	--This is similar to PRIMARY KEY except a table can have many different UNIQUE 
	--columns.

	--3. NOT NULL columns must have a value. Attempts to insert a row without a value 
	--for a NOT NULL column will result in a constraint violation and the new row 
	--will not be inserted.

	--4. DEFAULT columns take an additional argument that will be the assumed value 
	--for an inserted row if the new row does not specify a value for that column.
	
	
	 CREATE TABLE awards (
	   id INTEGER PRIMARY KEY,
	   recipient TEXT NOT NULL,
	   award_name TEXT DEFAULT 'Grammy'
	);
	
-- SELECT
	SELECT name, genre FROM movies;
	SELECT name, genre, year FROM movies;
	SELECT * FROM movies;
	
-- AS
	--AS is a keyword in SQL that allows you to rename a column or table using an alias. The new name 
	--can be anything you want as long as you put it inside of single quotes.
    --Although it’s not always necessary, it’s best practice to surround your 
	--aliases with single quotes.
    --When using AS, the columns are not being renamed in the table. The aliases 
	--only appear in the result.
	SELECT name AS 'movie'
	FROM movies;
	
	SELECT imdb_rating  AS 'IMDb'
	FROM movies;

-- Distinct
	--When we are examining data in a table, it can be helpful to know 
	--what distinct values exist in a particular column.
	--DISTINCT is used to return unique values in the output. 
	--It filters out all duplicate values in the specified column(s).
	SELECT DISTINCT genre 
	FROM movies;
	
	SELECT DISTINCT year 
	FROM movies;

-- WHERE
	--We can restrict our query results using 
	--the WHERE clause in order to obtain only the information we want.
	SELECT *
	FROM movies
	WHERE imdb_rating > 8;
	
    --WHERE clause filters the result set to only include rows where the 
	--following condition is true.
    --imdb_rating > 8 is the condition. Here, only rows with a value greater 
	--than 8 in the imdb_rating column will be returned.

	--Comparison operators used with the WHERE clause are:
    -- = equal to
    -- != not equal to
    -- > greater than
    -- < less than
    -- >= greater than or equal to
    -- <= less than or equal to
	
	SELECT * 
	FROM movies 
	WHERE imdb_rating < 5;

-- LIKE
	--LIKE can be a useful operator when you want to compare similar values
	--The movies table contains two films with similar titles, ‘Se7en’ and ‘Seven’.

	--How could we select all movies that start with ‘Se’ and end with ‘en’ and 
	--have exactly one character in the middle?

	SELECT * 
	FROM movies
	WHERE name LIKE 'Se_en';
	
	--The percentage sign % is another wildcard character that can be used with LIKE
	--This statement below filters the result set to only include movies with names 
	--that begin with the letter ‘A’:
	SELECT * 
	FROM movies
	WHERE name LIKE 'A%';
	
	--A% matches all movies with names that begin with letter ‘A’
    --%a matches all movies that end with ‘a’
	-- We can also use % both before and after a pattern:
	SELECT * 
	FROM movies 
	WHERE name LIKE '%man%';
		
	-- Here, any movie that contains the word ‘man’ in its name will be returned in the result.
	
	SELECT * 
	FROM movies
	WHERE name LIKE 'The %';

-- IS NULL
	--missing values
	--Unknown values are indicated by NULL
	-- It is not possible to test for NULL values with comparison operators, such as = and !=
	--Instead, we will have to use these operators:
		--IS NULL
		--IS NOT NULL
	SELECT name
	FROM movies 
	WHERE imdb_rating IS NOT NULL;

	SELECT name
	FROM movies 
	WHERE imdb_rating IS NULL;

-- Between
	--The BETWEEN operator is used in a WHERE clause to filter the result set within a certain range. 
	--It accepts two values that are either numbers, text or dates.
	SELECT *
	FROM movies
	WHERE year BETWEEN 1990 AND 1999;


	--In this statement, BETWEEN filters the result set to only include movies with names that begin 
	--with the letter ‘A’ up to, but not including ones that begin with ‘J’.
	SELECT *
	FROM movies
	WHERE name BETWEEN 'A' AND 'J';
	
	--Between D and G
	SELECT *
	FROM movies
	WHERE name BETWEEN 'D' and 'G';

	SELECT *
	FROM movies
	WHERE year BETWEEN 1970 AND 1979;

--	And
	SELECT * 
	FROM movies
	WHERE year BETWEEN 1990 AND 1999
	   AND genre = 'romance';

    --year BETWEEN 1990 AND 1999 is the 1st condition.
    --genre = 'romance' is the 2nd condition.
    --AND combines the two conditions.
	
	SELECT *
	FROM movies
	WHERE year BETWEEN 1970 AND 1979
	  AND imdb_rating > 8;
	  
	SELECT *
	FROM movies
	WHERE year < 1985
		AND genre == 'horror';
	
--	Or
	SELECT *
	FROM movies
	WHERE year > 2014
	   OR genre = 'action';
	
	SELECT *
	FROM movies
	WHERE genre = 'comedy'
	   OR genre = 'romance';
	   
-- Order By
	--We can sort the results using ORDER BY, either alphabetically or numerically. 
	--Sorting the results often makes the data more useful and easier to analyze.
	SELECT *
	FROM movies
	ORDER BY name;
    --ORDER BY is a clause that indicates you want to sort the result set by a particular column.
    --name is the specified column.
	
	SELECT *
	FROM movies
	WHERE imdb_rating > 8
	ORDER BY year DESC;	
	
    --DESC is a keyword used in ORDER BY to sort the results in descending order (high to low or Z-A).
    --ASC is a keyword used in ORDER BY to sort the results in ascending order (low to high or A-Z).

	SELECT name, year
	FROM movies
	ORDER BY name;

	SELECT name, year, imdb_rating
	FROM movies
	ORDER BY imdb_rating DESC;
	
-- Limit
	--For instance, imagine that we just want to see a few examples of records.
	SELECT *
	FROM movies
	LIMIT 10;
		
	SELECT *
	FROM movies
	ORDER BY imdb_rating DESC
	LIMIT 3;
		
-- Case
	--A CASE statement allows us to create different outputs (usually in the SELECT statement). 
	--It is SQL’s way of handling if-then logic.
	
	--Suppose we want to condense the ratings in movies to three levels:
    --If the rating is above 8, then it is Fantastic.
    --If the rating is above 6, then it is Poorly Received.
    --Else, Avoid at All Costs.

	SELECT name,
	 CASE
	  WHEN imdb_rating > 8 THEN 'Fantastic'
	  WHEN imdb_rating > 6 THEN 'Poorly Received'
	  ELSE 'Avoid at All Costs'
	 END
	FROM movies;
	
    --Each WHEN tests a condition and the following THEN gives us the string if the condition is true.
    --The ELSE gives us the string if all the above conditions are false.
    --The CASE statement must end with END.

	--In the result, you have to scroll right because the column name is very long. 
	--To shorten it, we can rename the column to ‘Review’ using AS:
	
	SELECT name,
	 CASE
	  WHEN imdb_rating > 8 THEN 'Fantastic'
	  WHEN imdb_rating > 6 THEN 'Poorly Received'
	  ELSE 'Avoid at All Costs'
	 END AS 'Review'
	FROM movies;
	
	SELECT name,
	 CASE
	  WHEN genre = 'romance' THEN 'Chill'
	  WHEN genre = 'comedy' THEN 'Chill'
	  ELSE 'Intense'
	 END AS 'Mood'
	FROM movies;

-- Review
	--Let’s summarize:
		--SELECT is the clause we use every time we want to query information from a database.
		--AS renames a column or table.
		--DISTINCT return unique values.
		--WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
		--LIKE and BETWEEN are special operators.
		--AND and OR combines multiple conditions.
		--ORDER BY sorts the result.
		--LIMIT specifies the maximum number of rows that the query will return.
		--CASE creates different outputs.

-- Aggregate Functions
-- Count
	--COUNT() is a function that takes the name of a column as an argument and counts the number of non-empty values in that column.
	SELECT COUNT(*) 
	FROM fake_apps;
	
	SELECT COUNT(*)
	FROM fake_apps
	WHERE price = 0;
	
-- SUM
	--SUM() is a function that takes the name of a column as an argument and returns the sum of all the values in that column.
	SELECT SUM(downloads)
	FROM fake_apps;
	
-- Max / Min
	--The MAX() and MIN() functions return the highest and lowest values in a column, respectively.
	SELECT MIN(downloads)
	FROM fake_apps;
	
	SELECT MAX(price)
	FROM fake_apps;

-- Average
	--SQL uses the AVG() function to quickly calculate the average value of a particular column.
	SELECT AVG(downloads)
	FROM fake_apps;
	
	SELECT AVG(price)
	FROM fake_apps;
	
-- Round
	--By default, SQL tries to be as precise as possible without rounding. We can make the result table easier to read using the ROUND() function.
	--ROUND() function takes two arguments inside the parenthesis:
		--a column name
		--an integer
	--It rounds the values in the column to the number of decimal places specified by the integer. 
	SELECT ROUND(price, 0)
	FROM fake_apps;
	--Here, we pass the column price and integer 0 as arguments. SQL rounds the values in the column to 0 decimal places in the output.
	SELECT ROUND(AVG(price), 2)
	FROM fake_apps;

-- Group By I
	--For instance, we might want to know the mean IMDb ratings for all movies each year. 
	--We could calculate each number by a series of queries with different WHERE statements, like so:
	SELECT AVG(imdb_rating)
	FROM movies
	WHERE year = 1999;

	SELECT AVG(imdb_rating)
	FROM movies
	WHERE year = 2000;

	SELECT AVG(imdb_rating)
	FROM movies
	WHERE year = 2001;
	
	--We can use GROUP BY to do this in a single step:
	SELECT year,
	   AVG(imdb_rating)
	FROM movies
	GROUP BY year
	ORDER BY year;
	
	SELECT price, COUNT(*) 
	FROM fake_apps
	GROUP BY price;
	
	--In the previous query, add a WHERE clause to count the total number of apps that have been downloaded more than 20,000 times, at each price.
	SELECT price, COUNT(*) 
	FROM fake_apps
	WHERE downloads > 20000
	GROUP BY price;
	
	--Write a new query that calculates the total number of downloads for each category. Select category and SUM(downloads).
	SELECT category, SUM(downloads) 
	FROM fake_apps
	GROUP BY category;
	
-- Group By
	--For instance, we might want to know how many movies have IMDb ratings that round to 1, 2, 3, 4, 5. We could do this using the following syntax:
	SELECT ROUND(imdb_rating),
	  COUNT(name)
	FROM movies
	GROUP BY ROUND(imdb_rating)
	ORDER BY ROUND(imdb_rating);

	--SQL lets us use column reference(s) in our GROUP BY that will make our lives easier.
		--1 is the first column selected
		--2 is the second column selected
		--3 is the third column selected
		--and so on.
	SELECT ROUND(imdb_rating),
	   COUNT(name)
	FROM movies
	GROUP BY 1
	ORDER BY 1;
	
	SELECT category, 
	   price,
	   AVG(downloads)
	FROM fake_apps
	GROUP BY category, price;

-- Having
	--For instance, imagine that we want to see how many movies of different genres were produced each year, but we only care about years and genres with at least 10 movies.
	--We can’t use WHERE here because we don’t want to filter the rows; we want to filter groups.
	--This is where HAVING comes in.
	--HAVING is very similar to WHERE. In fact, all types of WHERE clauses you learned about thus far can be used with HAVING.
	--We can use the following for the problem:
	SELECT year,
	   genre,
	   COUNT(name)
	FROM movies
	GROUP BY 1, 2
	HAVING COUNT(name) > 10;
	
	--Add a HAVING clause to restrict the query to price points that have more than 10 apps.
	SELECT price, 
	   ROUND(AVG(downloads)),
	   COUNT(*)
	FROM fake_apps
	GROUP BY price
	HAVING COUNT(*) > 10;
	
-- Review
	--You just learned how to use aggregate functions to perform calculations on your data. What can we generalize so far?
		--COUNT(): count the number of rows
    	--SUM(): the sum of the values in a column
    	--MAX()/MIN(): the largest/smallest value
    	--AVG(): the average of the values in a column
    	--ROUND(): round the values in the column

	--Aggregate functions combine multiple rows together to form a single value of more meaningful information.
    	--GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
    	--HAVING limit the results of a query based on an aggregate property.

	
-- Get data -------------------------------------------------------------------------------
	SELECT * FROM orders LIMIT 5;
	SELECT * FROM subscriptions LIMIT 5;
	SELECT * FROM customers LIMIT 5;

--Combining Tables Manually -------------------------------------------------------------------------------

--Combining Tables with SQL -------------------------------------------------------------------------------
	--Make sure to join on the subscription_id column
		SELECT * FROM orders JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id;

		---------
	--    The first line selects all columns from our combined table. If we only want to select certain columns, we can specify which ones we want.
	--    The second line specifies the first table that we want to look in, orders
	--    The third line uses JOIN to say that we want to combine information from orders with customers.
	--    The fourth line tells us how to combine the two tables. We want to match orders table’s customer_id column with customers table’s customer_id column.
		--------------
	-- Second query
		SELECT *
		FROM orders
		JOIN subscriptions
			ON orders.subscription_id = subscriptions.subscription_id
		WHERE subscriptions.description = 'Fashion Magazine';

-- Inner Joins -------------------------------------------------------------------------------
	-- Count the number of subscribers who get a print newspaper using COUNT()
		SELECT COUNT(*) FROM newspaper;
	-- Count the number of subscribers who get an online newspaper using COUNT()
		SELECT COUNT(*) FROM online;
	-- Join newspaper table and online table on their id columns (the unique ID of the subscriber)
		SELECT COUNT(*)
		FROM newspaper
		JOIN online
			ON newspaper.id = online.id;
		
-- Left Joins
	--What if we want to combine two tables and keep some of the un-matched rows?
	--SQL lets us do this through a command called LEFT JOIN. A left join will keep all rows from the first table, regardless of whether there is a matching row in the second table.
	SELECT *
	FROM table1
	LEFT JOIN table2
	  ON table1.c2 = table2.c2;
		
    --The first line selects all columns from both tables.
    --The second line selects table1 (the “left” table).
    --The third line performs a LEFT JOIN on table2 (the “right” table).
    --The fourth line tells SQL how to perform the join (by looking for matching values in column c2).

	SELECT *
	FROM newspaper
	LEFT JOIN online
	  ON newspaper.id = online.id
	WHERE online.id IS NULL; --This will select rows where there was no corresponding row from the online table
	
--Primary Key vs Foreign Key
	--Each of these tables has a column that uniquely identifies each row of that table:
    --order_id for orders
    --subscription_id for subscriptions
    --customer_id for customers
	
	--Primary keys have a few requirements:
		--None of the values can be NULL.
		--Each value must be unique (i.e., you can’t have two customers with the same customer_id in the customers table).
		--A table can not have more than one primary key column
		
	--When the primary key for one table appears in a different table, it is called a foreign key.
	
		
	SELECT *
	FROM classes
	JOIN students
		ON classes.id = students.class_id;
		
	
    --The classes table contains information on the classes that the school offers. Its primary key is id.
    --The students table contains information on all students in the school. Its primary key is id. It contains the foreign key class_id, which corresponds to the primary key of classes.
	--Perform an inner join of classes and students using the primary and foreign keys described above, and select all the columns.
		
--Cross Join
	--Sometimes, we just want to combine all rows of one table with all rows of another table.
	
	SELECT shirts.shirt_color,
	   pants.pants_color
	FROM shirts
	CROSS JOIN pants;
	
    --The first two lines select the columns shirt_color and pants_color.
    --The third line pulls data from the table shirts.
    --The fourth line performs a CROSS JOIN with pants.

	--Let’s start by counting the number of customers who were subscribed to the newspaper during March.
	--Use COUNT(*) to count the number of rows and a WHERE clause to restrict to two conditions:
    --start_month <= 3
    --end_month >= 3
	SELECT COUNT(*)
	FROM newspaper
	WHERE start_month <= 3 AND end_month >= 3;
		
		
	--Our database contains another table called months which contains the numbers between 1 and 12.
	--Select all columns from the cross join of newspaper and months.
	SELECT *
	FROM newspaper
	CROSS JOIN months;	
		
	--Create a third query where you add a WHERE statement to your cross join to restrict to two conditions:
		--start_month <= month
		--end_month >= month
	--This will select all months where a user was subscribed.
	SELECT *
	FROM newspaper
	CROSS JOIN months
	WHERE newspaper.start_month <= months.month AND newspaper.end_month >= months.month;	
	
	--Create a final query where you aggregate over each month to count the number of subscribers.
	SELECT month,
	  COUNT(*)
	FROM newspaper
	CROSS JOIN months
	WHERE newspaper.start_month <= months.month AND newspaper.end_month >= months.month
	GROUP BY months.month;
		
--Union (concatenate tables with same names)
	--Sometimes we just want to stack one dataset on top of the other. Well, the UNION operator allows us to do that.
	SELECT * FROM newspaper
	UNION
	SELECT * FROM online;
	
--With
	--Often times, we want to combine two tables, but one of the tables is the result of another calculation.
	--Let’s return to our magazine order example. Our marketing department might want to know a bit more about our customers. 
	--For instance, they might want to know how many magazines 
	--each customer subscribes to. We can easily calculate this using our orders table:
	SELECT customer_id,
	   COUNT(subscription_id) AS 'subscriptions'
	FROM orders
	GROUP BY customer_id;
	
	--This query is good, but a customer_id isn’t terribly useful for our marketing department, they probably want to know the customer’s name.
	--We want to be able to join the results of this query with our customers table, which will tell us the name of each customer. We can do this by using a WITH clause.
	WITH previous_results AS (
	   SELECT ...
	   ...
	   ...
	   ...
	)
	SELECT *
	FROM previous_results
	JOIN customers
	  ON _____ = _____;
	
    --The WITH statement allows us to perform a separate query (such as aggregating customer’s subscriptions)
    --previous_results is the alias that we will use to reference any columns from the query inside of the WITH clause
    --We can then go on to do whatever we want with this temporary table (such as join the temporary table with another table)
	WITH previous_query AS (
			SELECT customer_id,
			COUNT(subscription_id) as subscriptions
			FROM orders
			GROUP BY customer_id)
	
	SELECT customers.customer_name,
	previous_query.subscriptions
	FROM previous_query
	JOIN customers
		ON customers.customer_id = previous_query.customer_id;
		
--Review


	--JOIN will combine rows from different tables if the join condition is true.
    --LEFT JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.
    --Primary key is a column that serves a unique identifier for the rows in the table.
    --Foreign key is a column that contains the primary key to another table.
    --CROSS JOIN lets us combine all rows of one table with all rows of another table.
    --UNION stacks one dataset on top of another.
    --WITH allows us to define one or more temporary tables that can be used in the final query.

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	