/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Users;

import Business.Abstract.User;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author AEDSpring2019
 */
public class Customer extends User{
    private Date createDate;
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    
    public Customer(String password,String name){
        super(password,name,"CUSTOMER");
        this.createDate = new Date();
    }
    
    public String getCreateTime() {
        return this.dateFormat.format(this.createDate);
    }
    
    @Override
    public String toString() {
        return getUserName(); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean verify(String password){
        if(password.equals(getPassword()))
            return true;
        return false;
    }
    
}
