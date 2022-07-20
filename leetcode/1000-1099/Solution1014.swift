//
//  Solution1014.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/4.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution1014 {
    // 超时
    func maxScoreSightseeingPair2(_ values: [Int]) -> Int {
        var maxValue = Int.min
        for i in 0..<(values.count-1)  {
            for j in (i+1)..<values.count {
                maxValue = max(maxValue, values[i] + values[j] + i - j)
            }
        }
        return maxValue
    }
    
    
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var maxValue = Int.min
        var maxI = values[0]
        for j in 1..<values.count {
            maxValue  =  max(maxValue, maxI + values[j] - j )
            maxI = max(maxI, values[j] + j)
        }
        return maxValue
    }
        
    
    func test() {
        print(maxScoreSightseeingPair([8,1,5,2,6]))
        print(maxScoreSightseeingPair([1,2]))
    }
}
