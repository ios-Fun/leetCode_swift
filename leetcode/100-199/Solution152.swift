//
//  Solution152.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 乘积最大子数组

class Solution152 {
    
    // 动态规划
    func maxProduct3(_ nums: [Int]) -> Int {
        // TODO: 动态规划
        
        return 0
    }
    
    // 迭代优化
    func maxProduct2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        // 以往最大值。 目前最大值，当前最小值
        var maxNum = Int.min ,imax = 1, imin = 1
        //2,-5,-2,-4,3
        for num in nums {
            if num > 0 {
                imax = max(imax*num, num)
                imin = min(imin*num, imin)
            }else{
                let tmp = imax
                imax = max(num, imin*num)
                imin = min(num, tmp*num)
            }
            maxNum = max(imax, maxNum)
            print("maxNum: \(maxNum), imax: \(imax), imin: \(imin)")
        }
        return maxNum
    }
    
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        if nums.count == 1 {
            return nums[0]
        }

        var sum1 = nums[0]
        var totalValue = nums[0]
        // var negativeCount:Int = (nums[0] < 0) ?  1 : 0
        for index in (1..<nums.count) {
            if nums[index] * totalValue > sum1 || nums[index] > sum1{
                if nums[index] * totalValue > nums[index] {
                    sum1 = nums[index] * totalValue
                }else {
                    sum1 = nums[index]
                }
            }
            if totalValue == 0 {
                totalValue = nums[index]
            }else {
                totalValue = totalValue * nums[index]
            }
        }

        // 奇数
        var sum2 = nums[nums.count-1]
        var totalValue2 = nums[nums.count-1]
        // var negativeCount2:Int = (nums[nums.count-1] < 0) ?  1 : 0
        for index in (0..<nums.count-1).reversed() {
            if nums[index] * totalValue2 > sum2 || nums[index] > sum2{
                if nums[index] * totalValue2 > nums[index] {
                    sum2 = nums[index] * totalValue2
                }else {
                    sum2 = nums[index]
                }
            }
            if totalValue2 == 0 {
                totalValue2 = nums[index]
            }else {
                totalValue2 = totalValue2 * nums[index]
            }
        }
        return sum1 > sum2 ? sum1: sum2
    }

    func test() {
        
        print(maxProduct([-1,0,-1,2,-3,1,2,3,-2]))
        
        // 奇数个负数
//        print(maxProduct([2,-5,-2,-4,3]))
//        //maxNum max min
//        // 2     2   1
//        // 2     -5    -10
//        print(maxProduct([2,3,-2,4]))
//        // [2, 3] -> 6
//
//         print(maxProduct([-2,0,-1]))
//        // 0
//
//        print(maxProduct([2,3,-2,4, -1]))
        
        
    }
}
