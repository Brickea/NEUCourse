/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DemonstrateHowToCreateAJavaSwingApplication;

import java.awt.Button;
import javax.swing.JFrame;

/**
 *
 * @author Brickea
 */
public class simpleGUI {

    public void showSimpleJFrame() {
//        main frame
        JFrame f = new JFrame("mainJFrame");

//        set main size
        f.setSize(600, 400);

//        set location
        f.setLocation(0, 0); // top left corner will be the (0,0) point

//        set components in frame to be absolute position
        f.setLayout(null);

//        button component
        Button b = new Button("Click me!");

//        set component position and size
        b.setBounds(0, 0, 80, 80);  // top left corner of frame will be the (0,0) point

//        let mainJFrame add the component
        f.add(b);

//        when exit the frame, quit program
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

//        set frame to be visible
        f.setVisible(true);

    }

}
