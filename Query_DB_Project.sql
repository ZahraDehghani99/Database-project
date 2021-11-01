--view all rows of restaurant table

select * from public.restaurant 
ORDER BY postal_code ASC; 

--view all rows of customer table

SELECT * FROM public.customer
ORDER BY customer_id ASC; 

--view all rows of items table

SELECT * FROM public.items
ORDER BY item_no ASC; 

--view all rows of order table

SELECT * FROM public.order
ORDER BY order_no ASC; 

--view all rows of Tel table

SELECT * FROM public.tel
ORDER BY tel_no ASC, postal_code ASC; 

--view all rows of order_items table

SELECT * FROM public.order_items
ORDER BY order_no ASC, item_no ASC; 

--view all rows of resraurant_customer

SELECT * FROM public.restaurant_customer
ORDER BY customer_id ASC, postal_code ASC;

--calculate the total price of each customer's order without view

SELECT  order_no as order_number, SUM(item_price) as total_price
    FROM (SELECT order_no, item_price
        FROM public.order_items NATURAL JOIN public.items) as order_price
            GROUP BY order_no
			ORDER BY order_no ASC;

-- calculate the total price of each customer's order using view V1
    --view of customer on order_no and item_price 

CREATE VIEW V1
AS 
SELECT order_no, item_price
FROM public.order_items NATURAL JOIN public.items;

    --use sum on view V1

SELECT  order_no as order_number, SUM(item_price) as total_price
    FROM V1 as order_price
            GROUP BY order_no
			ORDER BY order_no ASC;

       