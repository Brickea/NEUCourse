/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import Business.Abstract.User;
import Business.Users.Admin;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Brickea
 */
public class AdminDirectory {
    private List<User> adminList;
    
    public AdminDirectory(){
        this.adminList = new ArrayList<>();
    }

    public List<User> getAdminList() {
        return adminList;
    }

    public void addAdmin(Admin admin){
        this.adminList.add(admin);
    }
    public void deleteAdmin(Admin admin){
        this.adminList.remove(admin);
    }
    
    
    
}
