-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema insidescoop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `insidescoop` ;

-- -----------------------------------------------------
-- Schema insidescoop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `insidescoop` DEFAULT CHARACTER SET utf8 ;
USE `insidescoop` ;

-- -----------------------------------------------------
-- Table `work_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `work_role` ;

CREATE TABLE IF NOT EXISTS `work_role` (
  `1` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `admin` TINYINT NULL,
  `active` TINYINT NULL,
  `email` VARCHAR(50) NULL,
  `user_category` INT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL,
  `work_role_1` INT NULL,
  `company_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_work_role1_idx` (`work_role_1` ASC),
  INDEX `fk_user_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_user_work_role1`
    FOREIGN KEY (`work_role_1`)
    REFERENCES `work_role` (`1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `text` TEXT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id1` INT NOT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user1_idx` (`user_id1` ASC),
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`user_id1`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vote` ;

CREATE TABLE IF NOT EXISTS `vote` (
  `id` INT NOT NULL,
  `value` ENUM('up', 'down') NULL,
  `user_id` INT NOT NULL,
  `message_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_vote_user1_idx` (`user_id` ASC),
  INDEX `fk_vote_message1_idx` (`message_id` ASC),
  CONSTRAINT `fk_vote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question` ;

CREATE TABLE IF NOT EXISTS `question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` TEXT NULL,
  `vote_id` INT NOT NULL,
  `vote_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_vote1_idx` (`vote_id` ASC, `vote_user_id` ASC),
  CONSTRAINT `fk_question_vote1`
    FOREIGN KEY (`vote_id` , `vote_user_id`)
    REFERENCES `vote` (`id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_category` ;

CREATE TABLE IF NOT EXISTS `user_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic` ;

CREATE TABLE IF NOT EXISTS `topic` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question_has_category` ;

CREATE TABLE IF NOT EXISTS `question_has_category` (
  `question_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`question_id`, `category_id`),
  INDEX `fk_question_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_question_has_category_question_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_has_category_question`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_has_topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_has_topic` ;

CREATE TABLE IF NOT EXISTS `category_has_topic` (
  `category_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `topic_id`),
  INDEX `fk_category_has_topic_topic1_idx` (`topic_id` ASC),
  INDEX `fk_category_has_topic_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_topic_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_topic_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message_has_category` ;

CREATE TABLE IF NOT EXISTS `message_has_category` (
  `message_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`message_id`, `category_id`),
  INDEX `fk_message_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_message_has_category_message1_idx` (`message_id` ASC),
  CONSTRAINT `fk_message_has_category_message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_has_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_has_question` ;

CREATE TABLE IF NOT EXISTS `company_has_question` (
  `company_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`company_id`, `question_id`),
  INDEX `fk_company_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_company_has_question_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_company_has_question_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_role_has_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `work_role_has_question` ;

CREATE TABLE IF NOT EXISTS `work_role_has_question` (
  `work_role_1` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`work_role_1`, `question_id`),
  INDEX `fk_work_role_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_work_role_has_question_work_role1_idx` (`work_role_1` ASC),
  CONSTRAINT `fk_work_role_has_question_work_role1`
    FOREIGN KEY (`work_role_1`)
    REFERENCES `work_role` (`1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_role_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alternative`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative` ;

CREATE TABLE IF NOT EXISTS `alternative` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` TEXT NULL,
  `question_id` INT NOT NULL,
  `is_key` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_answer_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attempt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attempt` ;

CREATE TABLE IF NOT EXISTS `attempt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_attempt_user1_idx` (`user_id` ASC),
  INDEX `fk_attempt_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_attempt_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attempt_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alternative_has_attempt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative_has_attempt` ;

CREATE TABLE IF NOT EXISTS `alternative_has_attempt` (
  `alternative_id` INT NOT NULL,
  `attempt_id` INT NOT NULL,
  PRIMARY KEY (`alternative_id`, `attempt_id`),
  INDEX `fk_alternative_has_attempt_attempt1_idx` (`attempt_id` ASC),
  INDEX `fk_alternative_has_attempt_alternative1_idx` (`alternative_id` ASC),
  CONSTRAINT `fk_alternative_has_attempt_alternative1`
    FOREIGN KEY (`alternative_id`)
    REFERENCES `alternative` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alternative_has_attempt_attempt1`
    FOREIGN KEY (`attempt_id`)
    REFERENCES `attempt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interview` ;

CREATE TABLE IF NOT EXISTS `interview` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `work_role_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_interview_user1_idx` (`user_id` ASC),
  INDEX `fk_interview_company1_idx` (`company_id` ASC),
  INDEX `fk_interview_work_role1_idx` (`work_role_1` ASC),
  CONSTRAINT `fk_interview_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interview_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interview_work_role1`
    FOREIGN KEY (`work_role_1`)
    REFERENCES `work_role` (`1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_has_interview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_has_interview` ;

CREATE TABLE IF NOT EXISTS `category_has_interview` (
  `category_id` INT NOT NULL,
  `interview_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `interview_id`),
  INDEX `fk_category_has_interview_interview1_idx` (`interview_id` ASC),
  INDEX `fk_category_has_interview_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_interview_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_interview_interview1`
    FOREIGN KEY (`interview_id`)
    REFERENCES `interview` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interview_has_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interview_has_question` ;

CREATE TABLE IF NOT EXISTS `interview_has_question` (
  `interview_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`interview_id`, `question_id`),
  INDEX `fk_interview_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_interview_has_question_interview1_idx` (`interview_id` ASC),
  CONSTRAINT `fk_interview_has_question_interview1`
    FOREIGN KEY (`interview_id`)
    REFERENCES `interview` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interview_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS scooper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'scooper'@'localhost' IDENTIFIED BY 'scoop';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'scooper'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `admin`, `active`, `email`, `user_category`, `create_date`, `last_update`, `username`, `password`, `work_role_1`, `company_id`) VALUES (1, 'Testy', 'Testaburn', true, true, 'testy@testeroni.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `user_category` (`id`, `category`) VALUES (1, 'student');
INSERT INTO `user_category` (`id`, `category`) VALUES (2, 'alumnus');
INSERT INTO `user_category` (`id`, `category`) VALUES (3, 'instructor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'sql');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'java');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'jpa');

COMMIT;

