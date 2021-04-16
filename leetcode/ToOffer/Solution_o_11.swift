//
//  Solution_o_11.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二分查找
class Solution_o_11 {
    
    
    
    //  方法2， 排序后第一个元素 时间复杂度NlogN，空间复杂度ON
    func minArray2(_ numbers: [Int]) -> Int {
        let numbers = numbers.sorted()
        return numbers.first!
    }
    
    // 方法3 ，逐个查找
    func minArray3(_ numbers: [Int]) -> Int {
        return numbers.min()!
    }
    
    // 同 leetcode 154
    // 二分查找
    var numbers: [Int]!
    func minArray(_ numbers: [Int]) -> Int {
        self.numbers = numbers
        return binary(0, numbers.count - 1)
    }
    
    func binary(_ left:Int, _ right: Int) -> Int {
        if left == right {
            return numbers[left]
        }
        
        if right == left + 1 {
            return min(numbers[left], numbers[right])
        }
        let mid = (left + right) >> 1
        
        let leftMin = min(numbers[left], numbers[mid - 1])
        let rightMin = min(numbers[mid + 1], numbers[right])
        if (numbers[mid] < min(leftMin, rightMin)) {
            return numbers[mid]
        }
        if leftMin < rightMin {
            return binary(left, mid - 1)
        }else if leftMin > rightMin{
            return binary(mid + 1, right)
        }else {
            return min(binary(left, mid - 1),binary(mid + 1, right))
        }
    }
    
    func test() {
        
        print(minArray([3,4,4,4,4,4,4,5,5,6,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,10,10,10,-10,-10,-10,-9,-8,-8,-8,-8,-8,-7,-7,-7,-7,-6,-6,-6,-6,-6,-6,-6,-5,-5,-5,-4,-4,-4,-4,-3,-3,-3,-3,-3,-3,-2,-2,-2,-2,-1,-1,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3]))
        
        print(minArray([3,4,5,1,2]))

        print(minArray([2,2,2,0,1]))

        print(minArray([3,3,3,3,3,3,3,3,1,3]))

        print(minArray([3,1,3]))
        
        
    }
}
