CREATE TABLE complain (
	complainID INT PRIMARY KEY,
	userName VARCHAR(50),
	userAddress VARCHAR(100),
	userContact VARCHAR(15),
	productSerial VARCHAR(20),
	productType INT,
	productMake VARCHAR(20),
	complain VARCHAR(150),
	status INT
);

CREATE TABLE users (
	userID INT PRIMARY KEY,
	userName VARCHAR(20),
	password VARCHAR(20)
);

CREATE TABLE resolve (
	id INT PRIMARY KEY,
	status INT,
	assigned VARCHAR(20), -- engineer assigned
	detail VARCHAR(150) -- detailed status
);

INSERT INTO complain VALUES(1, 'Code Ninja', 'Andheri', '98111111111', '0112358', 'Laptop', 'HP', 'Screen Crapped up!', 0);
