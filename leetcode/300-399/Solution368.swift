//
//  Solution368.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution368 {
    // 动态规划
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        let sortNums = nums.sorted()
        var dp:[Int] = Array.init(repeating: 1, count: nums.count)
        // var numList:[Int] = Array.init()
        var dpList:[[Int]] = Array.init(repeating: [], count: nums.count)
        dpList[0] = [sortNums[0]]
        for i in 1..<sortNums.count {
            var maxCount = dp[i]
            var maxList:[Int] = [sortNums[i]]
            for j in (0..<i).reversed() {
                if sortNums[i] % sortNums[j] == 0 {
                    // maxList
                    if dp[j]+1 > maxCount {
                        maxCount = dp[j]+1
                        // dpList[j].append(sortNums[i])
                        maxList = dpList[j]
                        maxList.append(sortNums[i])
                        // maxList = dpList[j].append(sortNums[i])
                    }
                }
            }
            dp[i] = maxCount
            dpList[i] = maxList
        }
        let maxValue = dp.max()
        for i in 0..<dp.count {
            if dp[i] == maxValue {
                return dpList[i]
            }
        }
        return []
    }
    
    // 并查集
    func largestDivisibleSubset2(_ nums: [Int]) -> [Int] {
        
        return []
    }
    
    func test() {
        print(largestDivisibleSubset([3,4,16,8]))
        print(largestDivisibleSubset([1]))
        print(largestDivisibleSubset([2,3]))
        print(largestDivisibleSubset([1,2,3]))

        print(largestDivisibleSubset([1,2,4,8]))
    }
}

// 多叉树
// 1，2
// 1，3

//    1
// 2   3

//    1
// 2
 // 4
// 8

//
