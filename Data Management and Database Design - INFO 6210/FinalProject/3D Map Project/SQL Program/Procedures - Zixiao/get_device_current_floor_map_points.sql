CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_device_current_floor_map_points`(
	IN iddevice int
)
BEGIN
	DECLARE connection_1 int DEFAULT -1;
    DECLARE num_available_connections int DEFAULT 0;
	-- Check the device is connected with at least 3 beacons
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
        
        -- ----------------------------------------------------------------------------
		-- Get all data point in the device floor
        SELECT * FROM
		-- Find the idfloor of connected beacon
		(SELECT idfloorMap FROM
			-- Find the coordinate point of the connected beacon
			(SELECT coordinatePoint FROM devicebeaconconnection db
			INNER JOIN beacons b
			ON connection_1 = db.idconnection and db.idbeacon = b.idbeacon)  c
		INNER JOIN floormappoints fmp
		ON fmp.coordinatePoint = c.coordinatePoint) f
		INNER JOIN floormappoints fmp
		ON fmp.idfloorMap = f.idfloorMap;
        -- ----------------------------------------------------------------------------
		
	ELSE
		-- If the available connections <c
        -- TODO: allow user to choose a default position as current position
        SELECT num_available_connections; 
	END IF;
END