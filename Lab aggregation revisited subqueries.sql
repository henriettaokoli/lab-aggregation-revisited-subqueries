SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;
SELECT p.customer_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
       AVG(p.amount) AS average_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id, customer_name;
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action';
SELECT DISTINCT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN (
        SELECT inventory_id
        FROM inventory
        WHERE film_id IN (
            SELECT film_id
            FROM film_category
            WHERE category_id = (
                SELECT category_id
                FROM category
                WHERE name = 'Action'
            )
        )
    )
);
SELECT DISTINCT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN (
        SELECT inventory_id
        FROM inventory
        WHERE film_id IN (
            SELECT film_id
            FROM film_category
            WHERE category_id = (
                SELECT category_id
                FROM category
                WHERE name = 'Action'
            )
        )
    )
)
UNION
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action';
SELECT p.payment_id, 
       p.customer_id, 
       p.amount,
       CASE
           WHEN p.amount BETWEEN 0 AND 2 THEN 'low'
           WHEN p.amount BETWEEN 2.01 AND 4 THEN 'medium'
           ELSE 'high'
       END AS transaction_value
FROM payment p;
