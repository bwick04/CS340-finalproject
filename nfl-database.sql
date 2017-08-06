DROP TABLE IF EXISTS `nfl_players`;

CREATE TABLE `nfl_players` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`fname` varchar(255) NOT NULL,
	`lname` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--

DROP TABLE IF EXISTS `nfl_teams`;
	
CREATE TABLE `nfl_teams` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--


DROP TABLE IF EXISTS `nfl_award`;

CREATE TABLE `nfl_award` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--

DROP TABLE IF EXISTS `nfl_player_award`;

CREATE TABLE `nfl_player_award` (
	`aid` int(11) NOT NULL DEFAULT '0',
	`pid` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`aid`,`pid`),
	KEY `pid` (`pid`),
	CONSTRAINT `bsg_player_award_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `nfl_award` (`id`),
	CONSTRAINT `bsg_player_award_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `nfl_players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--

DROP TABLE IF EXISTS `nfl_stadium`;

CREATE TABLE `nfl_stadium` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

