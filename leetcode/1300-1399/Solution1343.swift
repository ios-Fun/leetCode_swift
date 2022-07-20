//
//  Solution1343.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1343 {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        let sum = k * threshold
        
        var count = 0
        var curSum = 0
        
        for i in 0..<k {
            curSum += arr[i]
        }
        if curSum >= sum {
            count += 1
        }
        for i in k..<arr.count {
            curSum = curSum + arr[i] - arr[i-k]
            if curSum >= sum {
                count += 1
            }
        }
        
        return count
    }
    
    func test() {
        print(numOfSubarrays([2,2,2,2,5,5,5,8] ,3, 4))
        
        print(numOfSubarrays([11,13,17,23,29,31,7,5,2,3] ,3, 5))
    }
}
