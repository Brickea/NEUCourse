CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `generate_navigation_request`(
	IN iddevice int,
    IN idlocationToVisit int,
    IN ifcomplete boolean,
    IN ismultifloorNavigation boolean,
    IN strategy varchar(45),
    IN recommendation varchar(45)
)
BEGIN
	DECLARE navigationid int DEFAULT -1;
    -- Generate the navigation request for a particular device
    SELECT idnavigationRequest INTO navigationid 
    FROM navigationRequest n
    WHERE n.iddevice = iddevice;
    
	-- Check if the table have the navigation for this device
    IF navigationid = -1 
    THEN
		-- The table doesn't have navigation for this device
        INSERT INTO navigationRequest(iddevice,idlocationToVisit,ifcomplete,ismultifloorNavigation,strategy, recommendation) 
		VALUES(iddevice,idlocationToVisit,ifcomplete,ismultifloorNavigation,strategy,recommendation);
	ELSE 
		-- The table have navigation id for this device
        SET FOREIGN_KEY_CHECKS = 0;
        REPLACE INTO navigationRequest(idnavigationRequest,iddevice,idlocationToVisit,ifcomplete,ismultifloorNavigation,strategy, recommendation) 
		VALUES(navigationid,iddevice,idlocationToVisit,ifcomplete,ismultifloorNavigation,strategy,recommendation);
        SET FOREIGN_KEY_CHECKS = 1;
	END IF;
    
    SELECT navigationid;
END