SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb1263` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb1263` ;

-- -----------------------------------------------------
-- Table `mydb1263`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`customer` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`customer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`employee` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`employee` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`transaction` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`transaction` (
  `id` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `isOnline?` TINYINT(1) NOT NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_employee1_idx` (`employee_id` ASC),
  INDEX `fk_transaction_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_transaction_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb1263`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb1263`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`product` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`transaction_has_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`transaction_has_product` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`transaction_has_product` (
  `transaction_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`transaction_id`, `product_id`),
  INDEX `fk_transaction_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_transaction_has_product_transaction1_idx` (`transaction_id` ASC),
  CONSTRAINT `fk_transaction_has_product_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `mydb1263`.`transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb1263`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`printJob`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`printJob` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`printJob` (
  `printID` INT NOT NULL,
  `pagesize` VARCHAR(45) NOT NULL,
  `priceperpage` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`printID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1263`.`transaction_has_printJob`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb1263`.`transaction_has_printJob` ;

CREATE TABLE IF NOT EXISTS `mydb1263`.`transaction_has_printJob` (
  `transaction_id` INT NOT NULL,
  `printJob_printID` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`transaction_id`, `printJob_printID`),
  INDEX `fk_transaction_has_printJob_printJob1_idx` (`printJob_printID` ASC),
  INDEX `fk_transaction_has_printJob_transaction1_idx` (`transaction_id` ASC),
  CONSTRAINT `fk_transaction_has_printJob_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `mydb1263`.`transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_has_printJob_printJob1`
    FOREIGN KEY (`printJob_printID`)
    REFERENCES `mydb1263`.`printJob` (`printID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
