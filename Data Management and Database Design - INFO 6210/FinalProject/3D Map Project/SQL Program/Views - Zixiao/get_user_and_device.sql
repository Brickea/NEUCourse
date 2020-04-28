CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `brickea_mac`@`%` 
    SQL SECURITY DEFINER
VIEW `mydb`.`get_user_and_device` AS
    SELECT 
        `c`.`idcustomer` AS `idcustomer`,
        `c`.`firstName` AS `firstName`,
        `c`.`lastName` AS `lastName`,
        `d`.`iddevice` AS `iddevice`,
        `d`.`deviceType` AS `deviceType`,
        `d`.`NumConnectionsAvailable` AS `NumConnectionsAvailable`,
        `c`.`isdisability` AS `isdisability`
    FROM
        (`mydb`.`customer` `c`
        JOIN `mydb`.`device` `d` ON ((`c`.`idcustomer` = `d`.`idcustomer`)))
    ORDER BY `c`.`idcustomer`