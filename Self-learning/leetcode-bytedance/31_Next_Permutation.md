# Next Permutation

# Question Description

Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place and use only constant extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
```
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1
```

## Solution

[关于全排列和下一个排列的概念](https://www.cnblogs.com/grandyang/p/4428207.html)

那么是如何得到的呢，我们通过观察原数组可以发现，如果从末尾往前看，数字逐渐变大，到了2时才减小的，然后再从后往前找第一个比2大的数字，是3，那么我们交换2和3，再把此时3后面的所有数字转置一下即可，步骤如下：

1　　2　　7　　4　　3　　1

1　　2　　7　　4　　3　　1

1　　3　　7　　4　　2　　1

1　　3　　1　　2　　4　　7

原理明白了之后算法一气呵成

```python
class Solution:
    def nextPermutation(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        i = n-1
        while i!=0:
            if nums[i-1]<nums[i]:
                j = i-1
                k = n-1
                while k!=j:
                    if nums[k]>nums[j]:
                        temp = nums[k]
                        nums[k] = nums[j]
                        nums[j] = temp
                        break
                    k-=1
                nums[i:] = reversed(nums[i:])
                    
                break
            i-=1
        if i == 0:
            nums[:] = reversed(nums[:])
```

Runtime: 40 ms, faster than 68.49% of Python3 online submissions for Next Permutation.  
Memory Usage: 12.8 MB, less than 100.00% of Python3 online submissions for Next Permutation.