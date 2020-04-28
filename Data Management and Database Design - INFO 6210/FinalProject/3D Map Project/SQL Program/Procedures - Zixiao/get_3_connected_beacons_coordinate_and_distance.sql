CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_3_connected_beacons_coordinate_and_distance`(
IN connection_1 int,
IN connection_2 int,
In connection_3 int
)
BEGIN
    DECLARE o_x int;
    DECLARE o_y int;
    DECLARE o_distance int;
    DECLARE o_idfloor int;
    
    -- Create a temporary table to return the coordinate and distance data
    DROP TEMPORARY TABLE IF EXISTS coordinate_and_distance;
	CREATE TEMPORARY TABLE IF NOT EXISTS coordinate_and_distance (
		x int,
        y int,
        distance int,
        idfloor int
	);
    TRUNCATE TABLE coordinate_and_distance;
    
    -- Find the coordinate data and distance, then insert into temporary table
	SELECT x ,y ,distance,fmp.idfloorMap INTO o_x,o_y,o_distance, o_idfloor FROM 
		-- Find the coordinatePoint and distance of a particular connection
		(SELECT b.coordinatePoint,dc.distance FROM beacons b
		INNER JOIN deviceBeaconConnection dc
		ON b.idbeacon = dc.idbeacon AND dc.idconnection = connection_1) bd
	INNER JOIN floorMapPoints fmp
	ON fmp.coordinatePoint = bd.coordinatePoint;
    
    INSERT INTO coordinate_and_distance (x,y,distance,idfloor) VALUES (o_x,o_y,o_distance,o_idfloor);
    
    SELECT x ,y ,distance,fmp.idfloorMap INTO o_x,o_y,o_distance, o_idfloor FROM 
		-- Find the coordinatePoint and distance of a particular connection
		(SELECT b.coordinatePoint,dc.distance FROM beacons b
		INNER JOIN deviceBeaconConnection dc
		ON b.idbeacon = dc.idbeacon AND dc.idconnection = connection_2) bd
	INNER JOIN floorMapPoints fmp
	ON fmp.coordinatePoint = bd.coordinatePoint;
    
    INSERT INTO coordinate_and_distance (x,y,distance,idfloor) VALUES (o_x,o_y,o_distance,o_idfloor);
    
    SELECT x ,y ,distance,fmp.idfloorMap INTO o_x,o_y,o_distance, o_idfloor FROM 
		-- Find the coordinatePoint and distance of a particular connection
		(SELECT b.coordinatePoint,dc.distance FROM beacons b
		INNER JOIN deviceBeaconConnection dc
		ON b.idbeacon = dc.idbeacon AND dc.idconnection = connection_3) bd
	INNER JOIN floorMapPoints fmp
	ON fmp.coordinatePoint = bd.coordinatePoint;
    
    INSERT INTO coordinate_and_distance (x,y,distance,idfloor) VALUES (o_x,o_y,o_distance,o_idfloor);
    
    SELECT * FROM coordinate_and_distance;
END