/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.util.ArrayList;

/**
 *
 * @author Brickea
 */
public class ProductCatalog {
    private ArrayList<Product> productCatalog;
    
    public ProductCatalog(){
        this.productCatalog = new ArrayList<Product>();
    }
    
    public Product addProduct(){
        Product e = new Product();
        this.productCatalog.add(e);
        return e;
    }
    
    public void deleteProduct(Product e){
        this.productCatalog.remove(e);
    }
    
    public Product searchProduct(String productNumber){
        for(Product e : this.productCatalog){
            if(e.getProductNumber().equals(productNumber)){
                return e;
            }
        }
        return null;
    }

    public ArrayList<Product> getProductCatalog() {
        return productCatalog;
    }
    
}
