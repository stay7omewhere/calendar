
CREATE KEYSPACE IF NOT EXISTS cassandraSDC
WITH REPLICATION = {'class':'SimpleStrategy', 'replication_factor':1};

USE cassandraSDC;

CREATE TABLE airbnb.listings (
   Listing_ID int,
   Booking_ID tinyint,
   Mon_min tinyint,
   Tue_min tinyint,
   Wed_min tinyint,
   Thu_min tinyint,
   Fri_min tinyint,
   Sat_min tinyint,
   Sun_min tinyint,
   Max_stay tinyint,
   Check_in DATE,
   Check_out DATE
   PRIMARY KEY ((Listing_ID) Booking_ID));