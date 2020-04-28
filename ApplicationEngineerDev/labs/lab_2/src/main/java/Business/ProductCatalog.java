/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.ArrayList;

/**
 *
 * @author Brickea
 */
public class ProductCatalog {
    private ArrayList<Product> productCatalog;
    public ProductCatalog(){
        productCatalog = new ArrayList<Product>();
    }
    
    public ArrayList<Product> getProductCatalog() {
        return productCatalog;
    }

    public void setProductCatalog(ArrayList<Product> productCatalog) {
        this.productCatalog = productCatalog;
    }
    public Product addProduct(){
        Product pro = new Product();
        this.productCatalog.add(pro);
        return pro;
    } 
    public void deleteProduct(Product pro){
        this.productCatalog.remove(pro);
    }
    
}
