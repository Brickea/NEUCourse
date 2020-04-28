CREATE DEFINER=`brickea_mac`@`%` PROCEDURE `add_floorMap_data`(
IN buildingName varchar(45),
IN floorNumber int, 
IN excelPath blob, 
OUT idbuilding int)
BEGIN
	-- Set a local variable to judge if the floor is exist
    DECLARE ifFloorExist int DEFAULT -1;
    -- Select the idbuilding that match the input buildingName
    SELECT b.idbuilding INTO idbuilding
 	FROM building b
 	WHERE b.name = buildingName;
    -- Check if the building is exist
    IF idbuilding IS NULL
	THEN -- if the building is not exist
		-- Output the result
		SELECT 'No building found' as idbuilding;
	ELSE -- the building is exist
		-- Output the result
        -- Check if the floor is exist
		SELECT idfloorMap INTO ifFloorExist FROM floorMap fm WHERE fm.idbuilding = idbuilding;
		IF ifFloorExist <> -1
		THEN -- if the floor exist
			-- Use update to update the data from input
            SELECT 'update successfully!' as Result;
			UPDATE floorMap SET excelMap = excelPath, ifupdate = 1
			WHERE floorNumber = floorNumber and idfloorMap = ifFloorExist;
		ELSE -- if the floor doesn't exist
			-- Insert the new data from input
            SELECT 'insert successfully!' as Result;
			INSERT floorMap (idbuilding,floorNumber,excelMap,ifupdate) VALUES (idbuilding,floorNumber,excelPath,1);
		END IF;
	END IF;
END