//
//  Solution813.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/17.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

//1. dfs
//2. 动态规划
class Solution813 {
    func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
        return 0.0
    }
    
    func test() {
        print(largestSumOfAverages([9,1,2,3,9], 3))
        
        print(largestSumOfAverages([1,2,3,4,5,6,7], 3))
    }
}

//   9，1， 2， 3，9， k = 3
//0  9，10  12 15 24
//1     1   3  6 15
//2         2  5 14
