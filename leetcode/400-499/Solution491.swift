//
//  Solution491.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 递增子序列
class Solution491 {
    var set = Set<[Int]>()
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        set.removeAll()
        var curNums:[Int] = []
        dsf(nums: nums, index: 0, curNums: &curNums)
        // set转数组
        return set.map{$0}
    }
    
    func dsf(nums: [Int], index: Int, curNums:inout [Int]) {
        if curNums.count > 1 {
            set.insert(curNums)
        }
        if index >= nums.count {
            return
        }
        var visitSet = Set<Int>()
        for i in index..<nums.count {
            if visitSet.contains(nums[i]) {
                continue
            }
            // 选择
            if curNums.count == 0 || (curNums.count > 0 && nums[i] >= curNums.last!) {
                visitSet.insert(nums[i])
                curNums.append(nums[i])
                dsf(nums: nums, index: i+1, curNums: &curNums)
                curNums.removeLast()
            }
        }
    }
    
    // 超时了
    func dsf2(nums: [Int], index: Int, curNums: [Int]) {
        if curNums.count > 1 {
            set.insert(curNums)
        }
        if index >= nums.count {
            return
        }
        for i in index..<nums.count {
            // 选择
            if curNums.count == 0 || (curNums.count > 0 && nums[i] >= curNums.last!) {
                var newList = curNums
                newList.append(nums[i])
                dsf2(nums: nums, index: i+1, curNums: newList)
            }
            // 不选择
            dsf2(nums: nums, index: i+1, curNums: curNums)
        }
    }
    
    func test() {
        // print(findSubsequences([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]))
        print(findSubsequences([4,6,7,7]))
        print(findSubsequences([4,4,3,2,1]))
        // [[4,4]]
    }
    
    //  4  6  7  7
    //4 T  T  T  T
    //6 F  T  T  T
    //7       T  T
    //7
}
