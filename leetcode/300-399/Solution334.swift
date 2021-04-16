//
//  Solution334.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution334 {
    // 单调栈 -- todo
    func increasingTriplet2(_ nums: [Int]) -> Bool {
        var stack:[Int] = Array()       // 单调栈
        
        return false
    }
    
    // 用两个变量
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var num1 = Int.max  // 最小的数
        var num2 = Int.max  // 次小的数
        for num in nums {
            if num <= num1 {
                num1 = num
            }else if num <= num2 {
                num2 = num
            }else {
                // 比num1, num2 都大
                return true
            }
        }
        return false
    }
    
    func test() {
        print(increasingTriplet([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]))
        print(increasingTriplet([1, 5, 2, 3, 0, 2, 8]))
        // print(increasingTriplet([1, 2, 3 ,4, 5]))
        // print(increasingTriplet([5,4,3,2,1]))
    }
}


// 1, 1, 2, 3,
