//
//  Solution35.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二分查找
class Solution35 {
    
    var nNums: [Int]?
    var nTarget: Int?
    
    // todo 二分待优化
    func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
        return 0
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        nNums = nums
        nTarget = target
        
        return binary(0, nNums!.count-1)
    }
    
    // 可以不用递归
    func binary (_ left: Int, _ right: Int) -> Int {
        // 比 left 小
        if nTarget! < nNums![left] {
            return left
        }
        
        // 比right大
        if nTarget! > nNums![right] {
            return right+1
        }
        if left == right {
            return left
        }
        
        let mid = (left + right)/2
        if nTarget == nNums![mid] {
            // 找到目标值
            return mid
        }
        if nTarget! < nNums![mid] {
            return binary(left, mid-1)
        }else {
            return binary(mid+1, right)
        }
    }
    
    func test() {
        print(searchInsert([1], 1))
        print(searchInsert([0], 5))
        print(searchInsert([6], 5))
        print(searchInsert([1,3,5,6], 5))
        print(searchInsert([1,3,5,6], 2))
        print(searchInsert([1,3,5,6], 7))
        print(searchInsert([1,3,5,6], 0))
    }
}
