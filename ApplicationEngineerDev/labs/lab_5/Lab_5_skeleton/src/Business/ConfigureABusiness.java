/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import Business.Employee.Employee;
import Business.UserAccount.UserAccount;

/**
 *
 * @author ran
 */
public class ConfigureABusiness {
    
    public static Business configure(){
        // Three roles: LabAssistant, Doctor, Admin
        
        Business business = Business.getInstance();
        
        
        return business;
    }
    
}
