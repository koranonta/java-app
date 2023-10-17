
CREATE TABLE `content` (
`ID` int(11) NOT NULL auto_increment,
`current_revision` int(11) NOT NULL,
`active` tinyint(1) NOT NULL,
`secure` tinyint(1) NOT NULL,
`parent` int(11) NOT NULL,
`order` int(11) NOT NULL,
`author` int(11) NOT NULL,
`type` int(11) NOT NULL,
`path` varchar(255) NOT NULL,
PRIMARY KEY (`ID`),
KEY `current_revision` (`current_revision`,`active`,`type`),
KEY `type` (`type`),
KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
COMMENT='Content Elements Table' AUTO_INCREMENT=1 ;



ALTER TABLE `content`
ADD CONSTRAINT `content_ibfk_10` FOREIGN KEY (`type`)
REFERENCES `content_types` (`ID`) ON UPDATE CASCADE,
ADD CONSTRAINT `content_ibfk_8` FOREIGN KEY (`current_revision`)
REFERENCES `content_versions` (`ID`) ON UPDATE CASCADE,
ADD CONSTRAINT `content_ibfk_9` FOREIGN KEY (`author`)
REFERENCES `users` (`ID`) ON UPDATE CASCADE;

CREATE TABLE `content_types` (
`ID` int(11) NOT NULL auto_increment,
`reference` varchar(15) NOT NULL,
`name` varchar(25) NOT NULL,
PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE `content_versions` (
`ID` int(11) NOT NULL auto_increment,
`name` varchar(255) NOT NULL,
`heading` varchar(255) NOT NULL,
`content` longtext NOT NULL,
`metakeywords` varchar(255) NOT NULL,
`metadescription` varchar(255) NOT NULL,
`metarobots` varchar(255) NOT NULL,
`author` int(11) NOT NULL,
`created` timestamp NOT NULL default CURRENT_TIMESTAMP,
PRIMARY KEY (`ID`),
KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

ALTER TABLE `content_versions`
ADD CONSTRAINT `content_versions_ibfk_1` FOREIGN KEY (`author`)
REFERENCES `users` (`ID`) ON UPDATE CASCADE;

CREATE TABLE `content_types_products` (
`ID` int(11) NOT NULL auto_increment,
`content_version` int(11) NOT NULL,
`price` float NOT NULL,
`weight` int(11) NOT NULL,
`SKU` varchar(255) NOT NULL,
`stock` int(11) NOT NULL,
`image` varchar(255) NOT NULL,
`featured` tinyint(1) NOT NULL,
PRIMARY KEY (`ID`),
KEY `content_version` (`content_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

ALTER TABLE `content_types_products`
ADD CONSTRAINT `content_types_products_ibfk_1`
FOREIGN KEY (`content_version`)
REFERENCES `content_versions` (`ID`)
ON DELETE CASCADE ON UPDATE CASCADE;


