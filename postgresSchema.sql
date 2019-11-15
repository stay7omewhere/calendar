DROP DATABASE IF EXISTS postgresSDC;

CREATE DATABASE postgresSDC;

USE postgresSDC;

CREATE TABLE Listing(
    Listing_ID  SERIAL NOT NULL PRIMARY KEY,
    Mon_min smallint DEFAULT 0 NOT NULL,
    Tue_min smallint DEFAULT 0 NOT NULL,
    Wed_min smallint DEFAULT 0 NOT NULL,
    Thu_min smallint DEFAULT 0 NOT NULL,
    Fri_min smallint DEFAULT 0 NOT NULL,
    Sat_min smallint DEFAULT 0 NOT NULL,
    Sun_min smallint DEFAULT 0 NOT NULL,
    Max_stay smallint NOT NULL
);

CREATE TABLE Booking(
    Booked_ID SERIAL NOT NULL PRIMARY KEY,
    Check_in DATE NOT NULL,
    Check_out DATE NOT NULL,
    Listing_ID int NOT NULL
);





ALTER TABLE booking ADD FOREIGN KEY (Listing_ID) REFERENCES listing;


-- COPY listing (Listing_ID, Mon_min, Tue_min, Wed_min, Thu_min, Fri_min, Sat_min, Sun_min, Max_stay)
-- FROM './' DELIMITER ',' CSV HEADER;

-- \COPY Booking (Booked_ID, Check_in, Check_out, Listing_ID) FROM '/home/ec2-user/BookingData.csv' DELIMITER '|' CSV HEADER;
-- CREATE INDEX idx_booking2_listing ON booking(listing_id);

-- ALTER TABLE booking2 ADD CONSTRAINT EXCLUDE USING gist (Listing_ID WITH =, Booked_dates WITH &&);