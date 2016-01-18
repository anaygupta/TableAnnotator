-- MySQL Script generated by MySQL Workbench
-- 01/15/16 15:36:27
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema table_db_drugs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `table_db_drugs` ;
CREATE SCHEMA IF NOT EXISTS `table_db_drugs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `table_db_drugs` ;

-- -----------------------------------------------------
-- Table `table_db_drugs`.`Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Article` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Article` (
  `idArticle` INT NOT NULL AUTO_INCREMENT,
  `PMCID` VARCHAR(50) NULL,
  `PMID` VARCHAR(45) NULL,
  `pissn` VARCHAR(45) NULL,
  `eissn` VARCHAR(45) NULL,
  `Title` VARCHAR(500) NULL,
  `Abstract` VARCHAR(3000) NULL,
  `JournalName` VARCHAR(145) NULL,
  `JournalPublisherName` VARCHAR(245) NULL,
  `JournalPublisherLocation` VARCHAR(200) NULL,
  `Source` VARCHAR(100) NULL,
  `SpecId` VARCHAR(120) NULL,
  PRIMARY KEY (`idArticle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Author` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Author` (
  `idAuthor` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(100) NULL,
  `Article_idArticle` INT NOT NULL,
  PRIMARY KEY (`idAuthor`),
  INDEX `fk_Author_Article1_idx` (`Article_idArticle` ASC),
  CONSTRAINT `fk_Author_Article1`
    FOREIGN KEY (`Article_idArticle`)
    REFERENCES `table_db_drugs`.`Article` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`ArtTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`ArtTable` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`ArtTable` (
  `idTable` INT NOT NULL AUTO_INCREMENT,
  `TableOrder` VARCHAR(145) NULL,
  `TableCaption` VARCHAR(545) NULL,
  `TableFooter` VARCHAR(1445) NULL,
  `StructureType` VARCHAR(45) NULL,
  `PragmaticType` VARCHAR(45) NULL,
  `HasXML` VARCHAR(40) NULL,
  `Article_idArticle` INT NOT NULL,
  `Section` VARCHAR(245) NULL,
  PRIMARY KEY (`idTable`),
  INDEX `fk_Table_Article1_idx` (`Article_idArticle` ASC),
  CONSTRAINT `fk_Table_Article1`
    FOREIGN KEY (`Article_idArticle`)
    REFERENCES `table_db_drugs`.`Article` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`Cell`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Cell` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Cell` (
  `idCell` INT NOT NULL AUTO_INCREMENT,
  `CellID` VARCHAR(45) NULL,
  `CellType` VARCHAR(45) NULL,
  `Table_idTable` INT NOT NULL,
  `RowN` INT NULL,
  `ColumnN` INT NULL,
  `HeaderRef` VARCHAR(45) NULL,
  `StubRef` VARCHAR(45) NULL,
  `SuperRowRef` VARCHAR(45) NULL,
  `Content` VARCHAR(545) NULL,
  `WholeHeader` VARCHAR(645) NULL,
  `WholeStub` VARCHAR(655) NULL,
  `WholeSuperRow` VARCHAR(645) NULL,
  PRIMARY KEY (`idCell`),
  INDEX `fk_Cell_Table1_idx` (`Table_idTable` ASC),
  CONSTRAINT `fk_Cell_Table1`
    FOREIGN KEY (`Table_idTable`)
    REFERENCES `table_db_drugs`.`ArtTable` (`idTable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`CellRole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`CellRole` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`CellRole` (
  `idCellRole` INT NOT NULL AUTO_INCREMENT,
  `CellRoleName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCellRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`CellRoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`CellRoles` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`CellRoles` (
  `idCellRoles` INT NOT NULL AUTO_INCREMENT,
  `CellRole_idCellRole` INT NOT NULL,
  `Cell_idCell` INT NOT NULL,
  PRIMARY KEY (`idCellRoles`),
  INDEX `fk_CellRoles_CellRole1_idx` (`CellRole_idCellRole` ASC),
  INDEX `fk_CellRoles_Cell1_idx` (`Cell_idCell` ASC),
  CONSTRAINT `fk_CellRoles_CellRole1`
    FOREIGN KEY (`CellRole_idCellRole`)
    REFERENCES `table_db_drugs`.`CellRole` (`idCellRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CellRoles_Cell1`
    FOREIGN KEY (`Cell_idCell`)
    REFERENCES `table_db_drugs`.`Cell` (`idCell`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`Annotation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Annotation` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Annotation` (
  `idAnnotation` INT NOT NULL AUTO_INCREMENT,
  `Content` VARCHAR(245) NULL,
  `Start` INT NULL,
  `End` INT NULL,
  `AnnotationID` VARCHAR(245) NULL,
  `AnnotationSchemaVersion` VARCHAR(245) NULL,
  `AnnotationDescription` VARCHAR(500) NULL,
  `AnnotationURL` VARCHAR(245) NULL,
  `AgentName` VARCHAR(345) NULL,
  `AgentType` VARCHAR(45) NULL,
  `EnvironmentDescription` VARCHAR(505) NULL,
  `DateOfAction` VARCHAR(100) NULL,
  `Location` VARCHAR(200) NULL,
  `Cell_idCell` INT NOT NULL,
  PRIMARY KEY (`idAnnotation`),
  INDEX `fk_Annotation_Cell1_idx` (`Cell_idCell` ASC),
  CONSTRAINT `fk_Annotation_Cell1`
    FOREIGN KEY (`Cell_idCell`)
    REFERENCES `table_db_drugs`.`Cell` (`idCell`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`Affiliation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Affiliation` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Affiliation` (
  `idAffiliation` INT NOT NULL AUTO_INCREMENT,
  `AffiliationName` VARCHAR(345) NULL,
  `Author_idAuthor` INT NOT NULL,
  PRIMARY KEY (`idAffiliation`),
  INDEX `fk_Affiliation_Author1_idx` (`Author_idAuthor` ASC),
  CONSTRAINT `fk_Affiliation_Author1`
    FOREIGN KEY (`Author_idAuthor`)
    REFERENCES `table_db_drugs`.`Author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`Email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`Email` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`Email` (
  `idEmail` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(245) NULL,
  `Author_idAuthor` INT NOT NULL,
  PRIMARY KEY (`idEmail`, `Author_idAuthor`),
  INDEX `fk_Email_Author1_idx` (`Author_idAuthor` ASC),
  CONSTRAINT `fk_Email_Author1`
    FOREIGN KEY (`Author_idAuthor`)
    REFERENCES `table_db_drugs`.`Author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table_db_drugs`.`OriginalArticle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `table_db_drugs`.`OriginalArticle` ;

CREATE TABLE IF NOT EXISTS `table_db_drugs`.`OriginalArticle` (
  `idOriginalArticle` INT NOT NULL AUTO_INCREMENT,
  `PMCID` VARCHAR(50) NULL,
  `PMID` VARCHAR(45) NULL,
  `pissn` VARCHAR(45) NULL,
  `eissn` VARCHAR(45) NULL,
  `xml` LONGTEXT NULL,
  `Article_idArticle` INT NOT NULL,
  PRIMARY KEY (`idOriginalArticle`),
  UNIQUE INDEX `idOriginalArticle_UNIQUE` (`idOriginalArticle` ASC),
  INDEX `fk_OriginalArticle_Article1_idx` (`Article_idArticle` ASC),
  CONSTRAINT `fk_OriginalArticle_Article1`
    FOREIGN KEY (`Article_idArticle`)
    REFERENCES `table_db_drugs`.`Article` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `table_db_drugs`.`CellRole`
-- -----------------------------------------------------
START TRANSACTION;
USE `table_db_drugs`;
INSERT INTO `table_db_drugs`.`CellRole` (`idCellRole`, `CellRoleName`) VALUES (1, 'Header');
INSERT INTO `table_db_drugs`.`CellRole` (`idCellRole`, `CellRoleName`) VALUES (2, 'Stub');
INSERT INTO `table_db_drugs`.`CellRole` (`idCellRole`, `CellRoleName`) VALUES (3, 'Data');
INSERT INTO `table_db_drugs`.`CellRole` (`idCellRole`, `CellRoleName`) VALUES (4, 'SuperRow');

COMMIT;
