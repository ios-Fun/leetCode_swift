//
//  Solution238.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution238 {

    func productExceptSelf2(_ nums: [Int]) -> [Int] {
        // todo
        return []
    }
    
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftArray:[Int] = Array.init(repeating: 1, count: nums.count)
        var rightArray:[Int] = Array.init(repeating: 1, count: nums.count)
        var resultArray:[Int] = Array.init(repeating: 1, count: nums.count)
        for i in (0..<nums.count) {
            if i == 0 {
                leftArray[i] = nums[i]
            }else {
                 leftArray[i] = leftArray[i-1] * nums[i]
            }
           
        }
        for i in (0..<nums.count).reversed() {
            if i == nums.count - 1 {
                rightArray[i] = nums[i]
            }else {
                rightArray[i] = rightArray[i+1] * nums[i]
            }
        }
        
        for i in (0..<nums.count) {
            if i == 0 {
                resultArray[i] = rightArray[1]
            }else if i == nums.count - 1{
                resultArray[i] = leftArray[i-1]
            }else {
                resultArray[i] = leftArray[i-1] * rightArray[i+1]
            }
        }
        return resultArray
    }
    
    func test() {
        print(productExceptSelf([1,2,3,4]))
    }
}

// 2， 2， 3，4
// 2, 4, 12, 48
// 48   24   12  4
// 2*3 * 4， 1 * 3 * 4， 1* 2* 4， 1* 2* 3



