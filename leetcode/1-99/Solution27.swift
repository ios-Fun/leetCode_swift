//
//  Solution27.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 1. for 不相同的count+1
// 2. 数组也跟着改变
class Solution27 {
    
    // 倒着换位置
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0{
            return 0
        }
        var sameCount = 0
        for i in (0..<nums.count).reversed() {
            if nums[i] == val {
                // 将 = val的值放在后面
                nums.swapAt(i, nums.count-1-sameCount)
                sameCount += 1
            }
        }
        return nums.count - sameCount
    }
    
    // 不能这样写
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0{
            return 0
        }
        for (index, num) in nums.enumerated().reversed() {
            
            if num == val {
                //删除
                nums.remove(at: index)
            }
        }
        return nums.count
    }
    
    func test() {
        var num1 = [3,2,2,3]
        var num2 = [0,1,2,2,3,0,4,2]
        print(removeElement(&num1, 3))
        print(num1)
        
        print(removeElement(&num2, 2))
        print(num2)
        
        var num3 = [1]
        print(removeElement(&num3, 1))
        print(num3)
    }
}
