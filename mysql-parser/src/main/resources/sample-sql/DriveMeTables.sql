CREATE DATABASE IF NOT EXISTS driveme;

USE driveme;

DROP TABLE IF EXISTS Passengers;

CREATE TABLE IF NOT EXISTS Passengers (
   PassengerId    INT UNSIGNED  NOT NULL AUTO_INCREMENT,
   Status         CHAR(1) NOT NULL DEFAULT 'A' CHECK (Status IN ('A','D')),
   Name           VARCHAR(50)   NOT NULL DEFAULT '',
   Surname        VARCHAR(50)   NOT NULL DEFAULT '',
   UserName       VARCHAR(50)   NOT NULL DEFAULT '',
   Pwd            VARCHAR(255)   NOT NULL DEFAULT '',
   Email          VARCHAR(255)  NOT NULL DEFAULT '',
   Phone          VARCHAR(255)  NOT NULL DEFAULT '',
   DateCreated    DATETIME,
   DateModified   DATETIME,
   DateDeleted    DATETIME,
   CreatedBy      INT,
   ModifiedBy     INT,
   DeletedBy      INT,
   PRIMARY KEY (PassengerId)
);

DROP TABLE IF EXISTS Drivers;

CREATE TABLE IF NOT EXISTS Drivers (
   DriverId           INT UNSIGNED  NOT NULL AUTO_INCREMENT,
   Status             CHAR(1) NOT NULL DEFAULT 'A' CHECK (Status IN ('A','D')),
   Name               VARCHAR(50)   NOT NULL DEFAULT '',
   Surname            VARCHAR(50)   NOT NULL DEFAULT '',
   UserName           VARCHAR(50)   NOT NULL DEFAULT '',
   Pwd                VARCHAR(255)   NOT NULL DEFAULT '',
   Email              VARCHAR(255)  NOT NULL DEFAULT '',
   Phone              VARCHAR(255)  NOT NULL DEFAULT '',
   DrivingLicence     VARCHAR(50)   NOT NULL DEFAULT '',
   DrivingLicenceYear DATETIME  NOT NULL DEFAULT Now(),
   FeePerKm           DECIMAL(7,2)  NOT NULL DEFAULT 10.00,
   DateCreated        DATETIME,
   DateModified       DATETIME,
   DateDeleted        DATETIME,
   CreatedBy          INT,
   ModifiedBy         INT,
   DeletedBy          INT,
   PRIMARY KEY (DriverId)
);

DROP TABLE IF EXISTS Cities;

CREATE TABLE IF NOT EXISTS Cities (
  CityId        INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  Status        CHAR(1) NOT NULL DEFAULT 'A' CHECK (Status IN ('A','D')),
  CityName      VARCHAR(150)  NOT NULL DEFAULT '',
  Country       VARCHAR(150)  NOT NULL DEFAULT '',
  ZipCode       VARCHAR(50)   NOT NULL DEFAULT '',
  Latitude      DECIMAL(20,3) NOT NULL DEFAULT 0,
  Longitude     DECIMAL(20,3) NOT NULL DEFAULT 0,  
  DateCreated   DATETIME,
  DateModified  DATETIME,
  DateDeleted   DATETIME,
  CreatedBy     INT,
  ModifiedBy    INT,
  DeletedBy     INT,
  PRIMARY KEY(CityId)
);


DROP TABLE IF EXISTS Cars;

CREATE TABLE IF NOT EXISTS Cars (
  CarId         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  DriverId      INT UNSIGNED NOT NULL,
  Brand         VARCHAR(150)   NOT NULL DEFAULT '',
  Model         VARCHAR(150)   NOT NULL DEFAULT '',
  CarYear       INT UNSIGNED,
  Category      VARCHAR(30)   NOT NULL DEFAULT 'ECO' CHECK (pCategory in ('ECO','VIP','VAN')),
  Seats         INT UNSIGNED,
  DateCreated   DATETIME,
  DateModified  DATETIME,
  DateDeleted   DATETIME,
  CreatedBy     INT,
  ModifiedBy    INT,
  DeletedBy     INT,
  PRIMARY KEY(CarId),
  FOREIGN KEY (driverId) REFERENCES Drivers (driverId)
);

DROP TABLE IF EXISTS Addresses;

