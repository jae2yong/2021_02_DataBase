-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb1` DEFAULT CHARACTER SET utf8 ;
USE `mydb1` ;

-- -----------------------------------------------------
-- Table `mydb1`.`PUBLISHER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`PUBLISHER` (
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`BOOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`BOOK` (
  `BOOK_id` INT NOT NULL,
  `Title` VARCHAR(45) NULL DEFAULT NULL,
  `Publisher_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BOOK_id`),
  INDEX `fk_BOOK_PUBLISHER_idx` (`Publisher_name` ASC) VISIBLE,
  CONSTRAINT `fk_BOOK_PUBLISHER`
    FOREIGN KEY (`Publisher_name`)
    REFERENCES `mydb1`.`PUBLISHER` (`Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`BOOK_AUTHORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`BOOK_AUTHORS` (
  `Book_id` INT NOT NULL,
  `Author_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Book_id`),
  CONSTRAINT `fk_AUTHORS_BOOK`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb1`.`BOOK` (`BOOK_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`LIBRARY_BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`LIBRARY_BRANCH` (
  `Branch_id` INT NOT NULL,
  `Branch_name` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Branch_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`BOOK_COPIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`BOOK_COPIES` (
  `Book_id` INT NOT NULL,
  `Branch_id` INT NOT NULL,
  `No_of_copies` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Book_id`, `Branch_id`),
  INDEX `fk_COPIES_BOOK_idx` (`Book_id` ASC) VISIBLE,
  INDEX `fk_COPIES_LIBRARY` (`Branch_id` ASC) VISIBLE,
  CONSTRAINT `fk_COPIES_BOOK`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb`.`BOOK` (`BOOK_id`),
  CONSTRAINT `fk_COPIES_LIBRARY`
    FOREIGN KEY (`Branch_id`)
    REFERENCES `mydb`.`LIBRARY_BRANCH` (`Branch_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`BORRORWER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`BORRORWER` (
  `Card_no` INT NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Card_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb1`.`BOOK_LOANS`
-- -----------------------------------------------------
CREATE TABLE(
  `Book_id` INT NOT NULL,
  `Branch_id` INT NOT NULL,
  `Card_no` INT NOT NULL,
  `Date_out` DATE NULL DEFAULT NULL,
  `Due_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Book_id`, `Card_no`, `Branch_id`),
  INDEX `fk_LOANS_LIBRARY_idx` (`Branch_id` ASC) VISIBLE,
  INDEX `fk_LOANS_BORROWER_idx` (`Card_no` ASC) VISIBLE,
  CONSTRAINT `fk_LOANS_BOOK`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb1`.`BOOK` (`BOOK_id`),
  CONSTRAINT `fk_LOANS_BORROWER`
    FOREIGN KEY (`Card_no`)
    REFERENCES `mydb`.`BORRORWER` (`Card_no`),
  CONSTRAINT `fk_LOANS_LIBRARY`
    FOREIGN KEY (`Branch_id`)
    REFERENCES `mydb1`.`LIBRARY_BRANCH` (`Branch_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
