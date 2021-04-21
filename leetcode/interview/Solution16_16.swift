//
//  Solution16_16.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 同581
class Solution16_16 {
    
    func subSort2(_ array: [Int]) -> [Int] {
        // todo
        return [-1, -1]
    }
    
    // 单调栈
    func subSort(_ array: [Int]) -> [Int] {
        if array.count < 2 {
            return [-1,-1]
        }
        var startStack:[Int] = [Int]()
        startStack.append(0)
        for i in 1..<array.count {
            while !startStack.isEmpty && array[i] < array[startStack.last!]{
                startStack.removeLast()
            }
            startStack.append(i)
        }
        var startIndex = -1
        var endIndex = -1
        for i in 0..<startStack.count {
            if startStack[i] != i {
                startIndex = i
                break
            }
        }
        var endStack:[Int] = [Int]()
        endStack.append(array.count-1)
        for i in (0..<array.count-1).reversed() {
            while !endStack.isEmpty && array[i] > array[endStack.last!]{
                endStack.removeLast()
            }
            endStack.append(i)
        }
        
        var endCount = array.count - 1
        for i in (0..<endStack.count) {
            if endStack[i] != endCount {
                endIndex = endCount
                break
            }
            endCount -= 1
        }
        return [startIndex, endIndex]
    }
    
    func test() {
        print(subSort([1,2,4,7,10,11,7,12,6,7,16,18,19]))
        
        print(subSort([1,2,3,4]))
        
        print(subSort([1,2,3,2]))
    }
}
