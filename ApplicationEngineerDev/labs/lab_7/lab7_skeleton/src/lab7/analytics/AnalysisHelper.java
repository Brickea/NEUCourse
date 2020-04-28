/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab7.analytics;

import java.util.HashMap;
import java.util.Map;
import lab7.entities.Comment;
import lab7.entities.User;

/**
 *
 * @author harshalneelkamal
 */
public class AnalysisHelper {

    // find user with Most Likes
    // TODO
    static public User mostLikeUser() {
        Map<Integer, Comment> c = DataStore.getInstance().getComments();
        Map<Integer, User> u = DataStore.getInstance().getUsers();
        Map<Integer, Integer> uLike = new HashMap<>();
        for (Comment tempC : c.values()) {
            int uId = tempC.getUserId();
            int like = tempC.getLikes();
            if (!uLike.containsKey(uId)) {
                uLike.put(uId, like);
            } else {
                uLike.put(uId, uLike.get(uId) + like);
            }
        }
        int maxLike = 0;
        int maxId = 0;
        for (int uId : uLike.keySet()) {
            if (uLike.get(uId) > maxLike) {
                maxLike = uLike.get(uId);
                maxId = uId;
            }
        }
        return u.get(maxId);

    }

// find 5 comments which have the most likes
// TODO
    static public Map<Integer, Comment> top5Comments() {
        Map<Integer, Comment> tempC = new HashMap<>();

        Map<Integer, Comment> c = DataStore.getInstance().getComments();
        Map<Integer, User> u = DataStore.getInstance().getUsers();
        Map<Integer, Integer> uLike = new HashMap<>();

        for (int j = 0; j < 5; j++) {
            int max = 0;
            int maxId = 0;
            for (int i : c.keySet()) {
                if(c.get(i).getLikes()>max&&!tempC.containsKey(i)){
                    max = c.get(i).getLikes();
                    maxId = i;
                }
            }
            System.out.println(maxId);
            System.out.println(c.get(maxId).getLikes());
            tempC.put(maxId, c.get(maxId));
        }
        return tempC;
    }
}
