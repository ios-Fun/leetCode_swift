//
//  Solution448.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 利用 * -1
// 2. 利用 交换
class Solution448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        // var numsTemp = nums
        var resultArray:[Int] = Array()
        
        let pointer:UnsafeMutablePointer<Int> = nums.withUnsafeBufferPointer({UnsafeMutablePointer(mutating: $0.baseAddress!)})
        
        for i in (0..<nums.count) {
            while(nums[i] != i + 1 && nums[nums[i] - 1] != nums[i]) {
                // swap
//                let temp = numsTemp[i]
//                numsTemp[i] = numsTemp[temp-1]
//                numsTemp[temp-1] = temp
                let item = nums[i]
                (pointer + i).pointee = nums[item-1]
                (pointer + item - 1).pointee = item
            }
        }
        
        for i in (0..<nums.count) {
            if nums[i] != i + 1 {
                resultArray.append(i + 1)
            }
        }
        
        return resultArray
    }
    
    func test() {
        print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
    }
}
// 0,1,2,3,4,5,6,7
// 4,3,2,7,8,2,3,1

// 7,3,2,4,8,2,3,1

// 3,3,2,4,8,2,7,1

// 2,3,3,4,8,2,7,1

// 3,2,3,4,8,2,7,1

// 3,2,3,4,1,2,7,8

// 1,2,3,4,3,2,7,8

// 1,2,3,4,3,2,7,8
