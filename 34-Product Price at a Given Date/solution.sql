SELECT 
    product_id,  
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN
(
    SELECT product_id, max(change_date)
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
UNION 

SELECT 
    product_id,
    10 AS price
FROM Products
WHERE (product_id) NOT IN
(
    SELECT product_id
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) ;
