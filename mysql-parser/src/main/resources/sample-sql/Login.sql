CREATE DATABASE IF NOT EXISTS driveme;

USE driveme;

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



