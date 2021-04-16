//
//  Solution42.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 接雨水
// 思路。 1. 先循环找到区间（区间不好找）。 2， 再计算面积
// b. 先找最大值，然后左右区间找最大，把结果累加，再递归，可行，但是复杂
// c. 先求和，即黑色区域的面积；然后遍历，出现比左边小的，与其值相同，再逆序遍历，减掉多余的
class Solution42 {
    
    // 动态规划
    func trap1(_ height: [Int]) -> Int {
        // todo
        return 0
    }
    
    //左右指针
    func trap3(_ height: [Int]) -> Int {
        // todo
        return 0
    }
    
    // 递减栈
    func trap2(_ height: [Int]) -> Int {
        if height.count < 4 {
            return 0
        }
        var newHeight = height
        newHeight.append(0)
        newHeight.insert(0, at: 0)
        
        var stack:[Int] = Array()
        
        for i in 0..<newHeight.count {
            if stack.count == 0 {
                stack.append(i)
                continue
            }
            
            // 递减栈
            var lastIndex = -1
            
            while stack.count > 0 && newHeight[i] > newHeight[stack.last!] {
                // 出栈
                let popValue = stack.last!
                stack.removeLast()
                lastIndex = popValue
            }
            if lastIndex > 0 {
                // 统计
                print("i: lastIndex:", i, lastIndex)
                // let value =
                // 处理重复的不好处理
            }
            stack.append(i)
        }
        return 0
    }
    
    func trap(_ height: [Int]) -> Int {
        var fullheight = height
        if height.count == 0 {
            return 0
        }
        
        var oldSum = 0
        for item in height {
            oldSum += item
        }
        
        // 这里for 可以与前面一起
        var leftMax = height[0]
        for index  in (1..<height.count) {
            if height[index] < leftMax {
                fullheight[index] = leftMax
            }else {
                leftMax = height[index]
            }
        }
        
        var rightMax = height[height.count-1]
        for index in (1..<height.count).reversed() {
            
            if height[index] > rightMax {
                rightMax = height[index]
            }
            if fullheight[index] > height[index] && fullheight[index] > rightMax {
                fullheight[index] = rightMax
            }
            
            
        }
        
        var newSum = 0
        for item in fullheight {
            newSum += item
        }
        
        return newSum - oldSum
    }
    
    func test() {
        print(trap2([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
}
