-- Q1. Create a table called employees with the specified structure and constraints.
-- Ans:

CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL DEFAULT 30000
);

-- Q2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
-- Ans: Constraints ensure valid and consistent data by enforcing rules at the database level.
-- Examples:
-- NOT NULL: Prevents missing values.
-- PRIMARY KEY: Ensures uniqueness and non-nullability for identifying rows.
-- UNIQUE: Ensures distinct values in a column.
-- CHECK: Validates data conditions (e.g., age >= 18).
-- FOREIGN KEY: Maintains relationships between tables.

-- Q3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
-- Ans: NOT NULL ensures that critical data is always provided. For example, in an employee database, the emp_name field being NULL would be meaningless. This constraint guarantees data completeness.
-- A Primary Key cannot contain NULL values because its purpose is to uniquely identify each row in a table.
-- NULL represents the absence of a value, which means it is unknown or undefined. Allowing NULL in a primary key would break its fundamental requirement of uniquely identifying rows.
--  - Example: If a table has emp_id as the primary key, any NULL value would make it impossible to determine which employee the row refers to, thus violating data integrity.

-- Q4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
-- Ans: Adding a constraint: Use ALTER TABLE with ADD CONSTRAINT.
--  - Example: ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary > 0);
-- Removing a constraint: Use ALTER TABLE with DROP CONSTRAINT.
--  - Example: ALTER TABLE employees DROP CONSTRAINT chk_salary;

-- Q5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
-- Ans: When a constraint is violated, the database prevents the operation to maintain data integrity.
-- - Consequences include:

--  - Insert: The row will not be added if it violates any constraint.
--  - Update: The update will fail if it results in invalid data (e.g., setting age < 18).
--  - Delete: If foreign key constraints exist, the delete may fail if the row is referenced in another table.
-- Example Scenario:

-- If we insert an employee with an age of 15 (violating the CHECK constraint age >= 18), the database rejects the operation.

-- - Error Message Example:

--  - ERROR: new row for relation "employees" violates check constraint "employees_age_check"
--  - DETAIL: Failing row contains (101, John, 15, john@example.com, 30000).
-- This ensures only valid, consistent data is stored.

-- Q6. Modify the products table to add constraints for product_id as a primary key and set a default value of 50.00 for the price.
-- Ans:
-- Add primary key
-- ALTER TABLE products ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- Set default value for price
-- ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;

-- Q7. Write a query to fetch the student_name and class_name for each student using an INNER JOIN between Students and Classes.
-- Ans: SELECT s.student_name, c.class_name FROM Students s INNER JOIN Classes c ON s.class_id = c.class_id;

-- Q8. Write a query to show all order_id, customer_name, and product_name, ensuring all products are listed, even if not associated with an order.
-- Ans: SELECT o.order_id, c.customer_name, p.product_name FROM Products p LEFT JOIN Orders o ON o.order_id = porder_id LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- Q9. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
-- Ans: SELECT p.product_name, SUM(s.amount) AS total_sales FROM Sales s INNER JOIN Products p ON s.product_id = p.product_id GROUP BY p.product_name;

-- Q10. Display order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables (Orders, Customers, Order_Details).
-- Ans: SELECT o.order_id, c.customer_name, od.quantity FROM Orders o INNER JOIN Customers c ON o.customer_id = c.customer_id INNER JOIN Order_Details od ON o.order_id = od.order_id;

# SQL Commands

USE mavenmovies;

-- Q1. Identify Primary and Foreign Keys in Maven Movies DB
-- Ans: 
-- 1. Primary Keys:

-- Format: Primary Key (Table Name):

-- actor_id (actor)
-- actor_award_id (actor_award)
-- address_id (address)
-- advisor_id (advisor)
-- category_id (category)
-- city_id (city)
-- country_id (country)
-- customer_id (customer)
-- emp_id (emp)
-- film_id (film)
-- actor_id, film_id (film_actor)
-- film_id, category_id (film_category)
-- film_id (film_text)
-- inventory_id (inventory)
-- investor_id (investor)
-- language_id (language)
-- payment_id (payment)
-- rental_id (rental)
-- staff_id (staff)

