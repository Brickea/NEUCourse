# Container With Most Water

## Question Description

Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

![](./res/question_11.jpg)

```
Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49
```

## Solution 1 Brute Force

没有被AC，时间复杂度超了。暴力法就是冒泡的那种遍历方式

寻找所有组合计算容积，取最大

```
class Solution:
    def maxArea(self, height: List[int]) -> int:
        maxArea = 0
        for i in range(len(height)):
            for j in range(i+1,len(height)):
                temp = min(height[i],height[j])
                tempArea = temp * (j - i)
                maxArea = max(maxArea,tempArea)
        return maxArea
```

## Solution 2 

考虑以下情况，遍历从两边开始，当一边小于另一边的高度时，则说明小的那一边能得到的最大容积组合就是当前组合，所以小的那一边要向中间遍历，所以算法为

```python
class Solution:
    def maxArea(self, height: List[int]) -> int:
        maxArea = 0
        index_left = 0
        index_right = len(height)-1
        while index_left != index_right:
            tempArea = (index_right-index_left) * min(height[index_left],height[index_right]) 
            maxArea = max(maxArea,tempArea)
            if height[index_left] > height[index_right]:
                index_right -=1
            else:
                index_left +=1
        return maxArea
```

Runtime: 132 ms, faster than 63.72% of Python3 online submissions for Container With Most Water.  
Memory Usage: 14.5 MB, less than 41.05% of Python3 online submissions for Container With Most Water.