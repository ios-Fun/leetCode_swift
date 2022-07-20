//
//  Solution1423.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 滑动窗口 -- 只能选择首尾
class Solution1423 {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        // 最右边K个
        let count = cardPoints.count
        var sum = 0
        for i in (count-k)..<count {
            sum += cardPoints[i]
        }
        var maxValue = sum
        var endValue = cardPoints[count-k]
        for i in 0..<k {
            sum = sum - endValue + cardPoints[i]
            if count - k + i + 1 < count {
                endValue = cardPoints[count - k + i + 1]
            }
            maxValue = max(maxValue, sum)
        }
        
        return maxValue
    }
    
    func test() {
        print(maxScore([1,2,3,4,5,6,1] , 3))
        
        print(maxScore([2,2,2] , 2))
        
        print(maxScore([9,7,7,9,7,7,9] , 7))
        
        print(maxScore([1,1000,1] , 1))
        
        print(maxScore([1,79,80,1,1,1,200,1] , 3))
    }
}
