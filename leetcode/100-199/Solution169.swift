//
//  Solution169.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 多数元素
// 1. 大顶堆 -- 大材小用
// 2. 字典（key--数字，value: 次数），也不够优化
// 3. 刚好过一半，用特殊解法，
// 4. 排序后中间的元素
class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        //摩尔投票法,先假设第一个数过半数并设cnt=1；遍历后面的数如果相同则cnt+1，不同则减一，当cnt为0时则更换新的数字为候选数（成立前提：有出现次数大于n/2的数存在）
        var num:Int?
        var count:Int?
        
        // 为什么会时间慢？
        for (index, value) in nums.enumerated() {
            if index == 0 {
                num = value
                count = 1
            }else {
                if value == num {
                    count = count! + 1
                }else {
                    if count! > 1 {
                        count = count! - 1
                    }else {
                        num = value
                        count = 1
                    }
                }
            }
        }
        
        return num!
    }
    
    func test() {
        print(majorityElement([3,2,3]))
        print(majorityElement([2,2,1,1,1,2,2]))
    }
}
