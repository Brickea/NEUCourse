/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import java.util.ArrayList;

/**
 *
 * @author Brickea
 */
public class AdminOrganization extends Organization{
    public AdminOrganization(){
        super("Admin");
    }
    
    public ArrayList<String> getSupportedRole(){
        return null;
    }
    
}
