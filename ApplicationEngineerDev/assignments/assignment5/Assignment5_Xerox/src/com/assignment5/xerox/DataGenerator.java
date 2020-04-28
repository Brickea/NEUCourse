/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment5.xerox;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author kasai
 */
public class DataGenerator {
    private Map<Integer, productExample> productCatalogue;
    
    private static DataGenerator instance;
    
    private FileWriter writer;
    private File file;
    
    private final Random rand;
    
    private final int productIdsRange;
    private final int salesPersonIdsRange;
    private final int orderIdsRange;
    private final int customerIdsRange;
    private final int maxQuantity;
    private final int minRange;
    private final int maxRange;
    private final int cheapestProduct;
    private final int mostExpensiveProduct;

    private final String ORDER_HEADER = "Order-Id,Item-id,Product-Id,Quantity,Sales-Id,Customer-Id,Sales-Price-Per-Prod,Market-Segment";
    private final String PRODUCT_HEADER = "Product-Id,Min-Price,Max-Price,Target-Price";
    private final String LINE_BREAK = "\n";
    
    private final String PROD_CAT_PATH = "./ProductCatalogue.csv";
    private final String ORDER_FILE_PATH = "./SalesData.csv";
    
    private DataGenerator() throws IOException {
        
        productCatalogue = new HashMap<>();
        
        rand = new Random(256);
        
        productIdsRange = 20;
        salesPersonIdsRange = 10;
        orderIdsRange = 2000;
        customerIdsRange = 30;
        maxQuantity = 30;
        minRange = 4;
        maxRange = 100;
        cheapestProduct = 20;
        mostExpensiveProduct = 200;
        
        generateProductsFile();
        generateOrdersFile();
        
    }
    
    public static DataGenerator getInstance() throws IOException{
        if(instance == null)
        {
            instance = new DataGenerator();
        }
        return instance;
    }
    
    
    private void generateOrdersFile() throws IOException{
        //generate Order file
        try {
            file = new File(ORDER_FILE_PATH);
            if(file.exists()){
                file.delete();
            }
            file.createNewFile();
            System.out.println("New Orders File Created");
            writer = new FileWriter(file);
        
            writer.append(ORDER_HEADER);
            writer.append(LINE_BREAK);
            
            generateOrderColumns();   
            
        }finally{
            try {
                writer.flush();
                writer.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        
        
       
    }
    
    private void generateOrderColumns() throws IOException{
        int orderId = 0;
        int itemId = 0;
        //the loop for orders
        String[] market = {"education","financial","retail","pharmaceutical","software","realestate"};
        Random rand = new Random();
        while(orderId < orderIdsRange){
            int items = 1;//rand.nextInt(1);
            int itemCount = 0;
            //items for a order.
            while(itemCount < items){
                int productId = rand.nextInt(productIdsRange);
                int quantity = rand.nextInt(maxQuantity);
                int salesId = rand.nextInt(salesPersonIdsRange);
                int customerId = rand.nextInt(customerIdsRange);
                int salesPrice = randomSalesPriceForProductId(productId);
                String marketSeg = market[rand.nextInt(market.length)];
                String column = orderId+","+itemId+","+productId+","+quantity+","+salesId+","+customerId+","+salesPrice+","+marketSeg;
                
                writer.append(column);
                writer.append(LINE_BREAK);
                
                itemCount++;
                itemId++;
            }

            orderId++;
        }
        
    }
    
    private int randomSalesPriceForProductId(int id){
        productExample prod = productCatalogue.get(id);        
        return prod.min + rand.nextInt(prod.max - prod.min);
    }
    
    private void generateProductsFile() throws IOException{
        //generate Product file
        
        try {
            
            file = new File(PROD_CAT_PATH);
            if(file.exists()){
                file.delete();
            }
            file.createNewFile();
            System.out.println("New Product Catalogue Created");
            writer = new FileWriter(file);
        
            writer.append(PRODUCT_HEADER);
            writer.append(LINE_BREAK);
        
            generateProductsColumns();   
            
        }finally{
            
            try {
                writer.flush();
                writer.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        
        
    }
    
    private void generateProductsColumns() throws IOException{
        int productId = 0;
        //the loop for orders
        while(productId < productIdsRange){
            //items for a order.
            int minPrice = cheapestProduct + rand.nextInt(mostExpensiveProduct-cheapestProduct);
            int maxPrice = minPrice + minRange +rand.nextInt(maxRange - minRange);
            int targetPrice = minPrice + (maxPrice - minPrice)/2;
             
            String column = productId+","+minPrice+","+maxPrice+","+targetPrice;
                
            writer.append(column);
            writer.append(LINE_BREAK);
            
            productCatalogue.put(productId, new productExample(minPrice, maxPrice, targetPrice));
            
            productId++;
        }
        
    }
    
    public String getOrderFilePath(){
        return ORDER_FILE_PATH;
    }
    
    public String getProductCataloguePath(){
        return PROD_CAT_PATH;
    }
 
    private class productExample {
        int min;
        int max;
        int target;
        
        productExample(int min, int max, int target){
            this.min = min;
            this.max = max;
            this.target = target;
        }
        
    }
    
}
