-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sauna
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Sauna` ;

-- -----------------------------------------------------
-- Schema Sauna
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sauna` DEFAULT CHARACTER SET utf8 ;
USE `Sauna` ;

-- -----------------------------------------------------
-- Table `Sauna`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sauna`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`Location` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`Location` (
  `lokation_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `gps` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lokation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sauna`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`Event` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`Event` (
  `event_id` INT NOT NULL,
  `start_time` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `participants` INT NOT NULL,
  `lokation_id` INT NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_Event_Location1_idx` (`lokation_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Location1`
    FOREIGN KEY (`lokation_id`)
    REFERENCES `Sauna`.`Location` (`lokation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sauna`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`Booking` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`Booking` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `confirmation` TINYINT NOT NULL,
  PRIMARY KEY (`booking_id`, `customer_id`, `event_id`),
  INDEX `fk_Customer_has_Event_Event1_idx` (`event_id` ASC) VISIBLE,
  INDEX `fk_Customer_has_Event_Customer_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_Event_Customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Sauna`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Event_Event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `Sauna`.`Event` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sauna`.`Waitinglist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`Waitinglist` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`Waitinglist` (
  `waitinglist_id` INT NOT NULL AUTO_INCREMENT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sauna`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sauna`.`User` ;

CREATE TABLE IF NOT EXISTS `Sauna`.`User` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
