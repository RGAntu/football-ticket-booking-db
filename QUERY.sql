-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;


-- 1. CREATE USERS TABLE
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(15)
    
);


-- 2. CREATE MATCHES TABLE
CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(100),
    tournament_category VARCHAR(100),
    base_ticket_price INT CHECK (base_ticket_price >= 0),
    match_status VARCHAR(20) CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

-- 3. CREATE BOOKINGS TABLE
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES USERS(user_id),
    match_id INT REFERENCES Matches(match_id),
    seat_number VARCHAR(5),
    payment_status VARCHAR(20) CHECK (payment_status IN('Pending','Confirmed','Cancelled','Refunded')),
    total_cost FLOAT CHECK (total_cost >= 0)
);



