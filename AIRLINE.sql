-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`AIRPORT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AIRPORT` (
  `Airport_code` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  `City` VARCHAR(15) NOT NULL,
  `State` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Airport_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FLIGHT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FLIGHT` (
  `Flight_number` INT NOT NULL,
  `Airline` VARCHAR(45) NOT NULL,
  `Weekdays` CHAR(10) NOT NULL,
  PRIMARY KEY (`Flight_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FLIGHT_LEG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FLIGHT_LEG` (
  `Flight_number` INT NOT NULL,
  `Leg_number` INT NOT NULL,
  `Departure_airport_code` INT NOT NULL,
  `Arrival_airport_code` INT NOT NULL,
  `Scheduled_departure_time` DATETIME NULL,
  `Scheduled_arrival_time` DATETIME NULL,
  PRIMARY KEY (`Flight_number`, `Leg_number`),
  INDEX `fk_FLIGHT_LEG_Departure_airport_code_idx` (`Departure_airport_code` ASC) VISIBLE,
  INDEX `fk_FLIGHT_LEG_Arrival_airport_code_idx` (`Arrival_airport_code` ASC) VISIBLE,
  CONSTRAINT `fk_FLIGHT_LEG_Departure_airport_code`
    FOREIGN KEY (`Departure_airport_code`)
    REFERENCES `mydb`.`AIRPORT` (`Airport_code`),
  CONSTRAINT `fk_FLIGHT_LEG_Arrival_airport_code`
    FOREIGN KEY (`Arrival_airport_code`)
    REFERENCES `mydb`.`AIRPORT` (`Airport_code`),
  CONSTRAINT `fk_FLIGHT_LEG_Flight_number`
    FOREIGN KEY (`Flight_number`)
    REFERENCES `mydb`.`FLIGHT` (`Flight_number`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AIRPLANE_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AIRPLANE_TYPE` (
  `Airplane_type_name` VARCHAR(15) NOT NULL,
  `Max_seats` VARCHAR(45) NOT NULL,
  `Company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Airplane_type_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AIRPLANE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AIRPLANE` (
  `Airplane_id` INT NOT NULL,
  `Total_number_of_seats` INT NOT NULL,
  `Airplane_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Airplane_id`),
  INDEX `fk_AIRPLANE_Airplane_type_idx` (`Airplane_type` ASC) VISIBLE,
  CONSTRAINT `fk_AIRPLANE_Airplane_type`
    FOREIGN KEY (`Airplane_type`)
    REFERENCES `mydb`.`AIRPLANE_TYPE` (`Airplane_type_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LEG_INSTANCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LEG_INSTANCE` (
  `Flight_number` INT NOT NULL,
  `Leg_number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Number_of_available_seats` INT NULL,
  `Airplane_id` INT NULL,
  `Departure_airport_code` INT NOT NULL,
  `Arrival_airport_code` INT NOT NULL,
  `Arrival_time` DATETIME NOT NULL,
  `Departure_time` DATETIME NOT NULL,
  PRIMARY KEY (`Flight_number`, `Leg_number`, `Date`),
  INDEX `fk_Leg_INSTANCE_Airplane_id_idx` (`Airplane_id` ASC) VISIBLE,
  INDEX `fk_Leg_INSTANCE_Arrival_airprot_code_idx` (`Arrival_airport_code` ASC) VISIBLE,
  INDEX `fk_Leg_INSTANCE_Departure_airport_code_idx` (`Departure_airport_code` ASC) VISIBLE,
  CONSTRAINT `fk_LEG_INSTANCE_Flight_number`
    FOREIGN KEY (`Flight_number`)
    REFERENCES `mydb`.`FLIGHT` (`Flight_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Leg_number`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FLIGHT_LEG` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_INSTANCE_Airplane_id`
    FOREIGN KEY (`Airplane_id`)
    REFERENCES `mydb`.`AIRPLANE` (`Airplane_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_INSTANCE_Arrival_airprot_code`
    FOREIGN KEY (`Arrival_airport_code`)
    REFERENCES `mydb`.`AIRPORT` (`Airport_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_INSTANCE_Departure_airport_code`
    FOREIGN KEY (`Departure_airport_code`)
    REFERENCES `mydb`.`AIRPORT` (`Airport_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FARE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FARE` (
  `Flight_number` INT NOT NULL,
  `Fare_code` INT NOT NULL,
  `Amount` VARCHAR(45) NULL,
  `Restrictions` INT NULL,
  PRIMARY KEY (`Flight_number`, `Fare_code`),
  CONSTRAINT `fk_FARE_Flight_number`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FLIGHT` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAN_LAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CAN_LAND` (
  `Airplane_type_name` VARCHAR(15) NOT NULL,
  `Airport_code` INT NOT NULL,
  PRIMARY KEY (`Airplane_type_name`, `Airport_code`),
  INDEX `fk_CAN_LAND_Airport_code_idx` (`Airport_code` ASC) VISIBLE,
  CONSTRAINT `fk_CAN_LAND_Airplane_type_name`
    FOREIGN KEY (`Airplane_type_name`)
    REFERENCES `mydb`.`AIRPLANE_TYPE` (`Airplane_type_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAN_LAND_Airport_code`
    FOREIGN KEY (`Airport_code`)
    REFERENCES `mydb`.`AIRPORT` (`Airport_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SEAT_RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEAT_RESERVATION` (
  `Flight_number` INT NOT NULL,
  `Leg_number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Seat_number` VARCHAR(45) NOT NULL,
  `Customer_name` VARCHAR(20) NULL,
  `Customer_phone` VARCHAR(20) NULL,
  PRIMARY KEY (`Flight_number`, `Leg_number`, `Date`, `Seat_number`),
  CONSTRAINT `fk_SEAT_RESERVATION_Leg_number`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FLIGHT_LEG` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEAT_RESERVATION_Date`
    FOREIGN KEY ()
    REFERENCES `mydb`.`FLIGHT` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEAT_RESERVATION_Flight_number`
    FOREIGN KEY (`Flight_number`)
    REFERENCES `mydb`.`FLIGHT_LEG` (`Flight_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `UserID` INT NOT NULL,
  `Flight_number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Seat_number` VARCHAR(45) NOT NULL,
  `Customer_name` VARCHAR(20) NOT NULL,
  `Customer_phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`UserID`, `Flight_number`),
  INDEX `fk_USER_Flight_number_idx` (`Flight_number` ASC) VISIBLE,
  CONSTRAINT `fk_USER_Flight_number`
    FOREIGN KEY (`Flight_number`)
    REFERENCES `mydb`.`FLIGHT` (`Flight_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