-- 2. Foreign Keys:

-- Format: foreign_key_column → Referenced_Table (in Current_Table)

-- manager_staff_id → Staff Table (in Store Table)
-- address_id → Address Table (in Store Table)
-- store_id → Store Table (in Staff Table)
-- address_id → Address Table (in Staff Table)
-- staff_id → Staff Table (in Rental Table)
-- inventory_id → Inventory Table (in Rental Table)
-- customer_id → Customer Table (in Rental Table)
-- staff_id → Staff Table (in Payment Table)
-- rental_id → Rental Table (in Payment Table)
-- customer_id → Customer Table (in Payment Table)
-- store_id → Store Table (in Inventory Table)
-- film_id → Film Table (in Inventory Table)
-- original_language_id → Language Table (in Film Table)
-- language_id → Language Table (in Film Table)
-- film_id → Film Table (in Film Category Table)
-- category_id → Category Table (in Film Category Table)
-- film_id → Film Table (in Film Actor Table)
-- actor_id → Actor Table (in Film Actor Table)
-- store_id → Store Table (in Customer Table)
-- address_id → Address Table (in Customer Table)
-- country_id → Country Table (in City Table)
-- city_id → City Table (in Address Table)

-- Difference:
-- - Primary Key: Unique identifier for each row in a table.
-- - Foreign Key: Links one table to another, enforcing referential integrity.

-- Q2. List all details of actors
-- Ans: 
SELECT * FROM actor;

-- Q3. List all customer information from DB
-- Ans: 
SELECT * FROM customer;

-- Q4. List different countries
-- Ans: 
SELECT DISTINCT country FROM country;

-- Q5. Display all active customers.
-- Ans: 
SELECT * FROM customer WHERE active = 1;

-- Q6. List all rental IDs for customer with ID 1
-- Ans: 
SELECT rental_id FROM rental WHERE customer_id = 1;

-- Q7.Display all films whose rental duration is greater than 5
-- Ans: 
SELECT * FROM film WHERE rental_duration > 5;

-- Q8. List the total number of films whose replacement cost is greater than 15 and less than 20.
-- Ans: 
SELECT COUNT(*) FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- Q9. Display the count of unique first names of actors.
-- Ans: 
SELECT COUNT(DISTINCT first_name) AS unique_first_names FROM actor;

-- Q10. Display the first 10 records from the customer table.
-- Ans: 
SELECT * FROM customer LIMIT 10;

-- Q11. Display the first 3 records from the customer table whose first name starts with ‘B’.
-- Ans: 
SELECT * FROM customer LIMIT 10; SELECT * FROM customer;

-- Q12. Display the names of the first 5 movies which are rated as ‘G’.
-- Ans: 
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

-- Q13. Find all customers whose first name starts with "A".
-- Ans:
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- Q14. Find all customers whose first name ends with "A".
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE '%A';

-- Q15. Display the list of first 4 cities which start and end with ‘A’.
-- Ans: 
SELECT city FROM city WHERE city LIKE 'A%' AND city LIKE '%A' LIMIT 4;

-- Q16. Find all customers whose first name have "NI" in any position.
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE '%NI%';

-- Q17. Find all customers whose first name have "R" in the second position.
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE '_R%';

-- Q17. Find all customers whose first name have "R" in the second position.
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE '_R%';

-- Q18. Find all customers whose first name starts with "A" and are at least 5 characters in length.
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

-- Q19. Find all customers whose first name starts with "A" and ends with "O".
-- Ans: 
SELECT * FROM customer WHERE first_name LIKE 'A%O';

-- Q20. Get the films with PG and PG-13 rating using IN operator.
-- Ans: 
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

-- Q21. Get the films with length between 50 to 100 using BETWEEN operator.
-- Ans: 
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- Q22. Get the top 50 actors using LIMIT operator.
-- Ans: 
SELECT * FROM actor LIMIT 50;

