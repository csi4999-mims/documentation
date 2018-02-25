-- -*- mode: sql -*-

-- File: CakeDocumentation/schema-all.sql
--
-- This file will contain all the SQL required to create and link
-- tables together for the MIMS system.  It's not done yet, though.
-- --MR 2018-02-25


---------------------
-- DATABASE TABLES --
---------------------


-- user

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `user_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email_address` VARCHAR(100) NOT NULL,
    `user_password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50) NOT NULL);


-- law_enforcement

DROP TABLE IF EXISTS `law_enforcement`;

CREATE TABLE `law_enforcement` (
    `law_enforcement_id` INT NOT NULL PRIMARY KEY,
    `badge_number` VARCHAR(100) NOT NULL,
    `department` VARCHAR(100) NOT NULL);


-- place

DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
    `place_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `place_name` VARCHAR(100),
    `address_country` VARCHAR(100),
    `address_state` VARCHAR(100),
    `address_city` VARCHAR(100),
    `address_street` VARCHAR(100),
    `address_number` VARCHAR(20),
    -- Ruled out the use of ZIP+4 due to the fact that the +4 portion
    -- can change frequently and without notice.
    `address_zip` CHAR(5));


-- missing

DROP TABLE IF EXISTS `missing`;

CREATE TABLE `missing` (
    `missing_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email_address` VARCHAR(100),
    `phone_number` VARCHAR(15),
    `eye_color` ENUM('amber', 'black', 'blue', 'brown', 'green',
                     'grey', 'hazel', 'other'),
    `eye_color_other` VARCHAR(255),
    `hair_color` ENUM('auburn', 'black', 'blonde', 'brown', 'grey',
                      'red', 'white', 'other'),
    `hair_color_other` VARCHAR(255),
    `markings` VARCHAR(255),
    `weight_pounds` SMALLINT,
    `height_inches` SMALLINT,
    `date_of_birth` DATE,
    `facebook_username` VARCHAR(255),
    `misc` VARCHAR(255));


-- friend_family

DROP TABLE IF EXISTS `friend_family`;

CREATE TABLE `friend_family` (
    `friend_family_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `middle_name` VARCHAR(50),
    `alias` VARCHAR(50),
    `home_id` INT,
    `gender` ENUM('female', 'male', 'androgynous'),
    -- The following list is based in part on the 2000 United States
    -- Census ethnicity categories.
    `ethnicity` ENUM('american_indian', 'asian', 'african_american',
                     'hispanic_latino', 'middle_eastern',
                     'pacific_islander', 'white', 'other'),
    `ethnicity_other` VARCHAR(255));

----------------------------
-- DATABASE RELATIONSHIPS --
----------------------------


-- law_enforcement.law_enforcement_id <--> user.user_id

ALTER TABLE `law_enforcement`
    ADD CONSTRAINT 'fk_law_enforcement_id'
    FOREIGN KEY (`law_enforcement_id`)
    REFERENCES `user`.`user_id`
    ON UPDATE CASCADE
    ON DELETE CASCADE;
