# Lab 3.5

## Homework

This is an individual assignment.

Implement the functionality of searching by product name, your search result should be shown in “tblDirectory” JTable.

Create back buttons and implement a “back” functionality on both “ManageProdPanel” and “ViewPanel”

Link your JPanels by using CardLayout.

Validate your inputs and handle exceptions for “create” and “update”.

Multiple small git commits.

[.gitignore file](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) is required.


## Key word

Swing table, search by id, cardlayout

## Introduction

[video](https://drive.google.com/open?id=1xylwcwXl2EvcmxIUbVFSBOcTA-06ouSD)

## Card layout

1. 定义使用卡片布局的容器

例如：
```java
Panel cardPanel=new Panel();
```

2. 定义卡片对象：CardLayout 布局对象名称=new CardLayout();

例如：

```java
CardLayout card=new CardLayout();
```

3. 设置使用卡片布局的容器为卡片布局：

格式：容器名称.setLayout(布局对象名称);

例如：

```java
cardPanel.setLayout(card);
```

4. 设置容器中显示的组件

例如：
```java
for (int i = 0; i < 5; i++) {
    cardPanel.add(newJButton("按钮"+i));
}
```

5. 定义响应事件代码，让容器显示相应的组件

```

格式：

n  布局对象名称.next(容器名称)   显示容器中当前组件之后的一个组件，若当前组件为最后添加的组件，则显示第一个组件，即卡片组件显示是循环的。

n  布局对象名称.first(容器名称)   显示容器中第一个组件

n  布局对象名称.last(容器名称)   显示容器中最后一个组件

n  布局对象名称.previous(容器名称)   显示容器中当前组件之前的一个组件，若当前组件为第一个添加的组件，则显示最后一个组件，即卡片组件显示是循环的。
```