-- Q23. Get the distinct film IDs from inventory table.
-- Ans: 
SELECT DISTINCT film_id FROM inventory;

# Functions

	# Basic Aggregate Functions:
    
-- Q1. Retrieve the total number of rentals made in the Sakila database.
-- Ans: 
SELECT COUNT(*) AS total_rentals FROM rental;

-- Q2. Find the average rental duration (in days) of movies rented from the Sakila database.
-- Ans: 
SELECT AVG(rental_duration) AS avg_rental_duration FROM film;

-- Q3. Display the first name and last name of customers in uppercase.
-- Ans: 
SELECT UPPER(first_name) AS first_name, UPPER(last_name) AS last_name FROM customer;

-- Q4. Extract the month from the rental date and display it alongside the rental ID.
-- Ans: 
SELECT rental_id, MONTH(rental_date) AS rental_month FROM rental;

-- Q5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- Ans: 
SELECT customer_id, COUNT(*) AS rental_count FROM rental GROUP BY customer_id;

	# GROUP BY

-- Q6. Find the total revenue generated by each store.
-- Ans: 
SELECT s.store_id, SUM(p.amount) AS total_revenue FROM payment p JOIN customer c ON p.customer_id = c.customer_id JOIN store s ON c.store_id = s.store_id GROUP BY s.store_id;

-- Q7. Determine the total number of rentals for each category of movies.
-- Ans: 
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals FROM rental r JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id GROUP BY c.name;

-- Q8. Find the average rental rate of movies in each language.
-- Ans: 
SELECT l.name AS language_name, AVG(f.rental_rate) AS avg_rental_rate FROM film f JOIN language l ON f.language_id = l.language_id GROUP BY l.name;

	# Joins

-- Q9. Display the title of the movie, customer's first name, and last name who rented it.
-- Ans:
SELECT f.title, c.first_name, c.last_name FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN customer c ON r.customer_id = c.customer_id;

-- Q10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind." 
-- Ans: 
SELECT a.first_name, a.last_name FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'Gone with the Wind';

-- Q11. Retrieve the customer names along with the total amount they've spent on rentals.
-- Ans: 
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent FROM customer c JOIN payment p ON c.customer_id = p.customer_id GROUP BY c.customer_id;

-- Q12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- Ans: 
SELECT c.first_name, c.last_name, f.title FROM customer c JOIN address a ON c.address_id = a.address_id JOIN city ci ON a.city_id = ci.city_id JOIN rental r ON c.customer_id = r.customer_id JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id WHERE ci.city = 'London' GROUP BY c.customer_id, f.title;

	# Advanced Joins and GROUP BY:

-- Q13. Display the top 5 rented movies along with the number of times they've been rented.
-- Ans: 
SELECT f.title, COUNT(r.rental_id) AS rental_count FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id GROUP BY f.title ORDER BY rental_count DESC LIMIT 5;

-- Q14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Ans: 
SELECT c.customer_id, c.first_name, c.last_name FROM customer c JOIN rental r ON c.customer_id = r.customer_id JOIN inventory i ON r.inventory_id = i.inventory_id WHERE i.store_id IN (1, 2);

# Windows Function:

-- Q1. Rank the customers based on the total amount they've spent on rentals.
-- Ans: 
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent, RANK() OVER (ORDER BY SUM(p.amount) DESC) AS ranked FROM customer c JOIN payment p ON c.customer_id = p.customer_id GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q2. Calculate the cumulative revenue generated by each film over time.
-- Ans: 
SELECT f.title, r.rental_date, SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN payment p ON r.rental_id = p.rental_id;

-- Q3. Determine the average rental duration for each film, considering films with similar lengths.
-- Ans: 
SELECT f.title, f.length, AVG(f.rental_duration) OVER (PARTITION BY f.length) AS avg_rental_duration FROM film f;

