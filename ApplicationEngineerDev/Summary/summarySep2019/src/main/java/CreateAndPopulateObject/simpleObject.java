/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CreateAndPopulateObject;

/**
 *
 * @author Brickea
 */
public class simpleObject {
    private int number;
    private String sentence;
    
    public simpleObject(){
        
    }
    public simpleObject(int number,String sentence){
        this.setNumber(number);
        this.setSentence(sentence);
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }
    
    
}
