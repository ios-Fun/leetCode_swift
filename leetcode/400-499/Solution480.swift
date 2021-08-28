//
//  Solution480.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 滑动窗口中位数
// k个数字排序后，然后求中位数
// 跳表->有序，查找Ologn，删除Ologn
class Solution480 {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        return []
    }
    
    func test() {
        print(medianSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
        // [1,-1,-1,3,5,6]
    }
    
    // 1，3，-1  =》 -1，1，3
    // -3  =〉 -3，-1，3
}
