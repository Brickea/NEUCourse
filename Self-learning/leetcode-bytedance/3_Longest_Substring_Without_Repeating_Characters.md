#  Longest Substring Without Repeating Characters

## Question Description

Given a string, find the length of the longest substring without repeating characters.

```
Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

## Solution 1 原创 - 空间复杂度强于 100% 的提交

思路很简单，通过一次遍历，借助python list的队列特性。通过enumerate来获得输入字符串的每个字符，对比临时list，如果遍历到的字符不存在，就按照队列的规则存入临时list，如果遍历的字符存在，那就意味着临时list里面从0开始到和遍历的字符相同的那一位是一个没有重复字符的子串，此时就要判断当前最长的长度是否比当前寻找到的子串长度小，小的话就换成这个子串的长度。

遍历结束的时候，不要忘记还要在用当前最长长度和临时list里面的长度进行比较，谁大返回谁。

```python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        substring_queue = []
        max_len = 0
        for index,val in enumerate(s):
            if val not in substring_queue:
                substring_queue.append(val)
            else:
                if(max_len < len(substring_queue)):
                    max_len = len(substring_queue)
                for j in range(substring_queue.index(val)+1):
                    substring_queue.pop(0)
                substring_queue.append(val)
                
        if(max_len < len(substring_queue)):
            max_len = len(substring_queue)

        return max_len
```

Runtime: 64 ms, faster than 60.92% of Python3 online submissions for Longest Substring Without Repeating Characters.  
Memory Usage: 12.9 MB, less than 100.00% of Python3 online submissions for Longest Substring Without Repeating Characters.