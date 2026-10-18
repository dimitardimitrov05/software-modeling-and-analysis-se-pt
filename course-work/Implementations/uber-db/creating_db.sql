CREATE DATABASE UberDB;


CREATE TABLE City (
    city_id   INT IDENTITY(1,1) PRIMARY KEY,
    name      NVARCHAR(100) NOT NULL,
    country   NVARCHAR(100) NOT NULL
);
 

CREATE TABLE Rider (
    rider_id   INT IDENTITY(1,1) PRIMARY KEY,
    full_name  NVARCHAR(150) NOT NULL,
    email      NVARCHAR(150) NOT NULL UNIQUE,
    phone      NVARCHAR(30)  NOT NULL
);
 

CREATE TABLE Driver (
    driver_id  INT IDENTITY(1,1) PRIMARY KEY,
    full_name  NVARCHAR(150) NOT NULL,
    phone      NVARCHAR(30)  NOT NULL,
    city_id    INT NOT NULL,
    CONSTRAINT FK_Driver_City FOREIGN KEY (city_id) REFERENCES City(city_id)
);
 
CREATE TABLE Vehicle (
    vehicle_id    INT IDENTITY(1,1) PRIMARY KEY,
    plate_number  NVARCHAR(20)  NOT NULL UNIQUE,
    model         NVARCHAR(100) NOT NULL,
    driver_id     INT NOT NULL,
    CONSTRAINT FK_Vehicle_Driver FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);
 
CREATE TABLE PromoCode (
    promo_id          INT IDENTITY(1,1) PRIMARY KEY,
    code              NVARCHAR(30) NOT NULL UNIQUE,
    discount_percent  DECIMAL(5,2) NOT NULL,
    CONSTRAINT CK_Promo_Discount CHECK (discount_percent > 0 AND discount_percent <= 100)
);
 
CREATE TABLE RiderPromo (
    rider_id  INT NOT NULL,
    promo_id  INT NOT NULL,
    is_used   BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_RiderPromo PRIMARY KEY (rider_id, promo_id),
    CONSTRAINT FK_RiderPromo_Rider FOREIGN KEY (rider_id) REFERENCES Rider(rider_id),
    CONSTRAINT FK_RiderPromo_Promo FOREIGN KEY (promo_id) REFERENCES PromoCode(promo_id)
);
 
CREATE TABLE Trip (
    trip_id          INT IDENTITY(1,1) PRIMARY KEY,
    rider_id         INT NOT NULL,
    driver_id        INT NOT NULL,
    vehicle_id       INT NOT NULL,
    promo_id         INT NULL,
    pickup_address   NVARCHAR(200) NOT NULL,
    dropoff_address  NVARCHAR(200) NOT NULL,
    distance_km      DECIMAL(6,2)  NOT NULL,
    fare             DECIMAL(8,2)  NOT NULL,
    status           NVARCHAR(20)  NOT NULL DEFAULT 'requested',
    trip_date        DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Trip_Rider   FOREIGN KEY (rider_id)   REFERENCES Rider(rider_id),
    CONSTRAINT FK_Trip_Driver  FOREIGN KEY (driver_id)  REFERENCES Driver(driver_id),
    CONSTRAINT FK_Trip_Vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    CONSTRAINT FK_Trip_Promo   FOREIGN KEY (promo_id)   REFERENCES PromoCode(promo_id),
    CONSTRAINT CK_Trip_Status  CHECK (status IN ('requested', 'ongoing', 'completed', 'cancelled')),
    CONSTRAINT CK_Trip_Distance CHECK (distance_km >= 0),
    CONSTRAINT CK_Trip_Fare     CHECK (fare >= 0)
);
 
CREATE TABLE Payment (
    payment_id    INT IDENTITY(1,1) PRIMARY KEY,
    trip_id       INT NOT NULL,
    amount        DECIMAL(8,2) NOT NULL,
    method        NVARCHAR(20) NOT NULL,
    payment_date  DATETIME2    NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Payment_Trip FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    CONSTRAINT CK_Payment_Method CHECK (method IN ('card', 'cash', 'wallet')),
    CONSTRAINT CK_Payment_Amount CHECK (amount >= 0)
);
 

CREATE TABLE Rating (
    rating_id  INT IDENTITY(1,1) PRIMARY KEY,
    trip_id    INT NOT NULL UNIQUE,
    score      TINYINT NOT NULL,
    comment    NVARCHAR(500) NULL,
    CONSTRAINT FK_Rating_Trip FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    CONSTRAINT CK_Rating_Score CHECK (score BETWEEN 1 AND 5)
);