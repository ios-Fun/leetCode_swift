//
//  Solution1.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


//1. 暴力法
//2. 使用字典，O(n), 空间换时间
//3. 排序后，左右指针
class Solution1 {
    
    // 暴力法
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        
        if nums.count < 2 {
            return []
        }
        if nums.count == 2 {
            if nums[0] + nums[1] == target {
                return [0, 1]
            }
        }
        
        for i in (0...nums.count-2) {
            for j in (i+1...nums.count-1) {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    // hash
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic:[Int: Int] = Dictionary()
        for (index,num) in nums.enumerated() {
            if dic[target - num] != nil {
                return [dic[target - num]!, index]
            }else {
                dic[num] = index
            }
        }
        return [0]
    }
    
    func test() {
        // 2, 7, 11, 15
        print(twoSum([2, 7, 11, 15], 9))
        
        print(twoSum([2, 7, 2, 15], 4))
        // 2-0, 7-1, 11-2, 15-3
        // 如果重复了呢
        
    }
}
