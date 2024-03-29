-- MySQL Script generated by MySQL Workbench
-- Wed Aug 23 15:01:09 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `nome` VARCHAR(40) NOT NULL,
  `cpf` VARCHAR(15) NULL,
  `endereço` VARCHAR(60) NULL,
  `telefone` INT(20) NULL,
  `email` VARCHAR(60) NULL,
  `pagamento` VARCHAR(20) NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `codProdutos` INT NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `categoria` VARCHAR(35) NULL,
  `numeracao` VARCHAR(10) NULL,
  `classificacao` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  PRIMARY KEY (`codProdutos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nf` (
  `num_nf` INT(30) NOT NULL,
  `nome_empresa` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `cliente` VARCHAR(70) NULL,
  `data_hora` DATETIME(10) NULL,
  `hora` VARCHAR(100) NULL,
  `valor` INT(30) NULL,
  PRIMARY KEY (`num_nf`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `descricao` VARCHAR(100) NOT NULL,
  `data` DATE NULL,
  `preco` INT(15) NULL,
  `prazo_entrega` VARCHAR(45) NULL,
  `quantidade` VARCHAR(45) NULL,
  `desconto` INT NULL,
  `local_entrega` VARCHAR(70) NULL,
  `Cliente_nome` VARCHAR(40) NOT NULL,
  `Nf_num_nf` INT(30) NOT NULL,
  `Produtos_codProdutos` INT NOT NULL,
  PRIMARY KEY (`descricao`, `Produtos_codProdutos`),
  INDEX `fk_pedidos_Cliente_idx` (`Cliente_nome` ASC) VISIBLE,
  INDEX `fk_pedidos_Nf1_idx` (`Nf_num_nf` ASC) VISIBLE,
  INDEX `fk_pedidos_Produtos1_idx` (`Produtos_codProdutos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_Cliente`
    FOREIGN KEY (`Cliente_nome`)
    REFERENCES `mydb`.`Cliente` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_Nf1`
    FOREIGN KEY (`Nf_num_nf`)
    REFERENCES `mydb`.`Nf` (`num_nf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_Produtos1`
    FOREIGN KEY (`Produtos_codProdutos`)
    REFERENCES `mydb`.`Produtos` (`codProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
