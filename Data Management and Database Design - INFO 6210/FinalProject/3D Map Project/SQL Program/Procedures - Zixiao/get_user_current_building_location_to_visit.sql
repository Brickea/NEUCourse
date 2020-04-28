CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_user_current_building_location_to_visit`(
	IN iddevice int
)
BEGIN
	-- Get all location to visit id for the current user's building
	DECLARE num_available_connections int DEFAULT 0;
    DECLARE connection_1 int DEFAULT -1;
    DECLARE current_building int DEFAULT -1;
    
    
    -- Check the device is connected with at least 3 beacons
    -- Check the available connection number
	SELECT NumConnectionsAvailable INTO num_available_connections
	FROM device d 
	WHERE d.iddevice = iddevice;
    IF num_available_connections >=3
    THEN
		-- If the available connections >=3
        -- Get one connection id
        SELECT dc.idconnection INTO connection_1
        FROM deviceBeaconConnection dc
        WHERE dc.iddevice = iddevice and dc.beaconRankbyDist = 1;
		-- ----------------------------------------------------------------------------
		-- Get current building id
        SELECT idbuilding INTO current_building 
        FROM
			(SELECT idfloorMap FROM beacons b
			INNER JOIN floorMapPoints fmp
			ON fmp.coordinatePoint = b.coordinatePoint
			WHERE b.idbeacon = 4) idfloor
		INNER JOIN floorMap fm
		ON fm.idfloorMap = idfloor.idfloorMap;
        -- ----------------------------------------------------------------------------
		SELECT idfloorMap,fp.building_name,idlocationToVisit,fp.coordinatePoint,name,description FROM
        -- Get current building floor points
			(SELECT idfloors.idfloorMap, fmp.coordinatePoint, idfloors.building_name FROM 
			-- Get current building floor id
				(SELECT fm.idfloorMap,b.name AS building_name FROM floorMap fm
				INNER JOIN building b
				ON b.idbuilding = fm.idbuilding
				WHERE fm.idbuilding = current_building) idfloors
			INNER JOIN floorMapPoints fmp
			ON fmp.idfloorMap = idfloors.idfloorMap) fp
        INNER JOIN locationToVisit ltv
        ON ltv.coordinatePoint = fp.coordinatePoint;
	ELSE
		-- If the available connections <c
        -- TODO: allow user to choose a default position as current position
        SELECT num_available_connections; 
	END IF;
    
    
    
END