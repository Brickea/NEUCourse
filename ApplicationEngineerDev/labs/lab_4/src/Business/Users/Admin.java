/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Users;

import Business.Abstract.User;
import Business.CustomerDirectory;
import Business.SupplierDirectory;

/**
 *
 * @author AEDSpring2019
 */
public class Admin extends User {
    
    public SupplierDirectory suppDir;
    public CustomerDirectory custDir;
    
    public Admin() {
        super("", "", "ADMIN");
        suppDir = new SupplierDirectory();
        custDir = new CustomerDirectory();
    }

    public SupplierDirectory getSuppDir() {
        return suppDir;
    }

    public void setSuppDir(SupplierDirectory suppDir) {
        this.suppDir = suppDir;
    }

    public CustomerDirectory getCustDir() {
        return custDir;
    }

    public void setCustDir(CustomerDirectory custDir) {
        this.custDir = custDir;
    }
    
    public boolean verify(String password){
        if(password.equals(getPassword()))
            return true;
        return false;
    }
    
}
