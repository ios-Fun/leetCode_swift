//
//  Solution740.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/17.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 1.dfs
// 2. 如何动态规划
class Solution740 {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        let sortNums = nums.sorted()
        var sortSetNums:[Int] = []
        var dicNums:[Int: Int] = [:]
        
        for sortNum in sortNums {
            if sortSetNums.count == 0 {
                sortSetNums.append(sortNum)
            } else {
                if sortNum != sortSetNums.last! {
                    sortSetNums.append(sortNum)
                }
            }
            if dicNums[sortNum] == nil {
                dicNums[sortNum] = 1
            } else {
                dicNums[sortNum]! += 1
            }
        }
        var dp:[Int] = Array.init(repeating: 0, count: sortSetNums.count)
        for i in 0..<sortSetNums.count {
            if i == 0 {
                dp[i] = sortSetNums[i] * dicNums[sortSetNums[i]]!
            } else {
                // var lastDp:Int? = nil
                if sortSetNums[i-1] + 1 == sortSetNums[i] {
                    if i > 1 {
                        dp[i] = max(sortSetNums[i] * dicNums[sortSetNums[i]]! + dp[i-2], dp[i-1])
                    } else {
                        // i == 1
                        dp[i] = max(sortSetNums[i] * dicNums[sortSetNums[i]]!, dp[i-1])
                    }
                    
                }else {
                    dp[i] = sortSetNums[i] * dicNums[sortSetNums[i]]! + dp[i-1]
                }
            }
        }
        return dp.last!
    }
    
    func test() {
        print( deleteAndEarn([3,4,2]) )
        
        print( deleteAndEarn([2,2,3,3,3,4]) )
        
        print( deleteAndEarn([2, 2, 4, 3, 3, 6, 7]))
    }
}

// 2, 2， 4， 3 ，3 ，6，7
// 2， 3，4，6，7
// 2:2， 3：2， 4:1， 6:1，7:1

// 1-> 2， 3，4， 6， 7 , 2*2 =4
// 2，选择3， 3*2 = 6 > 4
// 选择4: 4 + dp[2] = 4 + 4 = 8 > 6
// 选择6: 6 + dp[4] = 6 + 8 = 14
// 选择7: 7 + dp[4] = 7 + 8 = 15
