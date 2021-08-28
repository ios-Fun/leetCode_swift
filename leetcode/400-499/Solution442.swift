//
//  Solution442.swift
//  leetcode
//
//  Created by xiao on 2021/8/26.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 利用自身的数组存储数据
// -1 -- 出现一次
// 0 -- 出现 2 次
class Solution442 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var left = 0
        let count = nums.count
        while left < count {
            let value = nums[left]
            if value <= 0 {
                left += 1
            } else {
                if nums[value-1] > 0 {  // 要替换的位置有值
                    nums[left] = nums[value-1]
                    nums[value-1] = -1
                } else if nums[value-1] == 0 {  // 出现了两次
                    left += 1
                } else {
                    nums[value-1] = 0
                }
            }
        }
        var resultList: [Int] = []
        for i in 0..<nums.count {
            if nums[i] == 0 {
                resultList.append(i+1)
            }
        }
        return resultList
    }
    
    func test() {
        print(findDuplicates([4,3,2,7,8,2,3,1]))
        // print(findDuplicates([4,3,2,7,8,2,3,1]))
    }
}
