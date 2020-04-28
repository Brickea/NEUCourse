CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_current_best_3_connections`(
IN iddevice int,
OUT num_available_connections int,
OUT connection_1 int,
OUT connection_2 int,
OUT connection_3 int
)
BEGIN
	-- Check the available connection number
	SELECT NumConnectionsAvailable INTO num_available_connections
	FROM device d 
	WHERE d.iddevice = iddevice;
    IF num_available_connections >=3
    THEN
		-- If the available connections >=3
        SELECT dc.idconnection INTO connection_1
        FROM deviceBeaconConnection dc
        WHERE dc.iddevice = iddevice and dc.beaconRankbyDist = 1;
        
        SELECT dc.idconnection INTO connection_2
        FROM deviceBeaconConnection dc
        WHERE dc.iddevice = iddevice and dc.beaconRankbyDist = 2;
        
        SELECT dc.idconnection INTO connection_3
        FROM deviceBeaconConnection dc
        WHERE dc.iddevice = iddevice and dc.beaconRankbyDist = 3;
        
        -- return the top 3 connections id
        SELECT num_available_connections,connection_1,connection_2,connection_3;
	ELSE
		-- If the available connections <c
        -- TODO: allow user to choose a default position as current position
        SELECT num_available_connections,connection_1,connection_2,connection_3; 
	END IF;
    
END