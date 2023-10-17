DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `pd_id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id`         int(10) unsigned NOT NULL DEFAULT '0',
  `pd_name`        varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pd_description` text COLLATE utf8_unicode_ci NOT NULL,
  `pd_price`       decimal(9,2) NOT NULL DEFAULT '0.00',
  `pd_qty`         smallint(5) unsigned NOT NULL DEFAULT '0',
  `pd_image`       varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pd_thumbnail`   varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pd_date`        datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pd_last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pd_id`),
  KEY `cat_id` (`cat_id`),
  KEY `pd_name` (`pd_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

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

CREATE TABLE `tbl_mvthist` (
  `mvt_hist_id`   INT NOT NULL AUTO_INCREMENT,
  `user_id`       INT NOT NULL,
  `pd_id`         INT NOT NULL,
  `mvt_type_id`   INT NOT NULL,
  `mvt_date`      DATETIME NOT NULL,
  `quantity`      INT NOT NULL,
  `price`         FLOAT,
  `info`          VARCHAR(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created`  DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  `date_deleted`  DATETIME,
  `created_by`    INT NOT NULL,
  `modified_by`   INT NOT NULL,
  `deleted_by`    INT    
  PRIMARY KEY(`mvt_hist_id`),  
  FOREIGN KEY (`user_id`)
    REFERENCES `tbl_user` (`user_id`),  
  FOREIGN KEY (`pd_id`)
    REFERENCES `tbl_product` (`pd_id`)    
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;