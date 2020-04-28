/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Brickea
 */
public class CarCatalog {

    private ArrayList<Car> carCatalog = new ArrayList<Car>();
    private Date updateTime;

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    public String getUpdateTime() {
        return this.dateFormat.format(this.updateTime);
    }

    public CarCatalog() {
        updateTime = new Date();
    }

    public Car searchCar(int seriesNumber) {
        for (Car c : this.carCatalog) {
            if (c.getCarSeriesNumber() == seriesNumber) {
                return c;
            }
        }
        return null;
    }

    public void updateLastTime() {
        updateTime = new Date();
    }

    public ArrayList<Car> getCarCatalog() {
        return carCatalog;
    }

    public void addCar(Car car) {
        if (this.searchCar(car.getCarSeriesNumber()) == null) {
            this.carCatalog.add(car);
            this.updateLastTime();
        }

    }

    public void deleteCar(Car car) {
        this.carCatalog.remove(car);
        this.updateLastTime();
    }

    public boolean isExistCar(Car car) {
        for (Car c : this.carCatalog) {
            if (c.getCarSeriesNumber() == car.getCarSeriesNumber()) {
                return true;
            }
        }
        return false;
    }

}
