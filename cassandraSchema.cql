
CREATE KEYSPACE IF NOT EXISTS cassandraSDC
WITH REPLICATION = {'class':'SimpleStrategy', 'replication_factor':1};

USE cassandraSDC;

CREATE TABLE listings (
   Listing_ID int,
   Booking_ID int,
   Mon_min tinyint,
   Tue_min tinyint,
   Wed_min tinyint,
   Thu_min tinyint,
   Fri_min tinyint,
   Sat_min tinyint,
   Sun_min tinyint,
   Max_stay tinyint,
   Check_in VARCHAR,
   Check_out VARCHAR,
   PRIMARY KEY ((Listing_ID), Booking_ID)
   );

   COPY listings (Listing_ID,Booking_ID,Mon_min,Tue_min,Wed_min,Thu_min,Fri_min,Sat_min,Sun_min,Max_stay,Check_in,Check_out)
   -- FROM '/Users/jimmyma/hackreactor/calendar/CassandraData.csv' WITH HEADER = TRUE ;


