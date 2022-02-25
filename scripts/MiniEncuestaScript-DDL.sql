SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE DATABASE IF NOT EXISTS me_encuesta_db CHARACTER SET latin1 COLLATE latin1_swedish_ci;

USE me_encuesta_db;

-- -----------------------------------------------------
-- Table `me_encuesta_tema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `me_encuesta_tema` ;

CREATE  TABLE IF NOT EXISTS `me_encuesta_tema` (
  `ente_codigo` VARCHAR(10) NOT NULL ,
  `ente_tema` VARCHAR(100) NOT NULL ,
  `ente_detalles` VARCHAR(500) NULL ,
  `ente_estado` CHAR(1) NOT NULL ,
  PRIMARY KEY (`ente_codigo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `me_encuesta_alternativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `me_encuesta_alternativa` ;

CREATE  TABLE IF NOT EXISTS `me_encuesta_alternativa` (
  `enalt_id` INT NOT NULL AUTO_INCREMENT ,
  `ente_codigo` VARCHAR(10) NOT NULL ,
  `enalt_opcion` VARCHAR(200) NOT NULL ,
  `enalt_estado` CHAR(1) NOT NULL ,
  PRIMARY KEY (`enalt_id`) ,
  INDEX `fk_me_encuesta_alternativa_me_encuesta_tema1` (`ente_codigo` ASC) ,
  CONSTRAINT `fk_me_encuesta_alternativa_me_encuesta_tema1`
    FOREIGN KEY (`ente_codigo` )
    REFERENCES `me_encuesta_tema` (`ente_codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `me_encuesta_persona_respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `me_encuesta_persona_respuesta` ;

CREATE  TABLE IF NOT EXISTS `me_encuesta_persona_respuesta` (
  `enper_encuesta_persona_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `enper_apellido_paterno` VARCHAR(45) NOT NULL ,
  `enper_apellido_materno` VARCHAR(45) NOT NULL ,
  `enper_apellido_nombres` VARCHAR(45) NOT NULL ,
  `enper_nombrecompleto` VARCHAR(150) NULL ,
  `enper_edad` INT NOT NULL ,
  `enper_sexo` CHAR(1) NOT NULL ,
  `enper_profesion` VARCHAR(100) NULL ,
  `enper_lugar_trabajo` VARCHAR(100) NULL ,
  `enper_codigo_usuario` VARCHAR(100) NULL ,
  `enper_email` VARCHAR(100) NULL ,
  `enper_fecha_registro` DATETIME NULL ,
  `enalt_id` INT NOT NULL ,
  `enper_estado` CHAR(1) NOT NULL ,
  PRIMARY KEY (`enper_encuesta_persona_id`) ,
  INDEX `fk_me_encuesta_persona_respuesta_me_encuesta_alternativa1` (`enalt_id` ASC) ,
  CONSTRAINT `fk_me_encuesta_persona_respuesta_me_encuesta_alternativa1`
    FOREIGN KEY (`enalt_id` )
    REFERENCES `me_encuesta_alternativa` (`enalt_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
