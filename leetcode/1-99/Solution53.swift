//
//  Solution53.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//     -2,1,-3,4,-1,2,1,-5,4
// res -2 1 1  4 4  5 6 6 6
// sum -2,1,-2,4,3, 5,6,1,5
// 最大子序和

// 1. 动态规划
// 2. 分治法

class Solution53 {
    
    // 分治法
    func maxSubArray2(_ nums: [Int]) -> Int {
     
        return get(nums, 0, nums.count-1)
    }
    
    func get(_ nums: [Int], _ left:Int, _ right:Int) -> Int{
        if left == right {
            return nums[left]
        }else if left > right {
            return Int.min
        }
        
        // 先不考虑 + 溢出
        let mid = (left + right) >> 1
        
        let leftmax = get(nums, left, mid-1)
        let rightmax = get(nums, mid+1, right)
        var mLeftMax = 0
        var mRightMax = 0
        var sum = 0
        var i = mid - 1
        
        while i >= left {
            sum += nums[i]
            mLeftMax = max(mLeftMax, sum)
            i -= 1
        }
        
        i = mid + 1
        sum = 0
        while i <= right {
            sum += nums[i]
            mRightMax = max(mRightMax, sum)
            i += 1
        }
        
        return max(leftmax, rightmax, mLeftMax + mRightMax + nums[mid])
    }
    
    // O(n) -- 动态规划
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var res:Int = nums[0]
        var sum = 0
        
        for num in nums {
            if sum > 0 {
                sum = sum + num;
            }else {
                sum = num
            }
            
            res = res < sum ? sum : res
        }
        return res
    }
    
    func test() {
        print(maxSubArray2([-2,1,-3,4,-1,2,1,-5,4]))
    }
}
