-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quotes_dash2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quotes_dash2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quotes_dash2` DEFAULT CHARACTER SET utf8 ;
USE `quotes_dash2` ;

-- -----------------------------------------------------
-- Table `quotes_dash2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotes_dash2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quotes_dash2`.`quotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotes_dash2`.`quotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(255) NULL,
  `quote_content` TEXT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quotes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_quotes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `quotes_dash2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quotes_dash2`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotes_dash2`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  `quote_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_quotes1_idx` (`quote_id` ASC) VISIBLE,
  INDEX `fk_likes_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_quotes1`
    FOREIGN KEY (`quote_id`)
    REFERENCES `quotes_dash2`.`quotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quotes_dash2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
