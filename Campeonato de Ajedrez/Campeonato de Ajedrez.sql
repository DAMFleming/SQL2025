-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ajedrez
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ajedrez
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ajedrez` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `Ajedrez` ;

-- -----------------------------------------------------
-- Table `Ajedrez`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`paises` (
  `número` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `numClubes` INT NOT NULL,
  PRIMARY KEY (`número`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`participantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`participantes` (
  `numAsociado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dirección` VARCHAR(45) NOT NULL,
  `teléfono` INT NULL,
  `campeonatosJugador` INT NOT NULL,
  `campeonatosArbitro` INT NOT NULL,
  `numPaís` INT NOT NULL,
  PRIMARY KEY (`numAsociado`),
  INDEX `fk_participantes_paises_idx` (`numPaís` ASC) VISIBLE,
  CONSTRAINT `fk_participantes_paises`
    FOREIGN KEY (`numPaís`)
    REFERENCES `Ajedrez`.`paises` (`número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `Ajedrez`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`jugadores` (
  `numAsociado` INT NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`numAsociado`),
  CONSTRAINT `fk_jugadores_participantes`
    FOREIGN KEY (`numAsociado`)
    REFERENCES `Ajedrez`.`participantes` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`árbitros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`árbitros` (
  `numAsociado` INT NOT NULL,
  PRIMARY KEY (`numAsociado`),
  CONSTRAINT `fk_árbitros_participantes`
    FOREIGN KEY (`numAsociado`)
    REFERENCES `Ajedrez`.`participantes` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`hoteles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`hoteles` (
  `nombre` VARCHAR(45) NOT NULL,
  `dirección` VARCHAR(45) NOT NULL,
  `teléfono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`salas` (
  `nombreHotel` VARCHAR(45) NOT NULL,
  `nombreSala` VARCHAR(45) NOT NULL,
  `capacidad` INT NOT NULL,
  PRIMARY KEY (`nombreHotel`, `nombreSala`),
  INDEX `fk_salas_hoteles1_idx` (`nombreHotel` ASC) VISIBLE,
  CONSTRAINT `fk_salas_hoteles`
    FOREIGN KEY (`nombreHotel`)
    REFERENCES `Ajedrez`.`hoteles` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`partidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`partidas` (
  `número` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `blancas` INT NOT NULL,
  `negras` INT NOT NULL,
  `árbitro` INT NOT NULL,
  `nombreHotel` VARCHAR(45) NOT NULL,
  `nombreSala` VARCHAR(45) NOT NULL,
  `entradas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`número`),
  INDEX `fk_partidas_jugadores1_idx` (`blancas` ASC) VISIBLE,
  INDEX `fk_partidas_árbitros1_idx` (`árbitro` ASC) VISIBLE,
  INDEX `fk_partidas_jugadores2_idx` (`negras` ASC) VISIBLE,
  INDEX `fk_partidas_salas1_idx` (`nombreHotel` ASC, `nombreSala` ASC) VISIBLE,
  CONSTRAINT `fk_partidas_jugadoresblancas`
    FOREIGN KEY (`blancas`)
    REFERENCES `Ajedrez`.`jugadores` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partidas_árbitros`
    FOREIGN KEY (`árbitro`)
    REFERENCES `Ajedrez`.`árbitros` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partidas_jugadoresnegras`
    FOREIGN KEY (`negras`)
    REFERENCES `Ajedrez`.`jugadores` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partidas_salas`
    FOREIGN KEY (`nombreHotel` , `nombreSala`)
    REFERENCES `Ajedrez`.`salas` (`nombreHotel` , `nombreSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`movimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`movimientos` (
  `numPartida` INT NOT NULL,
  `numMovimiento` INT NOT NULL,
  `jugada` VARCHAR(45) NOT NULL,
  `comentario` LONGTEXT NULL,
  PRIMARY KEY (`numPartida`, `numMovimiento`),
  INDEX `fk_movimientos_partidas1_idx` (`numPartida` ASC) VISIBLE,
  CONSTRAINT `fk_movimientos_partidas`
    FOREIGN KEY (`numPartida`)
    REFERENCES `Ajedrez`.`partidas` (`número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`alojar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`alojar` (
  `numAsociado` INT NOT NULL,
  `nombreHotel` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`numAsociado`, `nombreHotel`, `fecha`),
  INDEX `fk_participantes_has_hoteles_hoteles1_idx` (`nombreHotel` ASC) VISIBLE,
  INDEX `fk_participantes_has_hoteles_participantes1_idx` (`numAsociado` ASC) VISIBLE,
  CONSTRAINT `fk_alojar_participantes`
    FOREIGN KEY (`numAsociado`)
    REFERENCES `Ajedrez`.`participantes` (`numAsociado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alojar_hoteles`
    FOREIGN KEY (`nombreHotel`)
    REFERENCES `Ajedrez`.`hoteles` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`medios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`medios` (
  `código` INT NOT NULL,
  `descripción` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ajedrez`.`equipar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ajedrez`.`equipar` (
  `nombreHotel` VARCHAR(45) NOT NULL,
  `nombreSala` VARCHAR(45) NOT NULL,
  `códigoMedio` INT NOT NULL,
  PRIMARY KEY (`nombreHotel`, `nombreSala`, `códigoMedio`),
  INDEX `fk_salas_has_medios_medios1_idx` (`códigoMedio` ASC) VISIBLE,
  INDEX `fk_salas_has_medios_salas1_idx` (`nombreHotel` ASC, `nombreSala` ASC) VISIBLE,
  CONSTRAINT `fk_equipar_salas`
    FOREIGN KEY (`nombreHotel` , `nombreSala`)
    REFERENCES `Ajedrez`.`salas` (`nombreHotel` , `nombreSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipar_medios`
    FOREIGN KEY (`códigoMedio`)
    REFERENCES `Ajedrez`.`medios` (`código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
