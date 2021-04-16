//
//  Solution659.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/5.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution659 {
    // todo
    func isPossible(_ nums: [Int]) -> Bool {
        var result:[[Int]] = Array()
        var array:[Int] = Array()
        array.append(nums.first!)
        result.append(array)

        for i in 1..<nums.count {
            let num = nums[i]
            var isAppend = false
            for i in 0..<result.count {
                var list = result[i]
                if list.last == num - 1 {
                    list.append(num)
                    isAppend = true
                    result[i] = list
                    break
                }
            }
            if !isAppend {
                var array:[Int] = Array()
                array.append(num)
                result.append(array)
            }
        }
        
        return false
    }
    
    func test() {
        print(isPossible([1,2,3,3,4,5]))
        print(isPossible([1,2,3,3,4,4,5,5]))
        print(isPossible([1,2,3,4,4,5]))
    }
}
