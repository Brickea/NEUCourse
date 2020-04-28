/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab7;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import lab7.analytics.AnalysisHelper;
import lab7.analytics.DataStore;
import lab7.entities.Comment;
import lab7.entities.Post;
import lab7.entities.User;

/**
 *
 * @author harshalneelkamal
 */
public class Lab7 {

    DataReader commentReader;
    DataReader userReader;
    AnalysisHelper helper;

    public Lab7() throws IOException {
        DataGenerator generator = DataGenerator.getInstance();
        commentReader = new DataReader(generator.getCommentFilePath());
        userReader = new DataReader(generator.getUserCataloguePath());
        helper = new AnalysisHelper();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        Lab7 inst = new Lab7();
        inst.readData();
    }

    private void readData() throws IOException {
        String[] row;
        while ((row = userReader.getNextRow()) != null) {
            for(String s: row){
                System.out.print(s+" ");
            }
            System.out.println("");
            generateUser(row);
        }
        while ((row = commentReader.getNextRow()) != null) {
            for(String s: row){
                System.out.print(s+" ");
            }
            System.out.println("");
            Comment comment = generateComment(row);
            generatePost(row, comment);
        }
        runAnalysis();
    }

    private void generateUser(String[] row) {
        // TODO
        User u = new User(Integer.parseInt(row[0]),row[1],row[3]);
        DataStore.getInstance().getUsers().put(Integer.parseInt(row[0]), u);
    }

    private Comment generateComment(String[] row) {
        // TODO
        // int id, int userId, int postId, String text, int likes
        Comment c = new Comment(Integer.parseInt(row[0]),Integer.parseInt(row[2]),Integer.parseInt(row[1]),row[5],Integer.parseInt(row[3]));
        DataStore.getInstance().getComments().put(Integer.parseInt(row[0]), c);
        return c;
    }

    private void generatePost(String[] row, Comment comment) {
        // TODO
        Post p = new Post(comment.getPostId(),comment.getUserId());
        DataStore.getInstance().getPosts().put(comment.getPostId(), p);
    }

    private void runAnalysis() {
        // TODO
        System.out.println(AnalysisHelper.mostLikeUser());
        Map<Integer,Comment> top5Comment = AnalysisHelper.top5Comments();
        for(int i : top5Comment.keySet()){
            System.out.println(top5Comment.get(i));
        }
    }
}
