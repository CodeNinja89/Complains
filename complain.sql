PRAGMA foreign_keys = ON;

CREATE TABLE complain (
	complainID INTEGER PRIMARY KEY,
	userName TEXT,
	userAddress TEXT,
	userContact TEXT,
	productSerial INTEGER,
	productType INTEGER,
	productMake TEXT,
	complain TEXT,
	status INTEGER -- 0: open, 1: processing, 2: closed
);

CREATE TABLE users (
	userID INTEGER PRIMARY KEY,
	userName TEXT,
	password TEXT
);

CREATE TABLE resolve (
	id INTEGER PRIMARY KEY,
	status INTEGER,
	assigned TEXT, -- engineer assigned
	detail TEXT -- detailed status
);

INSERT INTO complain VALUES(1, 'Code Ninja', 'Andheri', '98111111111', '0112358', 'Laptop', 'HP', 'Screen Crapped up!', 0);
