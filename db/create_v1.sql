-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema uzshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema вбшоп
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `uzshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `uzshop` ;

-- -----------------------------------------------------
-- Table `uzshop`.`naimenovania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`naimenovania` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naimenovanie tovara` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status zakaza` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`пункты выдачи_import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`пункты выдачи_import` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `indeks` INT NOT NULL,
  `gorod` VARCHAR(250) NOT NULL,
  `gorod_name` VARCHAR(250) NOT NULL,
  `ulica` VARCHAR(250) NOT NULL,
  `ulica_name` VARCHAR(250) NOT NULL,
  `dom` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nomer_zakaza` INT NOT NULL,
  `data_zakaza` VARCHAR(250) NOT NULL,
  `data_dostavki` VARCHAR(250) NOT NULL,
  `adres_pvz` INT NOT NULL,
  `familiya` VARCHAR(250) NOT NULL,
  `imya` VARCHAR(250) NOT NULL,
  `otchestvo` VARCHAR(250) NOT NULL,
  `kod_polucheniya` INT NOT NULL,
  `status_zakaza` INT NOT NULL,
  `orderscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `sdfghjfedrxcghcfhtdrgcftdrg_idx` (`status_zakaza` ASC) VISIBLE,
  INDEX `vcbchvfgchfhf_idx` (`adres_pvz` ASC) VISIBLE,
  CONSTRAINT `sdfghjfedrxcghcfhtdrgcftdrg`
    FOREIGN KEY (`status_zakaza`)
    REFERENCES `uzshop`.`status` (`id`),
  CONSTRAINT `vcbchvfgchfhf`
    FOREIGN KEY (`adres_pvz`)
    REFERENCES `uzshop`.`пункты выдачи_import` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`proizvoditel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`proizvoditel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proizvoditel` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artikul` VARCHAR(250) NOT NULL,
  `name_tovara` VARCHAR(250) NOT NULL,
  `edenica_izmereniya` VARCHAR(250) NOT NULL,
  `cena` INT NOT NULL,
  `postavshik` INT NOT NULL,
  `proizvoditel` INT NOT NULL,
  `kategoriya_tovara` VARCHAR(250) NOT NULL,
  `skidka` INT NOT NULL,
  `kolichestvo_na_sklade` INT NOT NULL,
  `opisanie_tovara` VARCHAR(250) NULL DEFAULT NULL,
  `photo` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `tgbtgrfcfe4rcxx_idx` (`postavshik` ASC) VISIBLE,
  INDEX `sfdsfsfse_idx` (`proizvoditel` ASC) VISIBLE,
  CONSTRAINT `sfdsfsfse`
    FOREIGN KEY (`proizvoditel`)
    REFERENCES `uzshop`.`proizvoditel` (`id`),
  CONSTRAINT `tgbtgrfcfe4rcxx`
    FOREIGN KEY (`postavshik`)
    REFERENCES `uzshop`.`postavshik` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`postavshik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`postavshik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postavshik` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fghfghfghfhg`
    FOREIGN KEY (`id`)
    REFERENCES `uzshop`.`product` (`postavshik`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`заказ_import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`заказ_import` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nomer_zakaza` INT NOT NULL,
  `artikul_zakaza` VARCHAR(250) NOT NULL,
  `data_zakaza` VARCHAR(250) NOT NULL,
  `data_dostavki` VARCHAR(250) NOT NULL,
  `adres_pvz` INT NOT NULL,
  `familiya` VARCHAR(250) NOT NULL,
  `imya` VARCHAR(250) NOT NULL,
  `otchestvo` VARCHAR(250) NOT NULL,
  `kod_polucheniya` INT NOT NULL,
  `status_zakaza` INT NOT NULL,
  `MyUnknownColumn` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `dadadawda_idx` (`status_zakaza` ASC) VISIBLE,
  INDEX `6hyhbtgcedxwxwsx_idx` (`adres_pvz` ASC) VISIBLE,
  CONSTRAINT `6hyhbtgcedxwxwsx`
    FOREIGN KEY (`adres_pvz`)
    REFERENCES `uzshop`.`пункты выдачи_import` (`id`),
  CONSTRAINT `dadadawda`
    FOREIGN KEY (`status_zakaza`)
    REFERENCES `uzshop`.`status` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`prodorders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`prodorders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `qty` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `dfgdfgdfgdfgd_idx` (`product_id` ASC) VISIBLE,
  INDEX `fdsfsdfse_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `dfgdfgdfgdfgd`
    FOREIGN KEY (`product_id`)
    REFERENCES `uzshop`.`product` (`id`),
  CONSTRAINT `fdsfsdfse`
    FOREIGN KEY (`order_id`)
    REFERENCES `uzshop`.`заказ_import` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`tovar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`tovar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categories` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uzshop`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uzshop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` INT NOT NULL,
  `familiya` VARCHAR(250) NOT NULL,
  `imya` VARCHAR(250) NOT NULL,
  `otchestvo` VARCHAR(250) NOT NULL,
  `login` VARCHAR(250) NOT NULL,
  `password` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tgvrfcxed_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `tgvrfcxed`
    FOREIGN KEY (`role`)
    REFERENCES `uzshop`.`role` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
