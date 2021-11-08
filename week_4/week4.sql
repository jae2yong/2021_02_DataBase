-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema week4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema week4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `week4` DEFAULT CHARACTER SET utf8 ;
USE `week4` ;

-- -----------------------------------------------------
-- Table `week4`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `week4`.`employee` (
  `Fname` VARCHAR(20) NOT NULL,
  `Minit` CHAR(1) NULL,
  `Lname` VARCHAR(20) NOT NULL,
  `Ssn` CHAR(9) NOT NULL,
  `Bdate` DATE NULL,
  `Address` VARCHAR(30) NULL,
  `Sex` CHAR(1) NULL,
  `Salary` DECIMAL(5) NULL,
  `Dno` INT NULL,
  PRIMARY KEY (`Ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `week4`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `week4`.`department` (
  `Dname` CHAR(20) NOT NULL,
  `Dnumber` INT NOT NULL,
  `Mgr_Ssn` CHAR(9) NULL,
  `Mgr_start_date` DATE NULL,
  `employee_Ssn` CHAR(9) NOT NULL,
  INDEX `fk_department_employee_idx` () ,
  PRIMARY KEY (`Dnumber`, `employee_Ssn`),
  INDEX `fk_department_employee_idx1` (`employee_Ssn` ASC) ,
  CONSTRAINT `fk_department_employee`
    FOREIGN KEY (`employee_Ssn`)
    REFERENCES `week4`.`employee` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