-- Q4. Identify the top 3 films in each category based on their rental counts.
-- Ans: 
SELECT * FROM ( SELECT f.title, c.name AS category_name, COUNT(r.rental_id) AS rental_count, RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS ranked FROM film f JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id GROUP BY f.film_id, f.title, c.name ) AS ranked_films WHERE ranked <= 3;

-- Q5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
-- Ans: 
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals, COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS diff_from_avg FROM customer c JOIN rental r ON c.customer_id = r.customer_id GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q6. Find the monthly revenue trend for the entire rental store over time.
-- Ans: 
SELECT MONTH(r.rental_date) AS month, YEAR(r.rental_date) AS year, SUM(p.amount) AS monthly_revenue FROM rental r JOIN payment p ON r.rental_id = p.rental_id GROUP BY YEAR(r.rental_date), MONTH(r.rental_date) ORDER BY year, month;

-- Q7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
-- Ans: 
SELECT customer_id, first_name, last_name, total_spent FROM ( SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent, NTILE(5) OVER (ORDER BY SUM(p.amount) DESC) AS percentile FROM customer c JOIN payment p ON c.customer_id = p.customer_id GROUP BY c.customer_id, c.first_name, c.last_name ) ranked_customers WHERE percentile = 1;

-- Q8. Calculate the running total of rentals per category, ordered by rental count.
-- Ans: 
SELECT c.name AS category_name, COUNT(r.rental_id) AS rental_count, SUM(COUNT(r.rental_id)) OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id)) AS running_total FROM category c JOIN film_category fc ON c.category_id = fc.category_id JOIN film f ON fc.film_id = f.film_id JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id GROUP BY c.name, f.title;

-- Q9. Find the films that have been rented less than the average rental count for their respective categories.
-- Ans: 
SELECT f.title, c.name AS category_name, COUNT(r.rental_id) AS rental_count FROM film f JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id GROUP BY f.film_id, f.title, c.name HAVING COUNT(r.rental_id) < ( SELECT AVG(rental_count) FROM ( SELECT COUNT(r.rental_id) AS rental_count FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id GROUP BY f.film_id ) AS avg_rentals_per_film );

-- Q10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- Ans: 
SELECT month, year, monthly_revenue FROM ( SELECT MONTH(r.rental_date) AS month, YEAR(r.rental_date) AS year, SUM(p.amount) AS monthly_revenue, RANK() OVER (ORDER BY SUM(p.amount) DESC) AS ranked FROM rental r JOIN payment p ON r.rental_id = p.rental_id GROUP BY YEAR(r.rental_date), MONTH(r.rental_date) ) ranked_months WHERE ranked <= 5;

# Normalisation & CTE

-- Q1. First Normal Form (1NF):
-- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

-- Ans: The actor_info table violates 1NF because the film_info column contains multiple movie titles for each actor, which breaks the rule of atomicity (each column should contain a single value).

-- Original Table (Violating 1NF):
	-- actor_id    first_name    last_name    film_info
	-- 1            PENELOPE    GUINESS    Animation: ANACONDA CONFESSIONS; Children: LANGUAGE COWBOY; Classics: COLOR PHILADELPHIA, WESTWARD SEABISCUIT
	-- Here, the film_info column contains multiple values, violating 1NF.

-- Normalized Table (Compliant with 1NF):
	-- To normalize this table, we separate the film_info column into individual rows, where each combination of Actor_ID, Genre, and film_info is stored as a separate row. This ensures each column contains a single atomic value.

	-- actor_id        first_name    last_name           film_info
	-- 1                PENELOPE      GUINESS     Animation ANACONDA CONFESSIONS
	-- 1                 PENELOPE     GUINESS     Children  LANGUAGE COWBOY
	-- 1                 PENELOPE     GUINESS     Classics  COLOR PHILADELPHIA
	-- 1                 PENELOPE     GUINESS     Classics  WESTWARD SEABISCUIT
-- In this normalized table, we have one movie per row, and each column contains atomic values, making it 1NF compliant.

-- Q2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it

-- Ans: The nicer_but_slower_film_list table violates 2NF due to the actors column, which stores multiple actor names in a single field. This data depends only on the film_id and not the entire primary key. Here's how the normalization would look:

