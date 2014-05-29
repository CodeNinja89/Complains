This is a small application I made at work. It is ready to deploy provided you have a SQLite3 database along with the following tables:

$ sqlite3 complain.db < complain.sql

If you make changes to the tables, remove complain.db from the root of the directory and the run the above command again.

To run the application, you have to run the test server first like this:

$ script/complain_server.pl -r

Then point your browser to http://0:3000 and you can see the simplistic UI and how smooth all of it is.

To set the hashed passwords in the user table, you must run the hashed.pl script (I got it from Kennedy Clark's <a href="http://search.cpan.org/~hkclark/Catalyst-Manual-5.8004/lib/Catalyst/Manual/Tutorial/05_Authentication.pod#USING_PASSWORD_HASHES">tutorial</a>).
