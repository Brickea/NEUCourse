CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `get_destination_location_coordinate`(
	IN idlocationToVisit int
)
BEGIN
	SELECT fmp.x,fmp.y FROM locationToVisit ltv
    INNER JOIN floorMapPoints fmp
    ON ltv.coordinatePoint = fmp.coordinatePoint
    WHERE ltv.idlocationToVisit = idlocationToVisit;
END