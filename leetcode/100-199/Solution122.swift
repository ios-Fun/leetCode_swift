//
//  Solution122.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution122 {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count <= 1 {
            return 0
        }
        
        var sumValue = 0
        
        var minValue = prices[0]
        var maxValue = prices[0]
        for i in (1..<prices.count) {
            if prices[i] > maxValue {
                maxValue = prices[i]
            }
            if prices[i] < maxValue && maxValue > minValue {
                sumValue = sumValue + maxValue - minValue
                minValue = prices[i]
                maxValue = prices[i]
            }
            if prices[i] < minValue && maxValue == minValue{
                minValue = prices[i]
                maxValue = prices[i]
            }
        }
        if maxValue > minValue {
            sumValue = sumValue + maxValue - minValue
        }
        return sumValue
    }
    
    func test() {
        print(maxProfit([7,1,5,3,6,4]))
        print(maxProfit([1,2,3,4,5]))
        print(maxProfit([7,6,4,3,1]))
    }
}
