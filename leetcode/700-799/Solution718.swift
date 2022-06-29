//
//  Solution718.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/19.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution718 {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count
        let n = nums2.count
        var dp:[[Int]] = Array(repeating: Array.init(repeating: 0, count: n+1), count: m+1)
        var result = 0
        for i in 1...m {
            for j in 1...n {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                    result = max(result, dp[i][j])
                }
            }
        }
        return result
    }
    
    func test() {
        print(findLength([1,2,3,2,1], [3,2,1,4,7]))
        
        print(findLength([0,0,0,0,0], [0,0,0,0,0]))
    }
}
