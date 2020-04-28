# 3Sum Closest

## Question Description

Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

```
Example:

Given array nums = [-1, 2, 1, -4], and target = 1.

The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

## Solution 2 Pointers

先排序，然后先固定一个位置，在从这个位置开始，头一个指针，尾一个指针。当计算的差距变小的时候，将当前的差距最小和更新；当计算的差距变大的时候，此时考虑两种情况，如果计算的和比目标小，则将头指针向后移动，反之则将尾指针向前移动

```python
class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        if len(nums) < 3:
            return None
        nums.sort()
        ans = sum(nums[:3])
        for i in range(len(nums)-2):
            l, r = i+1, len(nums)-1
            while l < r:
                val = nums[i] + nums[l] + nums[r]
                if val == target:#if we found three nums with its sum equal to target, definitely it will be the result
                    return val
                if abs(val - target) < abs(ans - target):#if we found smaller sum values, we update the result
                    ans = val
                elif val < target:
                    l +=1
                else:
                    r -=1
        return ans
```

Runtime: 144 ms, faster than 50.81% of Python3 online submissions for 3Sum Closest.  
Memory Usage: 12.8 MB, less than 100.00% of Python3 online submissions for 3Sum Closest.