/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab7;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author harshalneelkamal
 */
public class DataReader {
    
    private BufferedReader reader;
    private String[] header;
    
    public DataReader(String fileName) throws FileNotFoundException {
        File file = new File(fileName);
        if(!file.exists())
            throw new FileNotFoundException("File not found at the path specified: "+fileName);
        reader = new BufferedReader(new FileReader(file));
    }
    
    public String[] getNextRow() throws IOException{
        if (header == null)
            header = getFileHeader();
        String line = "";
        if((line = reader.readLine()) != null){
            String[] rows = line.split(",");
            return rows;
        }
        return null;
    }
    
    public String[] getFileHeader() throws IOException{
        if(header == null){
            String line = "";
            if((line = reader.readLine()) != null){
                String[] rows = line.split(",");
                header = rows;
            }
        }
        return header;
    }
}
