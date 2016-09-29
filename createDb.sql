
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `15gifts` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `15gifts`;

CREATE USER 'FifteenGifts'@'%' IDENTIFIED BY '15g1ft5£';
GRANT ALL PRIVILEGES ON * . * TO 'FifteenGifts'@'%';
FLUSH PRIVILEGES;


DROP DATABASE `15gifts`;
CREATE DATABASE `15gifts` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `15gifts`;


SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


DROP TABLE IF EXISTS `test_table`;
CREATE TABLE IF NOT EXISTS `test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `randomQuotes` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


INSERT INTO `test_table` (`id`, `randomQuotes`, `author`) VALUES
(1, 'Lisp isn''t a language, it''s a building material', 'Alan Kay'),
(2, 'Walking on water and developing software from a specification are easy if both are frozen', 'Edward V Berard'),
(3, 'They don''t make bugs like Bunny anymore', 'Olav Mjelde'),
(4, 'A programming language is low level when its programs require attention to the irrelevant', 'Alan J. Perlis'),
(5, 'A C program is like a fast dance on a newly waxed dance floor by people carrying razors', 'Waldi Ravens'),
(6, 'I think Microsoft named .Net so it wouldn''t show up in a Unix directory listing', 'Oktal'),
(7, 'Good design adds value faster than it adds cost', 'Thomas C. Gale'),
(8, 'Talk is cheap. Show me the code', 'Linus Torvalds'),
(9, 'C is quirky, flawed, and an enormous success.', 'Dennis M. Ritchie'),
(10, 'In theory, theory and practice are the same. In practice, they’re not', 'Yoggi Berra');


SET FOREIGN_KEY_CHECKS=1;
