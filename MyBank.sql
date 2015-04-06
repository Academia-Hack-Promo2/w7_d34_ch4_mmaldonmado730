SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MyBank_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `MyBank_development` ;

-- -----------------------------------------------------
-- Table `MyBank_development`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBank_development`.`customers` ;

CREATE TABLE IF NOT EXISTS `MyBank_development`.`customers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ci` INT(11) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `telefono` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `MyBank_development`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBank_development`.`accounts` ;

CREATE TABLE IF NOT EXISTS `MyBank_development`.`accounts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `index_accounts_on_customer_id` (`customer_id` ASC),
  CONSTRAINT `fk_rails_990d303a5d`
    FOREIGN KEY (`customer_id`)
    REFERENCES `MyBank_development`.`customers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `MyBank_development`.`operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MyBank_development`.`operations` ;

CREATE TABLE IF NOT EXISTS `MyBank_development`.`operations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type_op` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `monto` INT(11) NULL DEFAULT NULL,
  `origin_account` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `target_account` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `account_id` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `index_operations_on_account_id` (`account_id` ASC),
  INDEX `index_operations_on_origin_account` (`origin_account` ASC),
  INDEX `index_operations_on_target_account` (`target_account` ASC),
  CONSTRAINT `fk_rails_aa42af9ac6`
    FOREIGN KEY (`account_id`)
    REFERENCES `MyBank_development`.`accounts` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