-- Before Normalization (Violates 2NF)

	-- film_id    title              category               actors                     price
	-- 1         ACADEMY DINOSAUR    Documentary    Warren Nolte, Oprah Kilmer, etc.    0.99

-- After Normalization (2NF)

	-- nicer_but_slower_film_list
	-- film_id    title            category_id    price
	-- 1          ACADEMY DINOSAUR      1          0.99

	-- film_actor_list
	-- film_id    actor_name
	-- 1          Warren Nolte
	-- 1          Oprah Kilmer
    
-- Q3. Third Normal Form (3NF): a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.

-- Ans: The nicer_but_slower_film_list table also violates 3NF because the price column depends on the category (a transitive dependency). To normalize:

-- Before Normalization (Violates 3NF)

	-- film_id    title               category           actors           price
	-- 1          ACADEMY DINOSAUR    Documentary    Warren Nolte, etc.    0.99
-- After Normalization (3NF)

	-- nicer_but_slower_film_list

	-- film_id    title           category_id
	-- 1        ACADEMY DINOSAUR       1
	-- film_category

	-- category_id    category      price
	-- 1              Documentary    0.99
	-- film_actor_list

	-- film_id    actor_name
	-- 1         Warren Nolte
	-- 1         Oprah Kilmer
    
-- Q4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

-- Ans: 1. Initial Unnormalized Form (UNF):

	-- The actor_info table has some issues with repeating data and non-atomic values.

	--     actor_id    first_name    last_name    film_info
	--     1            Penelope     Guiness        Animation: ANACONDA CONFESSIONS; Children: LANGUAGE COWBOY; Classics: COLOR PHILADELPHIA, WESTWARD SEABISCUIT; Comedy: VERTIGO NORTHWEST; Documentary: ACADEMY DINOSAUR; Family: KING EVOLUTION, SPLASH GUMP; Foreign: MULHOLLAND BEAST
	--     2            Nick         Wahlberg       Action: BULL SHAWSHANK; Animation: FIGHT JAWBREAKER; Children: JERSEY SASSY; Classics: DRACULA CRYSTAL, GILBERT PELICAN; Comedy: MALLRATS UNITED, RUSHMORE MERMAID

	-- Issues in UNF involved film_info column contained multiple values in a single column (genre lists), which is non-atomic and violates 1NF. There is redundant data like film categories for multiple actors stored in one column. It also violates 2NF because film_info depends on the entire actor_id but not fully on actor_name.

-- 2. Apply 1NF (Eliminate Repeating Groups):

	-- To make the table comply with 1NF, we need to split the non-atomic film_info into separate rows.

	--   Actor_Info Table (After 1NF):
	--   actor_id      first_name    last_name    film_category    film_title
	--   1    Penelope    Guiness    Animation    ANACONDA CONFESSIONS
	--   1    Penelope    Guiness    Children     LANGUAGE COWBOY
	--   1    Penelope    Guiness    Classics     COLOR PHILADELPHIA
	--   1    Penelope    Guiness    Comedy       VERTIGO NORTHWEST
	--   1    Penelope    Guiness    Documentary  ACADEMY DINOSAUR
	--   1    Penelope    Guiness    Family       KING EVOLUTION
	--   1    Penelope    Guiness    Foreign      MULHOLLAND BEAST
	--   2    Nick        Wahlberg    Action      BULL SHAWSHANK
	--   2    Nick        Wahlberg    Animation   FIGHT JAWBREAKER
	--   2    Nick        Wahlberg    Children    JERSEY SASSY
	--   2    Nick        Wahlberg    Classics    DRACULA CRYSTAL
	--   2    Nick        Wahlberg    Comedy      MALLRATS UNITED
	--   2    Nick        Wahlberg    Documentary ADAPTATION HOLES
	-- Now the table is in 1NF because each column contains atomic values, and we have no repeating groups.

