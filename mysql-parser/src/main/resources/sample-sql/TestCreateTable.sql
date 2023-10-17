CREATE TABLE Products (
  ProdID        INT NOT NULL AUTO_INCREMENT,
  CategoryID    INT NOT NULL,
  Title         VARCHAR(100) NOT NULL,
  Description   VARCHAR(500),
  Image         VARCHAR(100),
  DateCreated   DATETIME NOT NULL,
  DateModified  DATETIME NOT NULL,
  DateDeleted   DATETIME,
  CreatedBy     INT NOT NULL,
  ModifiedBy    INT NOT NULL,
  DeletedBy     INT,
  PRIMARY KEY (ProdID),
  FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID) 
);