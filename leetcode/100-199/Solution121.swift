//
//  Solution121.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count <= 1 {
            return 0
        }
        
        // var mixValueIndex = 0
        var minValue = prices.first!
        var maxSub = 0
        for num in (1..<prices.count) {
            if prices[num] < minValue {
                minValue = prices[num]
            }else if prices[num] > minValue {
                let sub = prices[num] - minValue
                if sub > maxSub {
                    maxSub = sub
                }
            }
        }
        
        return maxSub
    }
    
    func test() {
        print(maxProfit([7,1,5,3,6,4]))
        print(maxProfit([7,6,4,3,1]))
    }
}
