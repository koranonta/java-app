DROP TABLE IF EXISTS `tbl_inventory`;
CREATE TABLE IF NOT EXISTS `tbl_inventory` (
  `inv_id`          INT NOT NULL AUTO_INCREMENT,
  `user_id`         INT NOT NULL,
  `pd_id`           INT NOT NULL,
  `total_qty`       INT,
  `last_rcv_date`   DATETIME,
  `last_issue_date` DATETIME,
  `date_created`    DATETIME NOT NULL,
  `date_modified`   DATETIME NOT NULL,
  `date_deleted`    DATETIME,
  `created_by`      INT NOT NULL,
  `modified_by`     INT NOT NULL,
  `deleted_by`      INT  
  PRIMARY KEY(`inv_id`),  
  FOREIGN KEY (`user_id`)
    REFERENCES `tbl_user` (`user_id`),
  FOREIGN KEY (`pd_id`)
    REFERENCES `tbl_product` (`pd_id`)   
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
