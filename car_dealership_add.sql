CREATE OR REPLACE FUNCTION add_car(_serial_number INTEGER, _make VARCHAR, _model VARCHAR, _year INTEGER, _license_plate VARCHAR,_new_or_used VARCHAR,_mileage INTEGER)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO car(serial_number,make,model,year,license_plate,new_or_used,mileage)
	VALUES(_serial_number, _make, _model, _year,_license_plate, _new_or_used,_mileage);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(1,'Nissan', 'Arriya',2022, '8T7 F6G', 'new', 005);
SELECT add_car(2,'Jeep', 'Grand Cherokee', 2014, '345 SWR', 'used', 25001);

CREATE OR REPLACE FUNCTION add_customer(customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _phone_number VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id,first_name,last_name,address,phone_number)
	VALUES(customer_id, _first_name, _last_name, _address, _phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1, 'Jan', 'Smith', '8332 Yukon Drive','250-3452');
SELECT add_customer(2, 'Bob', 'Jones', '8331 Yukon Drive','250-3458');


CREATE OR REPLACE FUNCTION add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _email VARCHAR, _address VARCHAR, _phone_number VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO salesperson(salesperson_id,first_name,last_name,email,address,phone_number)
	VALUES(_salesperson_id, _first_name, _last_name, _email, _address, _phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_salesperson(1, 'Bobby', 'Knight', 'bobby@mycarco.com', '343 Springhouse Court','361-4563');
SELECT add_salesperson(2, 'Judy', 'Witherspoon', 'jwith@mycarco.com', '8331 Averwater Circle','361-4569');

CREATE OR REPLACE FUNCTION add_invoice(_payment_id INTEGER,_customer_id INTEGER, _salesperson_id INTEGER,_serial_number INTEGER, _sale_date TIMESTAMP WITHOUT TIME ZONE, _price NUMERIC)

RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO invoice(payment_id,customer_id, salesperson_id,serial_number, sale_date, price)
	VALUES(_payment_id,_customer_id, _salesperson_id,_serial_number, _sale_date, _price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_invoice(1, 1, 1,1, NOW()::timestamp,20000.00);
SELECT add_invoice(2, 2, 2,2, now()::timestamp,45000.25);


CREATE OR REPLACE FUNCTION add_mechanic(mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _phone_number VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO mechanic(mechanic_id,first_name,last_name,address,phone_number)
	VALUES(mechanic_id, _first_name, _last_name, _address, _phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_mechanic(1, 'Jennifer', 'Jones', '1 Yellow Brick Road','250-6879');
SELECT add_mechanic(2, 'John', 'Flowers', '12 Highway to Heaven','250-3820');


CREATE OR REPLACE FUNCTION add_service_ticket(_ticket_num INTEGER,_mechanic_id INTEGER,_customer_id INTEGER,_serial_number INTEGER,_service_start TIMESTAMP WITHOUT TIME ZONE,_service_end TIMESTAMP WITHOUT TIME ZONE,_service_price NUMERIC,_parts_price NUMERIC,_total_price NUMERIC,_service_type TEXT[])

RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO service_ticket(ticket_num,mechanic_id,customer_id,serial_number,service_start,service_end,service_price,parts_price,total_price,service_type)
	VALUES(_ticket_num,_mechanic_id,_customer_id,_serial_number,_service_start,_service_end,_service_price,_parts_price,_total_price,_service_type);
END;
$MAIN$
LANGUAGE plpgsql;

INSERT INTO service_ticket(
	ticket_num,
	mechanic_id,
	customer_id,
	serial_number,
	service_start,
	service_end,
	service_price,
	parts_price,
	total_price
)VALUES(
	1,
	1,
	1,
	1,
	NOW():: timestamp,
	NOW():: timestamp,
	200.00,
	800.00,
	1000.00
);

INSERT INTO service_ticket(
	ticket_num,
	mechanic_id,
	customer_id,
	serial_number,
	service_start,
	service_end,
	service_price,
	parts_price,
	total_price
)VALUES(
	2,
	2,
	2,
	2,
	NOW():: timestamp,
	NOW():: timestamp,
	20.00,
	80.00,
	100.00
);



CREATE OR REPLACE FUNCTION add_inventory(_upc INTEGER, _product_amount INTEGER)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO inventory(upc,product_amount)
	VALUES(_upc, _product_amount);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_inventory(343, 100);
SELECT add_inventory(545, 1000);


CREATE OR REPLACE FUNCTION add_part(_item_id INTEGER, _price INTEGER, _product_name VARCHAR, _upc INTEGER, _brand VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO part(item_id, price, product_name, upc, brand)
	VALUES(_item_id, _price, _product_name, _upc, _brand);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_part(1,200,'tires',343,'yokohama');
SELECT add_part(2, 80, 'oil filter', 545,'valvoline' );


CREATE OR REPLACE FUNCTION add_part_used(_part_used_id INTEGER, _upc INTEGER, _ticket_num VARCHAR, _amount INTEGER)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO part_used(part_used_id, upc, ticket_num, amount)
	VALUES(_part_used_id, _upc, _ticket_num, _amount);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_part_used(1,343,1,343,4)
SELECT add_part(2,545,2,2)
