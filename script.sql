CREATE DATABASE shop;
USE shop;
CREATE TABLE item_master
  (
  item_code VARCHAR(5),
  item_name VARCHAR(15) NOT NULL,
  item_price FLOAT(7,2) NOT NULL,
  item_category VARCHAR(10) NOT NULL,
  CONSTRAINT item_master_pk PRIMARY KEY(item_code)
  );
  INSERT INTO item_master VALUES('I0001','Colgate',60.78,'Paste');
 INSERT INTO item_master VALUES('I0002','Lux',20.50,'Soap');
 INSERT INTO item_master VALUES('I0003','Dettol',25.00,'Soap');
 INSERT INTO item_master VALUES('I0004','Promise',59.00,'Paste');
 INSERT INTO item_master VALUES('I0005','Park Avenue',450.00,'Perfume');
 INSERT INTO item_master VALUES('I0006','Exotica',600.00,'Perfume');
 CREATE TABLE customer_master
  (
    cust_code VARCHAR(5),
    firstname VARCHAR(20) NOT NULL,
    middlename VARCHAR(20),
    lastname VARCHAR(20) NOT NULL,
    address VARCHAR(30) NOT NULL,
    mobileno VARCHAR(10) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL,
    CONSTRAINT customer_master_pk PRIMARY key(cust_code)
   );
  INSERT INTO customer_master VALUES('C0001','Ram','Kumar','Sharma','A/2 ,Netaji Nagar','9865343412','Durgapur','West Bengal');
INSERT INTO customer_master VALUES('C0002','Shavant',null,' Pingle','55-A,Jawahar Colony','8763452356','Mumbai','Maharastra');
INSERT INTO customer_master VALUES('C0003','Rama',null,'Chandran','456-1,Sastri Nagar','9834566788','Kolkata','West Bengal');
INSERT INTO customer_master VALUES('C0004','Ashok','Kumar','Bajaj','2/1 Mahatma Gandhi Road','7890045666','Pune','Maharastra');
CREATE TABLE item_transaction 
 (
   cust_code VARCHAR(5), -- FK   (ON DELETE CASCADE, ON UPDATE CASCADE)
   item_code VARCHAR(5), -- FK   (ON DELETE CASCADE, ON UPDATE CASCADE)
   date_of_pur DATE NOT NULL,
   qty_pur INT(5) NOT NULL,
   CONSTRAINT item_transaction_cust_code_fk FOREIGN KEY(cust_code) REFERENCES customer_master(cust_code) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT item_transaction_item_code_fk FOREIGN KEY(item_code) REFERENCES item_master(item_code) ON DELETE CASCADE ON UPDATE CASCADE
 );

SELECT  * FROM item_transaction;
SELECT * FROM item_master;
SELECT * FROM customer_master;

INSERT INTO item_transaction VALUES('C0001','I0003','2016-01-15',100);
INSERT INTO item_transaction VALUES('C0002','I0003','2016-03-13',50);
INSERT INTO item_transaction VALUES('C0001','I0005','2015-12-04',10);

-- 1) Display cust_code,firstname,middlename,item_code and date_of_purchase.
-- ANSI STYLE
SELECT customer_master.cust_code, firstname, middlename, item_code, date_of_pur
FROM customer_master JOIN item_transaction
WHERE customer_master.cust_code=item_transaction.cust_code;
 
SELECT cm.cust_code, firstname, middlename, item_code, date_of_pur
FROM customer_master cm  JOIN item_transaction it
WHERE cm.cust_code=it.cust_code;
 
--  THETA STYLE
SELECT cm.cust_code, firstname, middlename, item_code, date_of_pur
FROM customer_master cm , item_transaction it
WHERE cm.cust_code=it.cust_code;

SELECT cm.cust_code,cm.firstname,cm.middlename,it.item_code,im.item_name,im.item_price,it.date_of_pur
 FROM customer_master cm JOIN item_transaction it
 ON cm.cust_code=it.cust_code
 JOIN item_master im
 ON im.item_code=it.item_code;


SELECT CONCAT('My', 'S', 'QL') subject; 
SELECT CONCAT('My', 'S', 'QL') AS subject; 
SELECT CONCAT('My', 'S', 'QL') 'subject details';  -- if we have alias name with multiple
-- words we need to enclose within single quote or double quotes otherwise error will be shown
SELECT CONCAT('My', 'S', 'QL')  "subject details"; 
SELECT CONCAT('My', 'S', 'QL')  AS "subject details"; 

CREATE DATABASE customerDB;
USE customerDB;

CREATE TABLE customer_master
(
  custcode VARCHAR(6) PRIMARY KEY,
  firstname VARCHAR(15) NOT NULL,
  middlename VARCHAR(15),
  lastname VARCHAR(15) NOT NULL,
  address1 VARCHAR(100) NOT NULL,
  address2 VARCHAR(100),
  date_of_birth DATE,
  mobilenumber VARCHAR(10)
);

INSERT INTO customer_master VALUES('C00001','Rajiv',null,'Ranjan','A/1 Indira Nagar,Banglore-Karnataka',null,'1980-12-06','9830356731');
INSERT INTO customer_master VALUES('C00002','Ajay','Kumar','Bhargav','122/1 Lajpat Nagar Jalandhar-Punjab','A/1 Jawahar Nagar-Rajastan','1985-06-10','8830858132');
INSERT INTO customer_master VALUES('C00003','Amitava','Kumar','Dutta','122-B Sector 3,Salt Lake-West Bengal','122-B Sector 3,Salt Lake-West Bengal','1974-11-1','7810888133'); 

SELECT * FROM customer_master;
SELECT CONCAT(firstname,'  ',lastname) NAME FROM customer_master;

SELECT  firstname,SUBSTRING(firstname,2) NAME FROM customer_master;
SELECT SUBSTRING(firstname,1,1) FIRST_CHAR FROM customer_master;
SELECT CONCAT(SUBSTRING(firstname,1,1),'. ',lastname) NAME FROM customer_master;

SELECT concat(lastname,',',substring(firstname,1,1)) NAME
FROM customer_master;

SELECT * FROM customer_master;

SELECT firstname
FROM customer_master
WHERE middlename IS NULL;

SELECT curdate();
SELECT curtime();



SELECT extract(year from now());
SELECT extract(month from now());
SELECT extract(day from now());

SELECT firstname
FROM customer_master
WHERE extract(year from date_of_birth)=1985 ;

SELECT firstname, date_format(date_of_birth,'%M') month_name
FROM customer_master;

SELECT firstname, extract(month from date_of_birth)
FROM customer_master;
SELECT firstname,date_format(date_of_birth,'%m') 
FROM customer_master;

SELECT firstname 
FROM customer_master
WHERE date_format(date_of_birth,"%M")='December';


SELECT firstname 
FROM customer_master
WHERE date_format(date_of_birth,"%m")=12;


SELECT firstname 
FROM customer_master
WHERE extract(month from date_of_birth)=12;


CREATE TABLE emp_details(
code VARCHAR(5) PRIMARY KEY,
name VARCHAR(20),
doj date);

INSERT INTO emp_details VALUES('E0001','Ram','2019-10-21');
INSERT INTO emp_details VALUES('E0002','Rajesh','1987-10-31');

SELECT name,doj,date_add(doj,INTERVAL 40 YEAR)  date_of_retirement
FROM emp_details;

SELECT name,now()-doj
FROM emp_details;

