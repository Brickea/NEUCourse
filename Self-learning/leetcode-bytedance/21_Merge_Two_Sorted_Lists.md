# Merge Two Sorted Lists

## Quesiton Description

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

```
Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
```

## Solution 

直觉上的想法很简单，两个指针分别遍历两个链表，小的就放到新的链表上，遍历一遍就可以了

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode(0)
        temp = head
        
        while l1 != None and l2 != None:
            if l1.val <= l2.val:
                temp.next = ListNode(l1.val)
                temp = temp.next
                l1 = l1.next
            else:
                temp.next = ListNode(l2.val)
                temp = temp.next
                l2 = l2.next
        while l1 != None:
            temp.next = ListNode(l1.val)
            temp = temp.next
            l1 = l1.next
        while l2 != None:
            temp.next = ListNode(l2.val)
            temp = temp.next
            l2 = l2.next
            
        return head.next
```

Runtime: 40 ms, faster than 24.53% of Python3 online submissions for Merge Two Sorted Lists.  
Memory Usage: 12.9 MB, less than 100.00% of Python3 online submissions for Merge Two Sorted Lists.

## Solution 2 recursion

分而治之的思想，递归调用

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        if l1 and l2:
            if l1.val < l2.val:
                l1.next = self.mergeTwoLists(l1.next,l2)
                return l1
            else:
                l2.next = self.mergeTwoLists(l1,l2.next)
                return l2
        elif l1:
            return l1
        elif l2:
            return l2
        else:
            return None
```

Runtime: 36 ms, faster than 62.65% of Python3 online submissions for Merge Two Sorted Lists.  
Memory Usage: 12.6 MB, less than 100.00% of Python3 online submissions for Merge Two Sorted Lists.

我算是知道了，没有最快只有更快，有个java的解法tmd是 0ms，我醉了