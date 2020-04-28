/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Abstract;

/**
 *
 * @author AEDSpring2019
 */
public abstract class User {
    private String password;
    private String userName;
    private String role;

    public User(String password, String userName, String role) {
        this.password = password;
        this.userName = userName;
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    abstract public boolean verify(String password);

    public String getRole() {
        return role;
    }

    @Override
    public String toString() {
        return getUserName();
    }
    
}
