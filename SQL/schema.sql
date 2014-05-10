-- CREATE DATABASE chatbetter;

USE chat;

-- CREATE TABLE messages (
--  `id` number(100),
--  `user_id` number(100),
--  `value` varchar(140),
--  `created_by` varchar(20),
--  `created_at` date,
--  `room` varchar(25)
-- );

/* You can also create more tables, if you need them... */

/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/


CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100),
  PRIMARY KEY  (`id`)
);

CREATE TABLE `messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(255),
  `created_by` INT,
  `created_at` TIMESTAMP,
  `room` INT,
  PRIMARY KEY  (`id`)
);

CREATE TABLE `rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100),
  PRIMARY KEY  (`id`)
);


ALTER TABLE `messages` ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`created_by`) REFERENCES users(`id`);
ALTER TABLE `messages` ADD CONSTRAINT `messages_fk2` FOREIGN KEY (`room`) REFERENCES rooms(`id`);