-- 3. Apply 2NF (Remove Partial Dependencies):

	-- Next, we need to ensure that all non-key attributes depend entirely on the primary key.

	-- In the 1NF table above, the primary key would be a combination of actor_id and film_category, because each actor can have multiple categories and films. However, the actor's name depends only on actor_id and not on the combination of actor_id and film_category. So, we will move actor_name information to a separate table.

	-- Actor Table (After 2NF):

	-- actor_id    first_name    last_name
	-- 1           Penelope       Guiness
	-- 2           Nick           Wahlberg
	-- Actor_Film Table (After 2NF):

	-- actor_id    film_category    film_title
	-- 1           Animation        ANACONDA CONFESSIONS
	-- 1           Children         LANGUAGE COWBOY
	-- 1           Classics         COLOR PHILADELPHIA
	-- 1           Comedy           VERTIGO NORTHWEST
	-- 1           Documentary      ACADEMY DINOSAUR
	-- 1           Family           KING EVOLUTION
	-- 1           Foreign          MULHOLLAND BEAST
	-- 2           Action           BULL SHAWSHANK
	-- 2           Animation        FIGHT JAWBREAKER
	-- 2           Children         JERSEY SASSY
	-- 2           Classics         DRACULA CRYSTAL
	-- 2           Comedy           MALLRATS UNITED
	-- 2           Documentary      ADAPTATION HOLES
	-- Now the table is in 2NF, because there are no partial dependencies. The actor's name is now only stored in the Actor table, which depends solely on actor_id, and the Actor_Film table holds the many-to-many relationship between actors and films.

-- Hence by applying the steps of 1NF and 2NF, we have normalized the actor_info table, eliminating redundant data and ensuring that all non-key attributes depend on the entire primary key. This results in a cleaner, more efficient database schema.

-- Q5. CTE Basics
-- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.

-- Ans:
WITH actor_films AS (
    SELECT
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT first_name, last_name, film_count
FROM actor_films;

-- Q6. CTE with Joins
-- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.

-- Ans:

WITH film_language AS (
    SELECT
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT title, language_name, rental_rate
FROM film_language;

-- Q7. CTE for Aggregation
-- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.

-- Ans:

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_id, first_name, last_name, total_revenue
FROM customer_revenue;

-- Q8. CTE with Window Functions
-- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

-- Ans:

WITH ranked_films AS (
    SELECT
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS ranked
    FROM film
)
SELECT title, rental_duration, ranked
FROM ranked_films;

-- Q9. CTE and Filtering
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.

-- Ans:

WITH frequent_renters AS (
    SELECT
        r.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY r.customer_id
    HAVING rental_count > 2
)
SELECT c.customer_id, c.first_name, c.last_name, rental_count
FROM customer c
JOIN frequent_renters fr ON c.customer_id = fr.customer_id;

-- Q10. CTE for Date Calculations
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.

-- Ans:

WITH monthly_rentals AS (
    SELECT
        MONTH(r.rental_date) AS rental_month,
        YEAR(r.rental_date) AS rental_year,
        COUNT(r.rental_id) AS total_rentals
    FROM rental r
    GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
)
SELECT rental_month, rental_year, total_rentals
FROM monthly_rentals;

-- Q11. CTE and Self-Join a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
-- Ans:

WITH actor_pairs AS (
    SELECT
        fa1.actor_id AS actor1,
        fa2.actor_id AS actor2,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id
)
SELECT actor1, actor2, film_id
FROM actor_pairs;

-- Q12. CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager,considering the reports_to column

-- Ans

WITH RECURSIVE employee_hierarchy AS (
    -- Anchor member: Start with the manager's staff_id
    SELECT staff_id, first_name, last_name, reports_to
    FROM staff
    WHERE staff_id = (SELECT staff_id FROM staff WHERE first_name = 'Mike' AND last_name = 'Hillyer')

    UNION ALL

    -- Recursive member: Find all employees who report to the previous level
    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to
    FROM staff s
    INNER JOIN employee_hierarchy eh ON s.reports_to = eh.staff_id
)
SELECT * FROM employee_hierarchy;
