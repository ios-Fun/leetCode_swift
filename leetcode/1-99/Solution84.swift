//
//  Solution84.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 1. 单调栈 + 哨兵
// 2. 暴力法 -- 超时

class Solution84 {
    
    // 单调栈
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }
        var newheights = heights
        newheights.insert(0, at: 0)
        newheights.append(0)
        
        var stack:[Int] = Array()
        var res = 0
        for i in 0..<newheights.count {
            while !stack.isEmpty && newheights[i] < newheights[stack.last!] {
                let last = stack.last!
                stack.removeLast()
                // 计算高度
                
                // 前置哨兵
                let height = (i - (stack.last ?? 0) - 1) * newheights[last]
                // print("height:", height, "last:", last)
                res = max(res, height)
            }
            stack.append(i)
        }
        return res
    }
    
    // 暴力法
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }
        var res = 0
        for i in 0..<heights.count {
            var maxValue = heights[i]
            var minValue =  heights[i]
            for j in i..<heights.count {
                minValue = min(minValue, heights[j])
                maxValue = max(maxValue, minValue * (j+1-i))
            }
           res = max(res, maxValue)
        }
        return res
    }
    
    func test() {
        print(largestRectangleArea([2,1,0,6,2,3]))
        // print(largestRectangleArea([3,2,1,5,6,2,3]))
    }
}

// 0, 3, 2,1, 5,6,2, 3, 0
// 0 ,push(0)
// 3, push(1)
// 2 ,pop3, (2 - 1 - 1 ) * 0

