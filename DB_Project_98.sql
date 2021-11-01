-- Restaurant order management system (Attendance shopping)
-- Author : Zahra Dehghani tafti (96222037)
--database = postgreSQL (pgAdmin4)
CREATE DATABASE "DB_Project_98"
    ENCODING = 'UTF8';

CREATE SCHEMA public

    --create customer table

    CREATE TABLE public.customer
    (
        customer_id bigint NOT NULL,
        customer_name character varying,
        PRIMARY KEY (customer_id)
    );

    --create restaurant table

    CREATE TABLE public.restaurant
    (
        postal_code bigint NOT NULL,
        branch_id bigint,
        restaurant_name character varying NOT NULL,
        restaurant_address character varying,
        PRIMARY KEY (postal_code)
    );

    --create items table

    CREATE TABLE public.items
    (
        item_no bigint NOT NULL,
        item_name character varying NOT NULL,
        item_price bigint NOT NULL,
        PRIMARY KEY (item_no),
        UNIQUE(item_name)
        
    );

    --create order table

    CREATE TABLE public.order
    (
        order_no bigint NOT NULL,
        order_time TIME NOT NULL,
        customer_id bigint NOT NULL,
        postal_code bigint NOT NULL, 
        PRIMARY KEY (order_no),
        FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
		FOREIGN KEY (postal_code) REFERENCES public.restaurant(postal_code) ON UPDATE NO ACTION ON DELETE NO ACTION

    );

    --create order_items table

    CREATE TABLE public.order_items
    (
        order_no bigint NOT NULL,
        item_no bigint NOT NULL,
        PRIMARY KEY (order_no, item_no),
        FOREIGN KEY (order_no) REFERENCES public.order(order_no) ON UPDATE NO ACTION ON DELETE NO ACTION,
		FOREIGN KEY (item_no) REFERENCES public.items(item_no) ON UPDATE NO ACTION ON DELETE NO ACTION

    );

    --create restaurant_customer table

    CREATE TABLE public.restaurant_customer
    (
        customer_id bigint NOT NULL,
        postal_code bigint NOT NULL,
        PRIMARY KEY (customer_id, postal_code),
        FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
		FOREIGN KEY (postal_code) REFERENCES public.restaurant(postal_code) ON UPDATE NO ACTION ON DELETE NO ACTION


    );

    -- tel is a multivalute attribute for restaurant, because of normalization we created a table for it

    CREATE TABLE public.Tel
    (
        tel_no bigint NOT NULL,
        postal_code bigint NOT NULL,
        PRIMARY KEY (tel_no, postal_code),
		FOREIGN KEY (postal_code) REFERENCES public.restaurant(postal_code) ON UPDATE NO ACTION ON DELETE NO ACTION

    );

    -- insert into restaurant table

    INSERT INTO public.restaurant
        (restaurant_name, branch_id, restaurant_address, postal_code)
    VALUES
        ('Khash', 1, 'yazd, taleghani street', 89166),
        ('Khash', 2, 'yazd, jomhoori street', 79167),
        ('Perperook', 1, 'tehran, velenjak', 32166);

    --insert into customer table

    INSERT INTO public.customer
        (customer_id, customer_name)
    VALUES
        (1, 'hassan hassani'),
        (2, 'hosna hosseini'),
        (3, 'ziba zargar'),
        (4, 'javad javadi'),
        (5, 'samad samadi'),
        (6, 'ali alavi');

    --insert into items table

    INSERT INTO public.items
        (item_no, item_price, item_name)
    VALUES
        (1, 3000, 'املت'),
        (2, 2000, 'نیمرو'),
        (3, 10000, 'بندری'),
        (4, 7000, 'سوپ'), 
        (5, 2000, 'مرغ سوخاری'), 
        (6, 12000, 'شنیسل مرغ'), 
        (7, 25000, 'جوجه کباب'), 
        (8, 30000, 'کوبیده');

    --insert into order table

    INSERT INTO public.order
        (order_no, order_time, postal_code, customer_id)
    VALUES
        (1, '08:00:00', 89166, 1),
        (2, '14:00:00', 89166, 1),
        (3, '9:00:00', 32166, 2),
        (4, '10:00:00', 79167, 3), 
        (5, '11:30:00', 79167, 4), 
        (6, '20:00:00', 32166, 6), 
        (7, '20:30:00', 32166, 5);

    --insert into Tel table

    INSERT INTO public.Tel
        (tel_no, postal_code)
    VALUES
        (7251077, 89166),
        (7223435, 79167),
        (7251078, 89166),
        (7223436, 79167),
        (5243132, 32166),
        (5243134, 32166);

    --insert into order_items table    
       
    INSERT INTO public.order_items
        (item_no, order_no)
    VALUES
        (1, 1),
        (2, 1),
        (3, 1),
        (4, 2),
        (5, 3),
        (7, 4),
        (1, 4),
        (5, 5),
        (3, 5),
        (6, 6),
        (3, 7),
        (4, 7);
        
    --insert into restaurant_customer table

    INSERT INTO public.restaurant_customer
        (postal_code, customer_id)
    VALUES
        (89166, 1),
        (89166, 2),
        (32166, 2),
        (79167, 3),
        (79167, 4),
        (32166, 6),
        (32166, 5),
        (89166, 6),
        (79167, 1);

    commit;


        
        
    



   

    



