CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `update_customer_current_position`(
	IN iddevice int,
    In idfloor int,
    IN x int,
    IN y int
)
BEGIN
	DECLARE current_coordinate int DEFAULT -1;
    
	-- Update the deviceCurrentPosition position
    SELECT coordinatePoint INTO current_coordinate FROM floorMapPoints fmp
    WHERE fmp.x = x AND fmp.y = y AND fmp.idfloorMap = idfloor;
    
    -- If exist then update, else insert
    REPLACE INTO deviceCurrentPosition (iddevice, coordinatePoint) VALUES(iddevice, current_coordinate);
    
    SELECT 'success';
    
END