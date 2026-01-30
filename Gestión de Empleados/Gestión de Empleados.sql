-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Gestión de Empleados
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Gestión de Empleados` ;

-- -----------------------------------------------------
-- Schema Gestión de Empleados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Gestión de Empleados` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `Gestión de Empleados` ;

-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`empleados` (
  `nss` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`nss`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`directores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`directores` (
  `nssDirector` INT NOT NULL,
  PRIMARY KEY (`nssDirector`),
  CONSTRAINT `fk_DIRECTORES_EMPLEADOS`
    FOREIGN KEY (`nssDirector`)
    REFERENCES `Gestión de Empleados`.`empleados` (`nss`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`departamentos` (
  `nombre` VARCHAR(45) NOT NULL,
  `localización` VARCHAR(45) NOT NULL,
  `director` INT NOT NULL,
  PRIMARY KEY (`nombre`),
  INDEX `FK_DIRECTOR` (`director` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTOS_DIRECTORES`
    FOREIGN KEY (`director`)
    REFERENCES `Gestión de Empleados`.`directores` (`nssDirector`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`ingenieros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`ingenieros` (
  `nssIngeniero` INT NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nssIngeniero`),
  INDEX `fk_INGENIEROS_DEPARTAMENTOS1_idx` (`departamento` ASC) VISIBLE,
  CONSTRAINT `fk_INGENIEROS_EMPLEADOS`
    FOREIGN KEY (`nssIngeniero`)
    REFERENCES `Gestión de Empleados`.`empleados` (`nss`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_INGENIEROS_DEPARTAMENTOS1`
    FOREIGN KEY (`departamento`)
    REFERENCES `Gestión de Empleados`.`departamentos` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`representantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`representantes` (
  `nssRepresentante` INT NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nssRepresentante`),
  INDEX `fk_REPRESENTANTES_DEPARTAMENTOS1_idx` (`departamento` ASC) VISIBLE,
  CONSTRAINT `fk_REPRESENTANTES_EMPLEADOS`
    FOREIGN KEY (`nssRepresentante`)
    REFERENCES `Gestión de Empleados`.`empleados` (`nss`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_REPRESENTANTES_DEPARTAMENTOS1`
    FOREIGN KEY (`departamento`)
    REFERENCES `Gestión de Empleados`.`departamentos` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`hijos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`hijos` (
  `empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`empleado`, `nombre`),
  CONSTRAINT `fk_HIJOS_EMPLEADOS`
    FOREIGN KEY (`empleado`)
    REFERENCES `Gestión de Empleados`.`empleados` (`nss`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`especialidades` (
  `ingeniero` INT NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ingeniero`, `especialidad`),
  CONSTRAINT `fk_ESPECIALIDADES_INGENIEROS`
    FOREIGN KEY (`ingeniero`)
    REFERENCES `Gestión de Empleados`.`ingenieros` (`nssIngeniero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`proyectos` (
  `código` INT NOT NULL,
  `fechaComienzo` DATE NULL,
  PRIMARY KEY (`código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`controlar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`controlar` (
  `proyecto` INT NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proyecto`, `departamento`),
  INDEX `FK_DEPARTAMENTO` (`departamento` ASC) VISIBLE,
  INDEX `FK_PROYECTO` (`proyecto` ASC) VISIBLE,
  CONSTRAINT `FK_CONTROLAR_PROYECTOS`
    FOREIGN KEY (`proyecto`)
    REFERENCES `Gestión de Empleados`.`proyectos` (`código`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK¨_CONTROLAR_DEPARTAMENTOS`
    FOREIGN KEY (`departamento`)
    REFERENCES `Gestión de Empleados`.`departamentos` (`nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`involucrar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`involucrar` (
  `proyecto` INT NOT NULL,
  `ingeniero` INT NOT NULL,
  PRIMARY KEY (`proyecto`, `ingeniero`),
  INDEX `FK_INGENIERO` (`ingeniero` ASC) VISIBLE,
  INDEX `FK_PROYECTO` (`proyecto` ASC) VISIBLE,
  CONSTRAINT `FK_INVOLUCRAR_PROYECTOS`
    FOREIGN KEY (`proyecto`)
    REFERENCES `Gestión de Empleados`.`proyectos` (`código`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_INVOLUCRAR_INGENIEROS`
    FOREIGN KEY (`ingeniero`)
    REFERENCES `Gestión de Empleados`.`ingenieros` (`nssIngeniero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gestión de Empleados`.`becar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestión de Empleados`.`becar` (
  `departamento` VARCHAR(45) NOT NULL,
  `empleado` INT NOT NULL,
  `hijo` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `importe` DECIMAL(10,2) NOT NULL,
  `estudios` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`departamento`, `empleado`, `hijo`, `fecha`),
  INDEX `FK_HIJO` (`empleado` ASC, `hijo` ASC) VISIBLE,
  INDEX `FK_DEPARTAMENTO` (`departamento` ASC) VISIBLE,
  CONSTRAINT `fk_BECAR_DEPARTAMENTOS`
    FOREIGN KEY (`departamento`)
    REFERENCES `Gestión de Empleados`.`departamentos` (`nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_BECAR_HIJOS`
    FOREIGN KEY (`empleado` , `hijo`)
    REFERENCES `Gestión de Empleados`.`hijos` (`empleado` , `nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
