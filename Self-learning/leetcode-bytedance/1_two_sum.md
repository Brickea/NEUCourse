# 1. Two Sum

## Question Description

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

```
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

## Solution 1 暴力解

问题寻找的就是一个数组里面所有的组合，然后组合的和是target即可

暴力解就是直接嵌套循环去获得所有两两组合

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i+1,len(nums)):
                if nums[i]+nums[j]==target:
                    return [i,j]
```

Runtime: 5932 ms, faster than 11.37% of Python3 online submissions for Two Sum.  
Memory Usage: 13.9 MB, less than 68.14% of Python3 online submissions for Two Sum.

时间复杂度爆炸 $O(n^2)$

## Solution 2 利用字典

这个方法只用一边循环就可以得到结果。原理很简单：每遍历一个数字就用target减去它，如果临时字典里面有减后的数字，那就取出他的下标，加上当前这个数字的下标一起返回

```
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        temp = {}
        for index,value in enumerate(nums):
            substract = target - value
            if substract not in temp:
                temp[value] = index
            else:
                return [temp[substract],index]
```

Runtime: 44 ms, faster than 92.32% of Python3 online submissions for Two Sum.  
Memory Usage: 14.4 MB, less than 35.35% of Python3 online submissions for Two Sum.


时间复杂度 $O(n)$