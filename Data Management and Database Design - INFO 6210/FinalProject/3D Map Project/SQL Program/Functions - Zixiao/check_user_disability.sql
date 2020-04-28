CREATE DEFINER=`brickea_mac`@`%` FUNCTION `check_user_disability`(
	iddevice int
) RETURNS tinyint(1)
BEGIN
	DECLARE is_owner_disability BOOLEAN;
	-- Find the idcustomer of particular iddevice
    SELECT c.isdisability INTO is_owner_disability FROM customer c
    INNER JOIN device d
    ON d.idcustomer = c.idcustomer
    WHERE d.iddevice = iddevice;
    
    SELECT is_owner_disability INTO @result;
    RETURN @result;
END