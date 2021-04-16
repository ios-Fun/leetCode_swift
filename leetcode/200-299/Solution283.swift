//
//  Solution283.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution283 {
    
    // 双指针
    func moveZeroes2(_ nums: inout [Int]) {
       // todo
    }
    
    
    func moveZeroes(_ nums: inout [Int]) {
        
        var lastCount:Int = nums.count
        //for index in (0..<nums.count) {
        var index = 0
        while (index < nums.count) {
            if index >= lastCount {
                break
            }
            if nums[index] == 0 {
                nums.append(0)
                nums.remove(at: index)
                lastCount = lastCount - 1
            }
            if nums[index] != 0 {
                index = index + 1
            }
        }
    }
    
    func test() {
        // var list1 = [0,1,0,3,12]
        var list1 = [0,0,1]
        moveZeroes(&list1)
        print(list1)
        
        var list2 = [0,1,0,3,12]
        moveZeroes(&list2)
        print(list2)
    }
}

// 0,1,0, 3, 12
// left:0, right: 4

// 1，0， 3， 12 分别与0 交换
// 1, 0, 3, 12, 0

// 1, 3, 12,0 ,0

// swift 的方式 appendLast
