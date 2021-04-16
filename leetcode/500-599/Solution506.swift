//
//  Solution506.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution506 {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        var sortNums = nums
        // 快速排序
        quickSort(&sortNums, low: 0, high: nums.count-1)
        var dic:[Int: String] = Dictionary()
        for i in 0..<sortNums.count {
            var str:String = ""
            if i == 0 {
                str = "Gold Medal"
            }else if i == 1 {
                str = "Silver Medal"
            }else if i == 2 {
                str = "Bronze Medal"
            }else {
                str = String(i+1)
            }
            dic[sortNums[i]] = str
        }
        var reuslt:[String] = Array()
        for value in nums {
            reuslt.append(dic[value]!)
        }
        return reuslt
    }
    
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if low >= high {
            return
        }
        var i = low
        var j = high
        let key = nums[i]
        while i < j {
            while i < j && nums[j] <= key {
                j -= 1
            }
            nums[i] = nums[j]
            while i < j && nums[i] >= key {
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key
        quickSort(&nums, low: low, high: i-1)
        quickSort(&nums, low: i+1, high: high)
    }
    
    func test() {
        print(findRelativeRanks([5, 4, 3, 2, 1]))
        
        print(findRelativeRanks([7, 6, 9, 3, 2]))
    }
}

// 7, 6, 9, 3, 2

// 排序后
// 9 7   6  3  2
// 9-Gold Medal，7 - Silver Medal， 6 - Bronze Medal 3 - 4  2 -5
