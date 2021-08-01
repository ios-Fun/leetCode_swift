//
//  ArrayTest.swift
//  leetcode
//
//  Created by wangyouzhuo on 2021/7/2.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class ArrayTest {
    // 2n个元素， n个奇数， n个偶数，实现奇数下表放奇数，偶数放偶数
    func changeArray( _ nums: [Int]) -> [Int]{
        var nums = nums
        let count = nums.count
        var oddIndex = 0    // 偶数
        var evenIndex = 1   // 奇数
        while oddIndex < count && evenIndex < count {
            var toOddIndex = -1
            while oddIndex < count {
                if nums[oddIndex] & 1 == 1 {
                    // 奇数
                    toOddIndex = oddIndex
                    oddIndex += 2
                    break
                }else {
                    oddIndex += 2
                }
            }
            var toEvenIndex = -1
            if toOddIndex != -1 {
                while evenIndex < count {
                    if nums[evenIndex] & 1 == 0 {
                        // 偶数
                        toEvenIndex = evenIndex
                        evenIndex += 2
                        break
                    }else {
                        evenIndex += 2
                    }
                }
                if toEvenIndex != -1 {
                    nums.swapAt(toOddIndex, toEvenIndex)
                }
            }else {
                break
            }
        }
        return nums
    }
    
    func test() {
        // 2, 2, 2, 1, 1, 1
        // 1, 1, 1, 2, 2, 2
//        print(changeArray([1, 2, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1]))
//
//        print(changeArray([2, 2, 2, 1, 1, 1]))
        print(changeArray([-1, -1, -1, 2, 2, 2]))
//        print(changeArray([2, 1, 2, 1, 2, 1]))
        // 输出 2, 1, 2, 1, 2, 1, 2, 1, 2, 1
    }
}
