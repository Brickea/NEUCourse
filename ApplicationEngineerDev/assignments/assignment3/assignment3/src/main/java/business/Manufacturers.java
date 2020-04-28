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
public class Manufacturers {
    private ArrayList<String> companyName=new ArrayList<String>();
    public void addCompanyName (String name){
        this.companyName.add(name);
    }
    public ArrayList<String> getCompaniesNames(){
        return this.companyName;
    }
    
}