CREATE TABLE IF NOT EXISTS Addresses (
  AddressId     INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  MemberId      INT UNSIGNED  NOT NULL,
  Address1      VARCHAR(4000) NOT NULL DEFAULT '',
  Address2      VARCHAR(4000),
  Address3      VARCHAR(4000),
  Address4      VARCHAR(4000),
  ZipCode       INT UNSIGNED,
  City          VARCHAR(150)   NOT NULL DEFAULT '',
  Country       VARCHAR(150)   NOT NULL DEFAULT 'THAILAND',
  Latitude      DECIMAL(20,3)  NOT NULL DEFAULT 0,
  Longitude     DECIMAL(20,3)  NOT NULL DEFAULT 0,  
  DateCreated   DATETIME,
  DateModified  DATETIME,
  DateDeleted   DATETIME,
  CreatedBy     INT,
  ModifiedBy    INT,
  DeletedBy     INT,
  PRIMARY KEY(AddressId),
  FOREIGN KEY (MemberId) REFERENCES Passengers (passengerId)
);


DROP TABLE IF EXISTS MyDrives;

CREATE TABLE IF NOT EXISTS MyDrives (
   MyDriveId         INT UNSIGNED NOT NULL AUTO_INCREMENT,
   PassengerId       INT UNSIGNED, 
   DriverId          INT UNSIGNED, 
   Status            CHAR(3)        NOT NULL DEFAULT 'A',
   FromLatitude      DECIMAL(20,3)  NOT NULL DEFAULT 0,
   FromLongitude     DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   ToLatitude        DECIMAL(23,3)  NOT NULL DEFAULT 0,
   ToLongitude       DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   MydriveDate       DATETIME DEFAULT CURRENT_TIMESTAMP,
   MydriveTime       TIME,
   MydriveDuration   DECIMAL(20,3),
   MydrivePrice      DECIMAL(7,2)  DEFAULT 0, 
   CancelledBy       VARCHAR(50),
   CnclByMemberType  CHAR(1) CHECK (MemberType in ('P','D')),
   CancelledAt       DATETIME,
   DateCreated       DATETIME,
   DateModified      DATETIME,
   DateDeleted       DATETIME,
   CreatedBy         INT,
   ModifiedBy        INT,
   DeletedBy         INT,
   PRIMARY KEY (MyDriveId),
   FOREIGN KEY (PassengerId) REFERENCES Passengers (PassengerId),
   FOREIGN KEY (DriverId)    REFERENCES Drivers (DriverId)
);

DROP TABLE IF EXISTS DriverAvaibilities;

CREATE TABLE IF NOT EXISTS DriverAvaibilities (
   AvaibilityId          INT UNSIGNED   NOT NULL AUTO_INCREMENT,
   DriverId              INT UNSIGNED   NOT NULL, 
   Status                CHAR(3)        NOT NULL DEFAULT 'A',
   LocalisationLatitude  DECIMAL(20,3)  NOT NULL DEFAULT 0,
   LocalisationLongitude DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   CoverArea             DECIMAL(4,2)   NOT NULL DEFAULT 0,
   DrivePerimeter        DECIMAL(4,2)   NOT NULL DEFAULT 0,
   DrivingDate           DATETIME DEFAULT CURRENT_TIMESTAMP,
   TimeFrom              TIME,
   TimeTo                TIME,
   DateCreated           DATETIME,
   DateModified          DATETIME,
   DateDeleted           DATETIME,
   CreatedBy             INT,
   ModifiedBy            INT,
   DeletedBy             INT,
   PRIMARY KEY(avaibilityId),
   FOREIGN KEY (driverId) REFERENCES Drivers (driverId)
);

DROP TABLE IF EXISTS Logins;

CREATE TABLE IF NOT EXISTS Logins (
  LoginId      INT          NOT NULL AUTO_INCREMENT,
  LoginName    VARCHAR(100) NOT NULL,
  Pwd          VARCHAR(50)  NOT NULL,
  Email        VARCHAR(40)  NOT NULL,
  DateCreated  DATETIME,
  DateModified DATETIME,
  DateDeleted  DATETIME,
  CreatedBy    INT,
  ModifiedBy   INT,
  DeletedBy    INT,   	
  PRIMARY KEY(LoginID)
);



