CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_customer_information`(
	IN iddevice int
)
BEGIN
	-- This will get the owner infromation of particular device
    SELECT * FROM get_user_and_device v
    WHERE v.iddevice = iddevice;
END