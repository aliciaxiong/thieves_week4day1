-- Verify connection to DB using the Actor Table

SELECT *
FROM actor; 

-- SELECT first_name and last_name
-- FROM actor TABLE
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name,
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name,
FROM actor
WHERE first_name LIKE 'Nick';

-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J';

-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%'

----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table
SELECT*
FROM payment

-- Query WHERE amount GREATER THAN $10.
SELECT amount
FROM payment
WHERE amount > 10;

-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive
SELECT amount
FROM payment
WHERE amount BETWEEN 10 AND 15;

-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order
SELECT amount
FROM payment
ORDER by amount DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT amount
FROM payment
WHERE amount <> 2.99;

----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment 
WHERE amount >= 5.99;

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the COUNT of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment

-- Query to display the MAX paid using alias
SELECT MAX(amount) AS max_amount_paid
FROM payment

-- GROUP BY (Used with aggregate functions)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id 
ORDER BY SUM(amount) DESC;

-- OTHER PROBLEMS, USING "HAVING" as a Keyword - WHERE DOES NOT WORK WITH AGGREGATES and HAVING does. 
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 10    -- WHERE IS BEFORE GROUP BY THE AGGREGTE FUNCTIONS 
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT amount 
FROM payment;
ORDER BY amount DESC
LIMIT 10; -- LIMIT WILL ALLOW ONLY THE FIRST NUMBER OF __ 

---- HOMEWORK ----

-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'Williams'

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC;

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT last_name
FROM customer
WHERE last_name LIKE '%es'

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%'

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT customer_id, COUNT(amount)
FROM payment 
GROUP BY customer_id BETWEEN 380 AND 430
ORDER BY COUNT(amount) > 250;

-- 10. Within the film table, how many rating categories are there? 
SELECT COUNT(DISTINCT rating)
FROM film;

--And what rating has the most movies total?
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title);
