/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.util.Date;

/**
 *
 * @author Brickea
 */
public class Product {
    private String name;
    private String productNumber;
    private String companyName;
    private int price;
    private Date createOn;
    
    public Product(){
        this.createOn = new Date();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    

    public String getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(String productNumber) {
        this.productNumber = productNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getCreateOn() {
        return createOn;
    }
    
    @Override
    public String toString(){
        return this.name;
    }
    
    
    
}
