DROP DATABASE IF EXISTS postgresSDC;

CREATE DATABASE postgresSDC;

USE postgresSDC;

CREATE TABLE listing.main(
    listing_ID  SERIAL NOT NULL PRIMARY KEY,
    listing_name VARCHAR(255),
    mon_min int DEFAULT 0 NOT NULL,
    tue_min int DEFAULT 0 NOT NULL,
    wed_min int DEFAULT 0 NOT NULL,
    thu_min int DEFAULT 0 NOT NULL,
    fri_min int DEFAULT 0 NOT NULL,
    sat_min int DEFAULT 0 NOT NULL,
    sun_min int DEFAULT 0 NOT NULL,
    max_stay int NOT NULL,
);

CREATE TABLE listing.booked(
    booked_ID SERIAL NOT NULL PRIMARY KEY,
    checkIn DATE NOT NULL,
    checkOut DATE NOT NULL,
    listing_ID int NOT NULL
);



ALTER TABLE listing.booked ADD FOREIGN KEY (listing_ID) REFERENCES listing.main;


