CREATE DATABASE IF NOT EXISTS driveme;

USE driveme;

CREATE TABLE IF NOT EXISTS Passengers (
   PassengerId    INT UNSIGNED  NOT NULL AUTO_INCREMENT, 
   Name           VARCHAR(50)   NOT NULL DEFAULT '',
   Surname        VARCHAR(50)   NOT NULL DEFAULT '',
   UserName       VARCHAR(50)   NOT NULL DEFAULT '',
   Pwd            VARCHAR(50)   NOT NULL DEFAULT '',
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

CREATE TABLE IF NOT EXISTS Drivers (
   DriverId           INT UNSIGNED  NOT NULL AUTO_INCREMENT, 
   Name               VARCHAR(50)   NOT NULL DEFAULT '',
   Surname            VARCHAR(50)   NOT NULL DEFAULT '',
   UserName           VARCHAR(50)   NOT NULL DEFAULT '',
   Pwd                VARCHAR(50)   NOT NULL DEFAULT '',
   Email              VARCHAR(255)  NOT NULL DEFAULT '',
   Phone              VARCHAR(255)  NOT NULL DEFAULT '',
   DrivingLicence     VARCHAR(50)   NOT NULL DEFAULT '',
   Status             CHAR(3)       NOT NULL DEFAULT 'A',
   DrivingLicenceYear INT UNSIGNED  NOT NULL DEFAULT 0,
   FeePerKm           DECIMAL(7,2)  NOT NULL DEFAULT 10.00,
   DateCreated        DATETIME,
   DateModified       DATETIME,
   DateDeleted        DATETIME,
   CreatedBy          INT,
   ModifiedBy         INT,
   DeletedBy          INT,   
   PRIMARY KEY(DriverId)
);

CREATE TABLE IF NOT EXISTS DriverAvaibilities (
   AvaibilityId          INT UNSIGNED   NOT NULL AUTO_INCREMENT,
   DriverId              INT UNSIGNED   NOT NULL, 
   Status                CHAR(3)        NOT NULL DEFAULT 'A',
   LocalisationLatitude  DECIMAL(20,3)  NOT NULL DEFAULT 0,
   LocalisationLongitude DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   CoverArea             DECIMAL(4,2)   NOT NULL DEFAULT 0,
   DrivePerimeter        DECIMAL(4,2)   NOT NULL DEFAULT 0,
   DrivingDate           DATETIME DEFAULT CURRENT_TIMESTAMP,
   TimeFrom              DATETIME DEFAULT CURRENT_TIMESTAMP,
   TimeTo                DATETIME DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY(avaibilityId),
   FOREIGN KEY (driverId) REFERENCES Drivers (driverId)
);

CREATE TABLE IF NOT EXISTS MyDrives (
   MyDriveId       INT UNSIGNED NOT NULL AUTO_INCREMENT,
   PassengerId     INT UNSIGNED, 
   DriverId        INT UNSIGNED, 
   Status          CHAR(3)        NOT NULL DEFAULT 'A',
   FromLatitude    DECIMAL(20,3)  NOT NULL DEFAULT 0,
   FromLongitude   DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   ToLatitude      DECIMAL(23,3)  NOT NULL DEFAULT 0,
   ToLongitude     DECIMAL(20,3)  NOT NULL DEFAULT 0, 
   MydriveDate     DATETIME DEFAULT CURRENT_TIMESTAMP,
   MydriveTime     DATETIME DEFAULT CURRENT_TIMESTAMP,
   MydriveDuration DECIMAL(20,3),
   MydriveDrice    DATETIME DEFAULT CURRENT_TIMESTAMP,  -- ???
   CancelledBy     INT,
   CancelledAt     DATETIME,
   PRIMARY KEY (MyDriveId),
   FOREIGN KEY (PassengerId) REFERENCES Passengers (PassengerId),
   FOREIGN KEY (DriverId)    REFERENCES Drivers (DriverId)
);

CREATE TABLE IF NOT EXISTS Cities (
	CityId       INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CityName     VARCHAR(150) NOT NULL DEFAULT '',
	Country      VARCHAR(150) NOT NULL DEFAULT '',
	ZipCode      VARCHAR(50)  NOT NULL DEFAULT '',
    DateCreated  DATETIME,
    DateModified DATETIME,
    DateDeleted  DATETIME,
    CreatedBy    INT,
    ModifiedBy   INT,
    DeletedBy    INT,   	
   PRIMARY KEY(CityId)
);

CREATE TABLE IF NOT EXISTS Cars (
	CarId        INT UNSIGNED NOT NULL AUTO_INCREMENT,
	DriverId     INT UNSIGNED NOT NULL,
	Brand	     VARCHAR(150)   NOT NULL DEFAULT '',
	ModelYear	 INT UNSIGNED,
	Category     VARCHAR(150)   NOT NULL DEFAULT 'ECO',
	Seats        INT UNSIGNED,
    DateCreated  DATETIME,
    DateModified DATETIME,
    DateDeleted  DATETIME,
    CreatedBy    INT,
    ModifiedBy   INT,
    DeletedBy    INT,   	
   PRIMARY KEY(CarId)
);

CREATE TABLE IF NOT EXISTS Addresses (
	AddressId     INT UNSIGNED  NOT NULL AUTO_INCREMENT,
	MemberId      INT UNSIGNED  NOT NULL,
	Address1      VARCHAR(4000) NOT NULL DEFAULT '',
	Address2      VARCHAR(4000),
	Address3      VARCHAR(4000),
	Address4      VARCHAR(4000),
	ZipCode	      INT UNSIGNED,
	City          VARCHAR(150)   NOT NULL DEFAULT '',
	Country       VARCHAR(150)   NOT NULL DEFAULT 'THAILAND',
    DateCreated   DATETIME,
    DateModified  DATETIME,
    DateDeleted   DATETIME,
    CreatedBy     INT,
    ModifiedBy    INT,
    DeletedBy     INT,   	
   PRIMARY KEY(AddressId)
);


CREATE TABLE IF NOT EXISTS Logins (
  LoginID      INT          NOT NULL,
  LoginName    VARCHAR(100) NOT NULL,
  Pwd          VARCHAR(50)  NOT NULL DEFAULT '',
  DateCreated  DATETIME,
  DateModified DATETIME,
  DateDeleted  DATETIME,
  CreatedBy    INT,
  ModifiedBy   INT,
  DeletedBy    INT,   	
  PRIMARY KEY(LoginID)
);
