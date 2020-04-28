/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment5.xerox;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author kasai
 */
public class GateWay {

    public static void main(String args[]) throws IOException {

        DataGenerator generator = DataGenerator.getInstance();
        
        //Below is the sample for how you can use reader. you might wanna 
        //delete it once you understood.
        
        DataReader orderReader = new DataReader(generator.getOrderFilePath());
        String[] orderRow;
        printRow(orderReader.getFileHeader());
        while((orderRow = orderReader.getNextRow()) != null){
            printRow(orderRow);
        }
        System.out.println("_____________________________________________________________");
        DataReader productReader = new DataReader(generator.getProductCataloguePath());
        String[] prodRow;
        printRow(productReader.getFileHeader());
        while((prodRow = productReader.getNextRow()) != null){
            printRow(prodRow);
        }
    }

    public static void printRow(String[] row) {
        for (String row1 : row) {
            System.out.print(row1 + ", ");
        }
        System.out.println("");
    }

}
