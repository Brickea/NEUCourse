DROP DATABASE IF EXISTS boston_motors;
CREATE DATABASE boston_motors;

USE boston_motors;

CREATE TABLE offices (
  officeCode INT NOT NULL AUTO_INCREMENT,
  city varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  state varchar(50) DEFAULT NULL,
  country varchar(50) NOT NULL,
  postalCode varchar(15) NOT NULL,
  territory varchar(10) NOT NULL,
  PRIMARY KEY (officeCode)
);


CREATE TABLE productlines (
  productLine varchar(50) NOT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  PRIMARY KEY (productLine)
);

CREATE TABLE products (
  productCode varchar(15) NOT NULL,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription text NOT NULL,
  quantityInStock smallint NOT NULL,
  buyPrice decimal(10,2) NOT NULL,
  MSRP decimal(10,2) NOT NULL,
  PRIMARY KEY (productCode),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES productlines (productLine)
);

CREATE TABLE employees (
  employeeNumber int NOT NULL,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  extension varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  officeCode int NOT NULL,
  reportsTo int DEFAULT NULL,
  jobTitle varchar(50) NOT NULL,
  PRIMARY KEY (employeeNumber),
  CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber),
  CONSTRAINT employees_ibfk_2 FOREIGN KEY (officeCode) REFERENCES offices (officeCode)
);

CREATE TABLE customers (
  customerNumber int NOT NULL,
  customerName varchar(50) NOT NULL,
  contactLastName varchar(50) NOT NULL,
  contactFirstName varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) DEFAULT NULL,
  postalCode varchar(15) DEFAULT NULL,
  country varchar(50) NOT NULL,
  salesRepEmployeeNumber int DEFAULT 0,
  creditLimit decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (customerNumber),
  CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)
);

CREATE TABLE orders (
  orderNumber int NOT NULL,
  orderDate date NOT NULL,
  requiredDate date NOT NULL,
  shippedDate date DEFAULT NULL,
  status varchar(15) NOT NULL,
  comments text,
  customerNumber int NOT NULL,
  PRIMARY KEY (orderNumber),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);

CREATE TABLE payments (
  customerNumber int NOT NULL,
  checkNumber varchar(50) NOT NULL,
  paymentDate date NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (customerNumber,checkNumber),
  CONSTRAINT payments_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);

CREATE TABLE orderdetails (
  orderNumber int NOT NULL,
  productCode varchar(15) NOT NULL,
  quantityOrdered int NOT NULL,
  priceEach decimal(10,2) NOT NULL,
  orderLineNumber smallint NOT NULL,
  PRIMARY KEY (orderNumber,productCode),
  CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
  CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productCode) REFERENCES products (productCode)
);