//
//  Solution790.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/17.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution790 {
    func numTilings2(_ n: Int) -> Int {
        let MOD = 1000000007
        var dp:[Int] = [0,0,0,0]
        for _ in 0..<n {
            var newDp:[Int] = [1,0,0,0]
            newDp[0] = (dp[0] + dp[3]) % MOD
            newDp[1] = (dp[0] + dp[2]) % MOD
            newDp[2] = (dp[0] + dp[1]) % MOD
            newDp[2] = (dp[0] + dp[1] + dp[2]) % MOD
            dp = newDp
        }
        
        return dp[0]
    }
    
    func numTilings(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        let MOD = 1000000007
        // dp1 面板填充完的
        var dp1 = Array.init(repeating: 0, count: n+1)
        // dp2面板未填充完的
        var dp2 = Array.init(repeating: 0, count: n+1)
        dp1[1] = 1
        dp1[2] = 2
        dp2[2] = 2
        for i in 3...n {
            dp1[i] = (dp1[i-1] + dp1[i-2] + dp2[i-1]) % MOD
            dp2[i] = (dp1[i-2] * 2 + dp2[i-1]) % MOD
        }
        return dp1[n] % MOD
    }
    
    func test() {
        // print(numTilings(1))
        
        print(numTilings(3))
    }
}
