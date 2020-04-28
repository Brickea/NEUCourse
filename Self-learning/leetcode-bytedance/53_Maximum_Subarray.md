# Maximum Subarray

## Question Description

Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

```

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

```

Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

## Solution

```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)
        max_sum_ending_curr_index = max_sum = nums[0]
        for i in range(1, n):
            max_sum_ending_curr_index = max(max_sum_ending_curr_index + nums[i], nums[i])
            max_sum = max(max_sum_ending_curr_index, max_sum)
            
        return max_sum
```

Runtime: 68 ms, faster than 60.45% of Python3 online submissions for Maximum Subarray.  
Memory Usage: 13.6 MB, less than 61.79% of Python3 online submissions for Maximum Subarray.