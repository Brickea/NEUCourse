/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab7;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

/**
 *
 * @author harshalneelkamal
 */
public class DataGenerator {
        
    private static DataGenerator instance;
    
    private FileWriter writer;
    private File file;
    
    private final Random rand;
    
    private final int userIdsRange;
    private final int commentIdsRange;
    private final int likeRange;
    private final int postIdsRange;
    private final int ratingRange;

    private final String COMMENT_HEADER = "Comment-Id,Post-id,Posting-User-Id,Likes,Commenting-User-Id, Comment";
    private final String USER_HEADER = "User-Id,First-Name,Last-Name,Rating";
    private final String LINE_BREAK = "\n";
    
    private final String USER_CAT_PATH = "./UserCatalogue.csv";
    private final String COMMENT_FILE_PATH = "./CommentData.csv";
    
    private DataGenerator() throws IOException {
                
        rand = new Random();
        
        userIdsRange = 10;
        commentIdsRange = 1000;
        likeRange = 200;
        postIdsRange = 40;
        ratingRange = 300;
        
        generateCommentFile();
        generateUserFile();
        
    }
    
    public static DataGenerator getInstance() throws IOException{
        if(instance == null)
        {
            instance = new DataGenerator();
        }
        return instance;
    }
    
    
    private void generateCommentFile() throws IOException{
        //generate Order file
        try {
            file = new File(COMMENT_FILE_PATH);
            if(file.exists()){
                file.delete();
            }
            file.createNewFile();
            System.out.println("New Comment File Created");
            writer = new FileWriter(file);
        
            writer.append(COMMENT_HEADER);
            writer.append(LINE_BREAK);
            
            generateCommentColumns();   
            
        }finally{
            try {
                writer.flush();
                writer.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        
        
        
    }
    
  
    private void generateCommentColumns() throws IOException{
        int postId = 0;
        int postingUserId = rand.nextInt(userIdsRange);
        int commentId = 0;
        //the loop for orders
        while(postId < postIdsRange && commentId < commentIdsRange) {
            int iterations = rand.nextInt(10);
            
            while(iterations > 0){
                int likeCount = rand.nextInt(likeRange);
                int commentingUserId = rand.nextInt(userIdsRange);
                String comment = "Some Random Commen with Id "+commentId;
                
                String column = commentId+","+postId+","+postingUserId+","+likeCount+","+commentingUserId+","+comment;
                
                writer.append(column);
                writer.append(LINE_BREAK);
                
                commentId++;
                iterations--;
            }
            
            postingUserId = rand.nextInt(userIdsRange);
            postId++;
        }
        
    }
    private void generateUserFile() throws IOException{
        //generate Product file
        
        try {
            
            file = new File(USER_CAT_PATH);
            if(file.exists()){
                file.delete();
            }
            file.createNewFile();
            System.out.println("New User Catalogue Created");
            writer = new FileWriter(file);
        
            writer.append(USER_HEADER);
            writer.append(LINE_BREAK);
        
            generateUserColumns();   
            
        }finally{
            
            try {
                writer.flush();
                writer.close();
            } catch (IOException e) {
                System.out.println("Error while flushing/closing fileWriter !!!");
                e.printStackTrace();
            }
        }
        
        
    }
    
    private void generateUserColumns() throws IOException{
        int userId = 0;
        //the loop for orders
        while(userId < userIdsRange){
            //items for a order.
            String firstName = "FirstName "+userId;
            String lastName = "LastName "+userId;
            int rating = rand.nextInt(ratingRange);
            
            String column = userId+","+firstName+","+lastName+","+rating;
                
            writer.append(column);
            writer.append(LINE_BREAK);
                        
            userId++;
        }
        
    }
    
    public String getUserCataloguePath(){
        return USER_CAT_PATH;
    }
    
    public String getCommentFilePath(){
        return COMMENT_FILE_PATH;
    }
    
}
