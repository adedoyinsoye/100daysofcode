/* task 1
Write a query that returns all the orders where 
the standard_qty is over 1000, 
the poster_qty is 0, and the gloss_qty is 0.*/
SELECT *
FROM orders 
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;
/* task 2- 
Using the accounts table, 
find all the companies whose names do not start with 'C' and 
end with 's'.*/
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';
/* task 3- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. 
Only include the id field in the resulting table.*/
SELECT id 
FROM orders 
WHERE gloss_qty > 4000 OR poster_qty > 4000;
/* task 4- Write a query that returns a list of orders where the standard_qty is zero 
and either the gloss_qty or poster_qty is over 1000.*/
SELECT *
FROM orders 
WHERE standard_qty= 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

/* JOINS*/
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;


SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';
/* task 5 */
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;
/*task 6 */
SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;