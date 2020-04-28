# Assignment 1

    The objective of this problem is to extend the app we built to support multiple attributes. Your task is to define a model for your favorite car. Your app must allow for the creation and display of a car object with various attributes that best describe the car. Your implementation must include at least 15 attributes ranging from color, model, serial number, dimensions, etc. Your data types will be made up of string types. A picture of the car must be uploaded during creation and displayed during the display step.

**Due 9/14 at 11:59 pm to be uploaded to Blackboard**

## Q & A

### 1. HashMap in Java (like dictionary)

```java
package collection;
   
import java.util.HashMap;
   
public class TestCollection {
    public static void main(String[] args) {
        HashMap<String,String> dictionary = new HashMap<>();
        dictionary.put("adc", "物理英雄");
        dictionary.put("apc", "魔法英雄");
        dictionary.put("t", "坦克");
         
        System.out.println(dictionary.get("t"));
    }
}
```

### 2. How to iterate HashMap in Java

for each

```java
Map<String, String> map = new HashMap<String, String>();
for (String key : map.keySet()) {
	map.get(key);
}
```

```java
Map<String, String> map = new HashMap<String, String>();
for (Entry<String, String> entry : map.entrySet()) {
	entry.getKey();
	entry.getValue();
}
```

### 3. How to make image adjust it's size to container label

We need to class to solove this problem

```java
import java.awt.Image;
import javax.swing.ImageIcon;
```

Core code

```java
JLabel jlb = new JLabel();	//make a JLbel
int width = 50,height = 50;	//size of label
ImageIcon image = new ImageIcon("image/img1.jpg");//use an object to contain image

image.setImage(image.getImage().getScaledInstance(width, height,Image.SCALE_DEFAULT ));// this row is a combination of the following three rows
//Image img = image.getImage(); // get the image
//img = img.getScaledInstance(width, height, Image.scale_default);  // use default image adjustment algorithm to process the image
//image.setImage(img);  //
jlb.setIcon(image);
jlb.setSize(width, height);
```

### 4. How to load file with Java

```java
// =================================================
// open file to load image
// =================================================
JFileChooser fc = new JFileChooser();
fc.setCurrentDirectory(new File("."));// default show current file direction
fc.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);// set selection mode
fc.setFileFilter(new FileNameExtensionFilter("image(*.jpg, *.png, *.gif)", "jpg", "png", "gif"));// filter only
// image can be
// chosen
// =================================================
// save the load image as a object
// =================================================
int result = fc.showOpenDialog(this);
if (result == JFileChooser.APPROVE_OPTION) {
    File file = fc.getSelectedFile();// obtain the select file
}

fc.getSelectedFile().getAbsolutePath();// the file you choose
```