-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Habitantes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Habitantes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Habitantes` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `Habitantes` ;

-- -----------------------------------------------------
-- Table `Habitantes`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Habitantes`.`municipios` (
  `código` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Habitantes`.`viviendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Habitantes`.`viviendas` (
  `código` INT NOT NULL,
  `dirección` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `metros` DECIMAL NOT NULL,
  `código_municipio` INT NOT NULL,
  PRIMARY KEY (`código`),
  INDEX `fk_vivienda_municipios1_idx` (`código_municipio` ASC) VISIBLE,
  CONSTRAINT `fk_vivienda_municipios1`
    FOREIGN KEY (`código_municipio`)
    REFERENCES `Habitantes`.`municipios` (`código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Habitantes`.`habitantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Habitantes`.`habitantes` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `teléfono` INT NOT NULL,
  `código_vivienda` INT NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `fk_habitantes_vivienda1_idx` (`código_vivienda` ASC) VISIBLE,
  CONSTRAINT `fk_habitantes_vivienda1`
    FOREIGN KEY (`código_vivienda`)
    REFERENCES `Habitantes`.`viviendas` (`código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Habitantes`.`depender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Habitantes`.`depender` (
  `dni_cabeza_familia` INT NOT NULL,
  `dni_dependiente` INT NOT NULL,
  PRIMARY KEY (`dni_dependiente`),
  INDEX `fk_habitantes_has_habitantes_habitantes1_idx` (`dni_dependiente` ASC) VISIBLE,
  INDEX `fk_habitantes_has_habitantes_habitantes_idx` (`dni_cabeza_familia` ASC) VISIBLE,
  CONSTRAINT `fk_habitantes_has_habitantes_habitantes`
    FOREIGN KEY (`dni_cabeza_familia`)
    REFERENCES `Habitantes`.`habitantes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitantes_has_habitantes_habitantes1`
    FOREIGN KEY (`dni_dependiente`)
    REFERENCES `Habitantes`.`habitantes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Habitantes`.`poseer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Habitantes`.`poseer` (
  `código_vivienda` INT NOT NULL,
  `dni_habitante` INT NOT NULL,
  PRIMARY KEY (`código_vivienda`, `dni_habitante`),
  INDEX `fk_vivienda_has_habitantes_habitantes1_idx` (`dni_habitante` ASC) VISIBLE,
  INDEX `fk_vivienda_has_habitantes_vivienda1_idx` (`código_vivienda` ASC) VISIBLE,
  CONSTRAINT `fk_vivienda_has_habitantes_vivienda1`
    FOREIGN KEY (`código_vivienda`)
    REFERENCES `Habitantes`.`viviendas` (`código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vivienda_has_habitantes_habitantes1`
    FOREIGN KEY (`dni_habitante`)
    REFERENCES `Habitantes`.`habitantes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
