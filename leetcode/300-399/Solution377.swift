//
//  Solution377.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/30.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划 - 如果有负数
// dfs - 去处理超时的
class Solution377 {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var dp:[Int] = Array.init(repeating: 0, count: target+1)
        dp[0] = 1
        for i in 1...target {
            for num in nums {
                if num <= i {
                    if (Int.max - dp[i-num]) > dp[i] {
                        dp[i]  = dp[i] + dp[i-num]
                    }
                }
            }
        }
        return dp[target]
    }
    
    func test() {
        print(combinationSum4([10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,111],
        999))
        print(combinationSum4([1,2], 10))
        print(combinationSum4([3,1,2,4], 4))
        print(combinationSum4([1,2,3], 4))
        print(combinationSum4([9], 3))
        print(combinationSum4([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25], 10))
        
    }
}

// 1 : 1
// 2:  2
// 3 : dp[3], dp[1] * dp[2],  111, 12, 21, 3  4
// dp[1] + dp[2] + dp[3]
// 4,
