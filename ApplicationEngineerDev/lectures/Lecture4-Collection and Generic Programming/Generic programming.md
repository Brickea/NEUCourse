# 泛型类及泛型方法

### [关于collection和framework的详细教程](http://how2j.cn/k/collection/collection-arraylist/363.html)

## 1. 泛型类    

```java
public class Box 
{        //定义一个Box类
    private String object;
    public void set(String object) { this.object = object; }
    public String get() { return object; }
}    
        这样做Box里面只能装入String 类型的元素，今后如果我们需要装入Integer等其他类型的元素，还必须要另外重写一个Box，代码得不到重用，使用泛型可以很好的解决 这个问题。

public class Box<T> 
{ // T stands for "Type"
    private T t;
    public void set(T t) { this.t = t; }
    public T get() { return t; }
} 
```
这样Box类便可以得到重用，我们可以将T替换成任何我们想要的类型：

```java
Box<Integer> integerBox = new Box<Integer>();
Box<Double> doubleBox = new Box<Double>();
Box<String> stringBox = new Box<String>();
```

## 2. 泛型方法

声明一个泛型方法很简单，只要在返回类型前面加上一个类似<K, V>的形式就行了：
```java
public class Util
{
    public static <K, V> boolean compare(Pair<K, V> p1, Pair<K, V> p2)
    {
        return p1.getKey().equals(p2.getKey()) &&
               p1.getValue().equals(p2.getValue());
    }
}
public class Pair<K, V> 
{
    private K key;
    private V value;
    public Pair(K key, V value) 
    {
        this.key = key;
        this.value = value;
    }
    public void setKey(K key) { this.key = key; }
    public void setValue(V value) { this.value = value; }
    public K getKey()   { return key; }
    public V getValue() { return value; }
}
```

我们可以像下面这样去调用泛型方法：

```java
Pair<Integer, String> p1 = new Pair<>(1, "apple");
Pair<Integer, String> p2 = new Pair<>(2, "pear");
boolean same = Util.<Integer, String>compare(p1, p2); 
```
或者在Java1.7/1.8利用type inference，让Java自动推导出相应的类型参数：
```java
Pair<Integer, String> p1 = new Pair<>(1, "apple");
Pair<Integer, String> p2 = new Pair<>(2, "pear");
boolean same = Util.compare(p1, p2); 
```
# 边界符

我们想要实现一个功能--查找一个泛型数组中大于某个特定元素的个数，我们可以这样实现：
```java
public class wedf 
{
	public static <T> int countGreaterThan(T[] anArray, T elem) {
	    int count = 0;
	    for (T e : anArray)
	        if (e > elem)  // The operator > is undefined for the argument type(s) T, T
	            ++count;
	    return count;
	}
}
```

除了short,int,double等原始类型，其他的类并不一定能使用操作符'>'，这样只能使用 边界符了。
```java
public interface Comparable<T> 
{
    public int compareTo(T o);
}
```
做一个类似于下面这样的声明，这样就等于告诉编译器类型参数T代表的都是实现了Comparable接口的类，这样等于告诉编译器它们都至少实现了compareTo方法。
```java
public static <T extends Comparable<T>> int countGreaterThan(T[] anArray, T elem) {
    int count = 0;
    for (T e : anArray)
        if (e.compareTo(elem) > 0)
            ++count;
    return count;
} 
```
# 通配符
```java
List<Integer> ex_int= new ArrayList<Integer>();    
List<Number> ex_num = ex_int; //Type mismatch: cannot convert from List<Integer> to List<Number>
```
第二行出现错误，Integer虽然是Number的子类，但List<Integer>不是List<Number>的子类型。

假定第2行代码没有问题，那么我们可以使用语句ex_num.add(newDouble())在一个List中装入了各种不同类型的子类，这显然是不可以的，因为我们在取出List中的对象时，就分不清楚到底该转型为Integer还是Double了。

因此，我们需要一个在逻辑上可以用来同时表示为List<Integer>和List<Number>的父类的一个引用类型，类型通配符应运而生。在本例中表示为List<?>即可。下面这个例子也说明了这一点，注释已经写的很清楚了。
```java
public class GenericReading 
{
	public static void main(String[] args) 
	{  
	    FX<Number> ex_num = new FX<Number>(100);  
	    FX<Integer> ex_int = new FX<Integer>(200);  
	    getData(ex_num);  
	    getData(ex_int);//编译错误  
	    //The method getData(GenericReading.FX<Number>) in the type GenericReading 
	    //is not applicable for the arguments (GenericReading.FX<Integer>)
	}  
	  
	public static void getData(FX<Number> temp) //此行若把Number换为“？”编译通过  
	{ 
	    //do something...  
	}  
	      
	public static class FX<T> 
	{  
	    private T ob;   
	    public FX(T ob) 
	    {  
	        this.ob = ob;  
	    }  
	}
} 
```

# 上下边界

? extends 类型: <? extend T>表示类型的上界，表示参数化类型的可能是 T 或是 T 的子类

? super 类型: <? super T> 表示类型下界（java core中叫超类型限定），表示参数化类型是此类型的超类型（父类型），直至Object
```java
public class GenericReading 
{
	public static void main(String[] args) {  
	    FX<Number> ex_num = new FX<Number>(100);  
	    FX<Integer> ex_int = new FX<Integer>(200);  
	    getUpperNumberData(ex_num);  
	    getUpperNumberData(ex_int);  
	}  
	  
	public static void getUpperNumberData(FX<? extends Number> temp){  
	      System.out.println("class type :" + temp.getClass());  
	}  
	      
	public static class FX<T> {  
	    private T ob;   
	    public FX(T ob) {  
	    this.ob = ob;  
	    }  
	}  
}
```
输出：

> class type :class test1.GenericReading$FX
> class type :class test1.GenericReading$FX

# 类型擦除

所谓类型擦除，是指通过类型参数合并，将泛型类型实例关联到同一份字节码上。编译器只为泛型类型生成一份字节码，并将其实例关联到这份字节码上。类型擦除的关键在于从泛型类型中清除类型参数的相关信息，并且再必要的时候添加类型检查和类型转换的方法。
```java
// 声明一个具体类型为String的ArrayList
ArrayList<String> arrayList1 = new ArrayList<String>();  
arrayList1.add("abc");  
 
// 声明一个具体类型为Integer的ArrayList
ArrayList<Integer> arrayList2 = new ArrayList<Integer>();  
arrayList2.add(123);  
 
System.out.println(arrayList1.getClass() == arrayList2.getClass());  // 结果为true
```
