-- MySQL Script generated by MySQL Workbench
-- Mon Apr 13 12:23:21 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  INDEX `idUserForSupplier_idx` (`idUser` ASC),
  CONSTRAINT `idUserForSupplier`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flight` (
  `idFlight` INT NOT NULL AUTO_INCREMENT,
  `idSupplier` INT NOT NULL,
  `route` VARCHAR(45) NOT NULL,
  `filghtDate` DATE NOT NULL,
  `price` DECIMAL(45) NOT NULL,
  `ifAvailable` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idFlight`),
  INDEX `idSupplierForFlights_idx` (`idSupplier` ASC),
  CONSTRAINT `idSupplierForFlights`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `idRoom` INT NOT NULL AUTO_INCREMENT,
  `idSupplier` INT NOT NULL,
  `roomType` VARCHAR(45) NOT NULL,
  `roomDate` DATE NOT NULL,
  `price` DECIMAL(45) NOT NULL,
  `ifAvailable` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idRoom`),
  INDEX `idSupplierForRoom_idx` (`idSupplier` ASC),
  CONSTRAINT `idSupplierForRoom`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `idUserForAdmin_idx` (`idUser` ASC),
  CONSTRAINT `idUserForAdmin`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Guider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Guider` (
  `idGuider` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `currentState` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGuider`),
  INDEX `idUserForGuider_idx` (`idUser` ASC),
  CONSTRAINT `idUserForGuider`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `idUserForCustomer_idx` (`idUser` ASC),
  CONSTRAINT `idUserForCustomer`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TravelProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TravelProduct` (
  `idTravelProduct` INT NOT NULL AUTO_INCREMENT,
  `idFlight` INT NOT NULL,
  `idRoom` INT NOT NULL,
  `idGuider` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `platformProfit` DECIMAL(45) NOT NULL,
  PRIMARY KEY (`idTravelProduct`),
  INDEX `idFlightForTravelProduct_idx` (`idFlight` ASC),
  INDEX `idRoomForTravelProduct_idx` (`idRoom` ASC),
  INDEX `idGuiderForTravelProduct_idx` (`idGuider` ASC),
  CONSTRAINT `idFlightForTravelProduct`
    FOREIGN KEY (`idFlight`)
    REFERENCES `mydb`.`Flight` (`idFlight`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idRoomForTravelProduct`
    FOREIGN KEY (`idRoom`)
    REFERENCES `mydb`.`Room` (`idRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGuiderForTravelProduct`
    FOREIGN KEY (`idGuider`)
    REFERENCES `mydb`.`Guider` (`idGuider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `idCustomer` INT NOT NULL,
  `idTravelProduct` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idCustomerForOrder_idx` (`idCustomer` ASC),
  INDEX `idTravelProductFroOrder_idx` (`idTravelProduct` ASC),
  CONSTRAINT `idCustomerForOrder`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTravelProductFroOrder`
    FOREIGN KEY (`idTravelProduct`)
    REFERENCES `mydb`.`TravelProduct` (`idTravelProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
