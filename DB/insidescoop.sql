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
-- Table `question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question` ;

CREATE TABLE IF NOT EXISTS `question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `question_text` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `work_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `work_role` ;

CREATE TABLE IF NOT EXISTS `work_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(90) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NULL,
  `description` VARCHAR(2000) NULL,
  `site_url` VARCHAR(2000) NULL,
  `logo_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_category` ;

CREATE TABLE IF NOT EXISTS `user_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
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
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `work_role_id` INT NULL DEFAULT NULL,
  `company_id` INT NULL DEFAULT NULL,
  `profile_image_url` VARCHAR(2000) NULL,
  `user_category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_work_role1_idx` (`work_role_id` ASC),
  INDEX `fk_user_company1_idx` (`company_id` ASC),
  INDEX `fk_user_user_category1_idx` (`user_category_id` ASC),
  CONSTRAINT `fk_user_work_role1`
    FOREIGN KEY (`work_role_id`)
    REFERENCES `work_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_category1`
    FOREIGN KEY (`user_category_id`)
    REFERENCES `user_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
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
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL,
  `title` VARCHAR(90) NULL,
  `interview_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_has_category` ;

CREATE TABLE IF NOT EXISTS `post_has_category` (
  `message_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`message_id`, `category_id`),
  INDEX `fk_message_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_message_has_category_message1_idx` (`message_id` ASC),
  CONSTRAINT `fk_message_has_category_message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `post` (`id`)
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
    REFERENCES `work_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_role_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `option` ;

CREATE TABLE IF NOT EXISTS `option` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `option_text` TEXT NULL,
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
-- Table `option_has_attempt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `option_has_attempt` ;

CREATE TABLE IF NOT EXISTS `option_has_attempt` (
  `alternative_id` INT NOT NULL,
  `attempt_id` INT NOT NULL,
  PRIMARY KEY (`alternative_id`, `attempt_id`),
  INDEX `fk_alternative_has_attempt_attempt1_idx` (`attempt_id` ASC),
  INDEX `fk_alternative_has_attempt_alternative1_idx` (`alternative_id` ASC),
  CONSTRAINT `fk_alternative_has_attempt_alternative1`
    FOREIGN KEY (`alternative_id`)
    REFERENCES `option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alternative_has_attempt_attempt1`
    FOREIGN KEY (`attempt_id`)
    REFERENCES `attempt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_vote` ;

CREATE TABLE IF NOT EXISTS `post_vote` (
  `liked` TINYINT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `vote_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `post_id`),
  INDEX `fk_vote_user1_idx` (`user_id` ASC),
  INDEX `fk_vote_message1_idx` (`post_id` ASC),
  CONSTRAINT `fk_vote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_message1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_has_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_has_question` ;

CREATE TABLE IF NOT EXISTS `post_has_question` (
  `post_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `question_id`),
  INDEX `fk_post_has_question_question1_idx` (`question_id` ASC),
  INDEX `fk_post_has_question_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_question_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `question_vote` ;

CREATE TABLE IF NOT EXISTS `question_vote` (
  `question_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `liked` TINYINT NULL DEFAULT NULL,
  `vote_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`, `user_id`),
  INDEX `fk_question_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_question_has_user_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_has_user_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment_vote` ;

CREATE TABLE IF NOT EXISTS `comment_vote` (
  `comment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `liked` TINYINT NULL DEFAULT NULL,
  `vote_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`, `user_id`),
  INDEX `fk_comment_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_has_user_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_comment_has_user_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_has_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_has_company` ;

CREATE TABLE IF NOT EXISTS `post_has_company` (
  `post_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `company_id`),
  INDEX `fk_post_has_company_company1_idx` (`company_id` ASC),
  INDEX `fk_post_has_company_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_company_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_company_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_has_work_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_has_work_role` ;

CREATE TABLE IF NOT EXISTS `post_has_work_role` (
  `post_id` INT NOT NULL,
  `work_role_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `work_role_id`),
  INDEX `fk_post_has_work_role_work_role1_idx` (`work_role_id` ASC),
  INDEX `fk_post_has_work_role_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_work_role_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_work_role_work_role1`
    FOREIGN KEY (`work_role_id`)
    REFERENCES `work_role` (`id`)
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
-- Data for table `question`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `question` (`id`, `question_text`) VALUES (1, 'Why is a mouse when it spins?');

COMMIT;


-- -----------------------------------------------------
-- Data for table `work_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `work_role` (`id`, `role`, `description`) VALUES (1, 'database administrator', NULL);
INSERT INTO `work_role` (`id`, `role`, `description`) VALUES (2, 'junior developer', NULL);
INSERT INTO `work_role` (`id`, `role`, `description`) VALUES (3, 'tech guru', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `company` (`id`, `name`, `description`, `site_url`, `logo_url`) VALUES (1, 'Google', 'A place to work', 'google.com', NULL);
INSERT INTO `company` (`id`, `name`, `description`, `site_url`, `logo_url`) VALUES (2, 'Yahoo', 'A company that once was', 'yahoo.com', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `user_category` (`id`, `name`) VALUES (1, 'student');
INSERT INTO `user_category` (`id`, `name`) VALUES (2, 'alumnus');
INSERT INTO `user_category` (`id`, `name`) VALUES (3, 'instructor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `admin`, `active`, `email`, `create_date`, `last_update`, `username`, `password`, `work_role_id`, `company_id`, `profile_image_url`, `user_category_id`) VALUES (1, 'Testy', 'Testaburn', 1, 1, 'testy@testaburn.com', NULL, NULL, 'ttesta', 'testing', 1, 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'sql', 'Database language');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'java', 'OOP language');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'jpa', 'For translation database entities into Java POJOs');

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `topic` (`id`, `name`) VALUES (1, 'lambdas');
INSERT INTO `topic` (`id`, `name`) VALUES (2, 'for loops');
INSERT INTO `topic` (`id`, `name`) VALUES (3, 'data types');
INSERT INTO `topic` (`id`, `name`) VALUES (4, 'object-relational mapping');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_has_topic`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `category_has_topic` (`category_id`, `topic_id`) VALUES (2, 1);
INSERT INTO `category_has_topic` (`category_id`, `topic_id`) VALUES (2, 2);
INSERT INTO `category_has_topic` (`category_id`, `topic_id`) VALUES (2, 3);
INSERT INTO `category_has_topic` (`category_id`, `topic_id`) VALUES (3, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `post` (`id`, `content`, `create_date`, `last_update`, `user_id`, `active`, `title`, `interview_date`) VALUES (1, 'This is a post', NULL, NULL, 1, 1, 'The title of a post', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `post_vote` (`liked`, `user_id`, `post_id`, `vote_date`) VALUES (1, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `comment` (`id`, `content`, `user_id`, `post_id`, `date_created`, `last_updated`, `active`, `in_reply_to_id`) VALUES (1, 'This is a comment', 1, 1, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `question_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `question_vote` (`question_id`, `user_id`, `liked`, `vote_date`) VALUES (1, 1, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `comment_vote` (`comment_id`, `user_id`, `liked`, `vote_date`) VALUES (1, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_has_company`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `post_has_company` (`post_id`, `company_id`) VALUES (1, 1);
INSERT INTO `post_has_company` (`post_id`, `company_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_has_work_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `insidescoop`;
INSERT INTO `post_has_work_role` (`post_id`, `work_role_id`) VALUES (1, 1);

COMMIT;

