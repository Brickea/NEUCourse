/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.util.HashMap;

/**
 *
 * @author admin
 */
public class Car {
    private HashMap<String, String> carAttributes = new HashMap<>();

    // name; // car's name
    // length; // car's body length
    // color;
    // wheelbase; // Distance from the center of the front axle to the center of the
    // rear axle
    // frontAndRearTrack; // Distance between the center lines of the tracks left by
    // the front/rear wheels
    // // on the vehicle support plane (usually the ground)
    // groundClearance; // The lowest point of a car body is usually below the
    // gearbox or oil pan.
    // minimumTurningDiameter;
    // carBodyStructure;
    // departureAngle; // When the vehicle is fully loaded and still, the angle
    // between the tangent of
    // // the rear wheel and the road surface from the protruding point of the rear
    // end
    // // of the body
    // dragCoefficient;
    // Wattiefe;
    // luggageVolume;
    // cylinderArrangements;

    // cylinderNumber;
    // operationMode;
    // imgPath
    public Car() {
        String initValue = "";
        this.setName(initValue);
        this.setLength(initValue);
        this.setColor(initValue);
        this.setWheelbase(initValue);
        this.setFrontAndRearTrack(initValue);
        this.setGroundClearance(initValue);
        this.setMinimumTurningDiameter(initValue);
        this.setCarBodyStructure(initValue);
        this.setDepartureAngle(initValue);
        this.setDragCoefficient(initValue);
        this.setWattiefe(initValue);
        this.setLuggageVolume(initValue);
        this.setCylinderArrangements(initValue);
        this.setCylinderNumber(initValue);
        this.setOperationMode(initValue);
        this.setImagePath(initValue);

    }

    public String getName() {
        return this.carAttributes.get("name");
    }

    public void setName(String name) {
        this.carAttributes.put("name", name);
    }

    public String getLength() {
        return this.carAttributes.get("length");
    }

    public void setLength(String length) {
        this.carAttributes.put("length", length);
    }

    public String getColor() {
        return this.carAttributes.get("color");
    }

    public void setColor(String color) {
        this.carAttributes.put("color", color);
    }

    public String getWheelbase() {
        return this.carAttributes.get("wheelbase");
    }

    public void setWheelbase(String wheelbase) {
        this.carAttributes.put("wheelbase", wheelbase);
    }

    public String getFrontAndRearTrack() {
        return this.carAttributes.get("frontAndRearTrack");
    }

    public void setFrontAndRearTrack(String frontAndRearTrack) {
        this.carAttributes.put("frontAndRearTrack", frontAndRearTrack);
    }

    public String getGroundClearance() {
        return this.carAttributes.get("groundClearance");
    }

    public void setGroundClearance(String groundClearance) {
        this.carAttributes.put("groundClearance", groundClearance);
    }

    public String getMinimumTurningDiameter() {
        return this.carAttributes.get("minimumTurningDiameter");
    }

    public void setMinimumTurningDiameter(String minimumTurningDiameter) {
        this.carAttributes.put("minimumTurningDiameter", minimumTurningDiameter);
    }

    public String getCarBodyStructure() {
        return this.carAttributes.get("carBodyStructure");
    }

    public void setCarBodyStructure(String carBodyStructure) {
        this.carAttributes.put("carBodyStructure", carBodyStructure);
    }

    public String getDepartureAngle() {
        return this.carAttributes.get("departureAngle");
    }

    public void setDepartureAngle(String departureAngle) {
        this.carAttributes.put("departureAngle", departureAngle);
    }

    public String getDragCoefficient() {
        return this.carAttributes.get("dragCoefficient");
    }

    public void setDragCoefficient(String dragCoefficient) {
        this.carAttributes.put("dragCoefficient", dragCoefficient);
    }

    public String getWattiefe() {
        return this.carAttributes.get("Wattiefe");
    }

    public void setWattiefe(String Wattiefe) {
        this.carAttributes.put("Wattiefe", Wattiefe);
    }

    public String getLuggageVolume() {
        return this.carAttributes.get("luggageVolume");
    }

    public void setLuggageVolume(String luggageVolume) {
        this.carAttributes.put("luggageVolume", luggageVolume);
    }

    public String getCylinderArrangements() {
        return this.carAttributes.get("cylinderArrangements");
    }

    public void setCylinderArrangements(String cylinderArrangements) {
        this.carAttributes.put("cylinderArrangements", cylinderArrangements);
    }

    public String getCylinderNumber() {
        return this.carAttributes.get("cylinderNumber");
    }

    public void setCylinderNumber(String cylinderNumber) {
        this.carAttributes.put("cylinderNumber", cylinderNumber);
    }

    public String getOperationMode() {
        return this.carAttributes.get("operationMode");
    }

    public void setOperationMode(String operationMode) {
        this.carAttributes.put("operationMode", operationMode);
    }

    public String getImagePath() {
        return this.carAttributes.get("imgPath");
    }

    public void setImagePath(String imgPath) {
        this.carAttributes.put("imgPath", imgPath);
    }

}
