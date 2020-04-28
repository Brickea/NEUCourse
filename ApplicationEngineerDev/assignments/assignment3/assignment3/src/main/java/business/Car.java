/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;



/**
 *
 * @author Brickea
 */
public class Car {
    private int carSeriesNumber;
    private int carSets;
    private String carManufacturers;
    private String carModelNumber;
    private int carManufacturedYear;
    private String carCity;
    private int[] carPposition = new int[2];
    private boolean carCertification;

    public int getCarSeriesNumber() {
        return carSeriesNumber;
    }

    public void setCarSeriesNumber(int carSeriesNumber) {
        this.carSeriesNumber = carSeriesNumber;
    }

    public int getCarSets() {
        return carSets;
    }

    public void setCarSets(int carSets) {
        this.carSets = carSets;
    }

    public String getCarManufacturers() {
        return carManufacturers;
    }

    public void setCarManufacturers(String carManufacturers) {
        this.carManufacturers = carManufacturers;
    }

    public String getCarModelNumber() {
        return carModelNumber;
    }

    public void setCarModelNumber(String carModelNumber) {
        this.carModelNumber = carModelNumber;
    }

    public int getCarManufacturedYear() {
        return carManufacturedYear;
    }

    public void setCarManufacturedYear(int carManufacturedYear) {
        this.carManufacturedYear = carManufacturedYear;
    }

    public String getCarCity() {
        return carCity;
    }

    public void setCarCity(String carCity) {
        this.carCity = carCity;
    }

    public int[] getCarPposition() {
        return carPposition;
    }

    public void setCarPposition(int x, int y) {
        this.carPposition[0] = x;
        this.carPposition[1] = y;
    }

    public boolean isCarCertification() {
        return carCertification;
    }

    public void setCarCertification(boolean carCertification) {
        this.carCertification = carCertification;
    }
    
    @Override
    public String toString(){
        return Integer.toString(this.getCarSeriesNumber());
    }
    
    
}
