This is a small application I made at work. It is ready to deploy provided you have a SQLite3 database along with the following tables:

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

I was too lazy to copy the SQL script from the server to my laptop and upload it here. Copy paste the above SQL script and on your terminal (assuming you are in the Project's current working directory):

$ sqlite3 complain.db < complain.sql

To run the application, you have to run the test server first like this:

$ script/complain_server.pl -r

Then point your browser to http://0:3000 and you can see the simplistic UI and how smooth all of it is.
