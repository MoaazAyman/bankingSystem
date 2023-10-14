CREATE DATABASE customers;
USE customers;

CREATE TABLE customer(
    id INTEGER NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_account_number INTEGER NOT NULL,
    curr_balance INTEGER NOT NULL,
    customer_phone_number INTEGER  NOT NULL,
    customer_account_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
)


INSERT INTO customer (customer_name, customer_email, customer_account_number, curr_balance, customer_phone_number, customer_account_status)

VALUES 

("Ashraf", "Ashraf@gmail.com", 123, 1500, 123456, "frozen"),
("Karim", "Karim@gmail.com", 456, 1550, 123457, "frozen"),
("Shorouq", "Shorouq@gmail.com", 789, 2700, 123458, "active"),
("Amira", "Amira@gmail.com", 753, 350, 123459, "active"),
("Ziad", "Ziad@gmail.com", 951, 0, 1234510, "closed"),
("Youssef", "Youssef@gmail.com", 852, 500, 1234511, "active"),
("Muhammad", "Muhammad@gmail.com", 654, 2900, 1234512, "active"),
("Hashim", "Hashim@gmail.com", 258, 350, 1234513, "frozen"),
("Ramy", "Ramy@gmail.com", 357, 0, 1234514, "closed"),
("Osama", "Osama@gmail.com", 951, 75, 12345615, "frozen")


CREATE TABLE transfers (
  
  id INT NOT NULL AUTO_INCREMENT,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  amount INT NOT NULL,
  done_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (sender_id) REFERENCES customer(id),
  FOREIGN KEY (receiver_id) REFERENCES customer(id)

);


INSERT INTO transfers (sender_id, receiver_id, amount)

VALUES

(1, 10, 500 ),
(2, 6, 750 ),
(3, 7, 1500 ),
(1, 10, 500 ),
(4, 9, 350 ),
(7, 8, 150 ),
(8, 6, 255 ),
(6, 1, 20 )


