//
//  Solution41.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 缺失的第一个正数
// 思路： 1.使用自身作为临时存储空间
// 2. 使用set
class Solution41 {
    // 不是inout 属于let, nums不能修改
    func firstMissingPositive(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return 1
        }
        var index = 0
        
        let pointer:UnsafeMutablePointer<Int> = nums.withUnsafeBufferPointer({UnsafeMutablePointer(mutating: $0.baseAddress!)})
        while (index < nums.count) {
            if nums[index]  > nums.count  || nums[index] <= 0{
                index  = index + 1
                continue
            }else {
                // 交换
                let item = nums[index]
                if nums[index] != (index+1) && nums[index] <= nums.count && nums[index] != nums[item-1]{
                    (pointer + index).pointee = nums[item-1]
                    (pointer + item - 1).pointee = item
                    
                }else {
                    index  = index + 1
                    continue
                }
            }
        }
        
        for index in (0..<nums.count) {
            if nums[index] != index + 1 {
                return index+1
            }
        }
        return nums.count + 1
    }
    
    func test() {
        // print(firstMissingPositive([1,2,0]))
        print(firstMissingPositive([1,1]))
        //print(firstMissingPositive([3,4,-1,1]))
        // print(firstMissingPositive([7,8,9,11,12]))
    }
}
