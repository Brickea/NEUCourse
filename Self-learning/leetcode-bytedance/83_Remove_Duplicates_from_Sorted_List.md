# Remove Duplicates from Sorted List

## Question Description

Given a sorted linked list, delete all duplicates such that each element appear only once.
```
Example 1:

Input: 1->1->2
Output: 1->2
Example 2:

Input: 1->1->2->3->3
Output: 1->2->3
```

## Solution

借助链表的删除操作特性，一边遍历即可。

```python

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def deleteDuplicates(self, head: ListNode) -> ListNode:
        if not head:
            return head
        pre = head
        current = head.next
        while current:
            if current.val == pre.val:
                pre.next = current.next
                current = current.next
            else:
                pre = pre.next
                current = current.next
        return head
```

Runtime: 40 ms, faster than 71.12% of Python3 online submissions for Remove Duplicates from Sorted List.  
Memory Usage: 12.6 MB, less than 100.00% of Python3 online submissions for Remove Duplicates from Sorted List.