-- -*- mode: sql; eval: (sql-highlight-mysql-keywords); -*-

-- File: CakeDocumentation/schema-all.sql
--
-- This file will contain all the SQL required to create and link
-- tables together for the MIMS system.
--
-- If you wish to keep your data, DO NOT RUN THIS SCRIPT!

-- -----------------
-- REMOVE OLD TABLES
-- -----------------

DROP TABLE IF EXISTS `last_seen`;
DROP TABLE IF EXISTS `workplace`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `missing_relation`;
DROP TABLE IF EXISTS `friend_family`;
DROP TABLE IF EXISTS `place`;
DROP TABLE IF EXISTS `law_enforcement`;
DROP TABLE IF EXISTS `report`;
DROP TABLE IF EXISTS `missing`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `users`;

-- ----------------------
-- CREATE DATABASE TABLES
-- ----------------------

-- user
CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50),
    `last_name` VARCHAR(50) NOT NULL,
    `phone` CHAR(10),
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL);

-- law_enforcement
CREATE TABLE `law_enforcement` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50),
    `last_name` VARCHAR(50) NOT NULL,
    `phone` CHAR(10),
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `badge_number` VARCHAR(100) NOT NULL,
    `department` VARCHAR(100) NOT NULL);

-- place
CREATE TABLE `place` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    `country` VARCHAR(100),
    `state` VARCHAR(100),
    `city` VARCHAR(100),
    `street` VARCHAR(100),
    `number` VARCHAR(20),
    -- Ruled out the use of ZIP+4 due to the fact that the +4 portion
    -- can change frequently and without notice.
    `zip` CHAR(5));

-- missing
CREATE TABLE `missing` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100),
    `middle_name` VARCHAR(100),
    `last_name` VARCHAR(100),
    `alias` VARCHAR(100),
    `email` VARCHAR(100),
    `phone` VARCHAR(15),
    `ethnicity` ENUM('american_indian', 'asian', 'african_american',
                     'hispanic_latino', 'middle_eastern',
                     'pacific_islander', 'white', 'other'),
    `ethnicity_other` VARCHAR(255),
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
    `twitter_username` VARCHAR(255),
    `instagram_username` VARCHAR(255),
    `snapchat_username` VARCHAR(255),
    `misc` VARCHAR(255));

-- friend_family
CREATE TABLE `friend_family` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

-- last_seen
CREATE TABLE `last_seen` (
    `report_id` INT NOT NULL,
    `place_id` INT NOT NULL,
    `when` DATETIME,
    `notes` VARCHAR(255),
    PRIMARY KEY (`report_id`, `place_id`));

-- workplace
CREATE TABLE `workplace` (
    `missing_id` INT NOT NULL,
    `place_id` INT NOT NULL,
    `start_date` DATE,
    `end_date` DATE);

-- missing_relation
CREATE TABLE `missing_relation` (
    `friend_family_id` INT NOT NULL,
    `missing_id` INT NOT NULL,
    PRIMARY KEY (`friend_family_id`, `missing_id`));

-- report
CREATE TABLE `report` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `submitter_id` INT NOT NULL,
    `missing_id` INT NOT NULL,
    `law_enforcement_id` INT,
    `approved_datetime` DATETIME,
    `submit_datetime` DATETIME NOT NULL,
    `missing_status` ENUM('missing', 'found') NOT NULL,
    `case_number` VARCHAR(255));

-- comment
CREATE TABLE `comment` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `report_id` INT NOT NULL,
    `user_id` INT,
    `timestamp` TIMESTAMP,
    `text` VARCHAR(500));

-- ----------------------
-- DATABASE RELATIONSHIPS
-- ----------------------

-- report.submitter_id --> user.id
ALTER TABLE `report`
    ADD CONSTRAINT `fk_report_submitter_id`
    FOREIGN KEY (`submitter_id`)
    REFERENCES `users` (`id`)
    ON UPDATE CASCADE;

-- report.missing_id --> missing.id
ALTER TABLE `report`
    ADD CONSTRAINT `fk_report_missing_id`
    FOREIGN KEY (`missing_id`)
    REFERENCES `missing` (`id`)
    ON UPDATE CASCADE;

-- comment.report_id --> report.id
ALTER TABLE `comment`
    ADD CONSTRAINT `fk_comment_report_id`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- comment.user_id --> user.id
ALTER TABLE `comment`
    ADD CONSTRAINT `fk_comment_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- missing_relation.friend_family_id --> friend_family.id
ALTER TABLE `missing_relation`
    ADD CONSTRAINT `fk_missing_relation_friend_family_id`
    FOREIGN KEY (`friend_family_id`)
    REFERENCES `friend_family` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- missing_relation.missing_id --> missing.id
ALTER TABLE `missing_relation`
    ADD CONSTRAINT `fk_missing_relation_missing_id`
    FOREIGN KEY (`missing_id`)
    REFERENCES `missing` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- last_seen.report_id --> report.id
ALTER TABLE `last_seen`
    ADD CONSTRAINT `fk_last_seen_report_id`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- last_seen.place_id --> place.id
ALTER TABLE `last_seen`
    ADD CONSTRAINT `fk_last_seen_place_id`
    FOREIGN KEY (`place_id`)
    REFERENCES `place` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- workplace.missing_id --> missing.id
ALTER TABLE `workplace`
    ADD CONSTRAINT `fk_workplace_missing_id`
    FOREIGN KEY (`missing_id`)
    REFERENCES `missing` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- workplace.place_id --> place.id
ALTER TABLE `workplace`
    ADD CONSTRAINT `fk_workplace_place_id`
    FOREIGN KEY (`place_id`)
    REFERENCES `place` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
