CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `brickea_mac`@`%` 
    SQL SECURITY DEFINER
VIEW `mydb`.`view_buildings` AS
    SELECT 
        `mydb`.`building`.`idbuilding` AS `idbuilding`,
        `mydb`.`building`.`name` AS `name`,
        `mydb`.`building`.`address` AS `address`,
        `mydb`.`building`.`description` AS `description`
    FROM
        `mydb`.`building`