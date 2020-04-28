# Intersection of Two Linked Lists

## Question Description

Write a program to find the node at which the intersection of two singly linked lists begins.

For example, the following two linked lists:

![](res/160_statement.png)

begin to intersect at node c1.

Example 1

![](res/160_example_1.png)

```
Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
Output: Reference of the node with value = 8
Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,0,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
```

Example 2

![](res/160_example_2.png)
```
Input: intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
Output: Reference of the node with value = 2
Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [0,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
```

Example 3

![](res/160_example_3.png)
```
Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
Output: null
Input Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
Explanation: The two lists do not intersect, so return null.
```
 

Notes:

If the two linked lists have no intersection at all, return null.  
The linked lists must retain their original structure after the function returns.  
You may assume there are no cycles anywhere in the entire linked structure.  
Your code should preferably run in O(n) time and use only O(1) memory.  


## Solution 求长度差

分别遍历两个链表，得到分别对应的长度。然后求长度的差值，把较长的那个链表向后移动这个差值的个数，然后一一比较即可

## Solution 用环的思想去做

这道题还有一种特别巧妙的方法，虽然题目中强调了链表中不存在环，但是我们可以用环的思想来做，我们让两条链表分别从各自的开头开始往后遍历，当其中一条遍历到末尾时，我们跳到另一个条链表的开头继续遍历。两个指针最终会相等，而且只有两种情况，一种情况是在交点处相遇，另一种情况是在各自的末尾的空节点处相等。为什么一定会相等呢，因为两个指针走过的路程相同，是两个链表的长度之和，所以一定会相等。这个思路真的很巧妙，而且更重要的是代码写起来特别的简洁

比如

4 1 8 4 5

5 0 1 8 4 5

连到一起就是

4 1 8 4 5 5 0 1 8 4 5 null

5 0 1 8 4 5 4 1 8 4 5 null

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> ListNode:
        pA = headA
        pB = headB
        finalA = None
        while pA != pB:
            if pA:
                pA = pA.next
            else:
                finalA = pA
                pA = headB
            if pB:
                pB = pB.next
            else:
                pB = headA
        return pA
                
```

Runtime: 172 ms, faster than 38.12% of Python3 online submissions for Intersection of Two Linked Lists.  
Memory Usage: 28 MB, less than 100.00% of Python3 online submissions for Intersection of Two Linked Lists.