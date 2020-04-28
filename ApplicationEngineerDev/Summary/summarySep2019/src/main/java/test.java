
import CreateAndPopulateObject.simpleObject;
import DefineClasses.simpleClass;
import DemonstrateHowToCreateAJavaSwingApplication.simpleGUI;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Brickea
 */
public class test {
    public static void main(String[] args){
//        show simple gui
        simpleGUI testGUI = new simpleGUI();
        testGUI.showSimpleJFrame();
        
//        simple class
        simpleClass testClass = new simpleClass();
        testClass.helloWorld();
        
//        create and populate object
        simpleObject testObject = new simpleObject(123,"hello world!");
        System.out.println(testObject.getNumber());
        System.out.println(testObject.getSentence());
    }
}
