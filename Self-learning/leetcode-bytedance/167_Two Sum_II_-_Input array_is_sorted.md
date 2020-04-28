# Two Sum II - Input array is sorted

## Question Description

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

Note:

Your returned answers (both index1 and index2) are not zero-based.
You may assume that each input would have exactly one solution and you may not use the same element twice.

```
Example:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
```

## Solution

借助字典存储访问过的index

可以实现一次遍历即可得到结果

```python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        visited = {}
        for index, value in enumerate(numbers):
            if target - value in visited:
                return [visited[target - value],index+1]
            else:
                visited[value] = index+1
```

Runtime: 52 ms, faster than 99.35% of Python3 online submissions for Two Sum II - Input array is sorted.  
Memory Usage: 13.3 MB, less than 100.00% of Python3 online submissions for Two Sum II - Input array is sorted.