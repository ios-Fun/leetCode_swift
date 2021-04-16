//
//  Solution55.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/19.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 时间过慢
// 反向遍历

class Solution55 {
    
    // 并查集
    func canJump3(_ nums: [Int]) -> Bool {
        var uf = UnionFind(nums.count)
        if nums.count == 1 {
            return true
        }
        for i in 0..<nums.count {
            let step = nums[i]
            for j in 0...step {
                if i + j < nums.count {
                    uf.union(i, i+j)
                }
            }
        }
        return uf.isConnected(0, nums.count-1)
    }
    
    // 反向遍历
    func canJump2(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        // todo
        return true
    }
    
    // 正向遍历
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        
        if nums.count == 1 {
            return true
        }
        var dp:[Bool] = Array.init(repeating: false, count: nums.count)
        dp[0] = true
        let count = nums.count
        for i in 0..<count - 1 {
            
            if !dp[i] {
                return false
            }
            
            if nums[i] > 0{
                for j in 0...nums[i] {
                    if i + j >= count{
                        break
                    }
                    dp[i+j] = true
                }
            }
        }
        return dp[count-1]
    }
    
    func test() {
        print(canJump3([2, 0, 0]))
        //true
        print(canJump3([1,0,1,0]))
        //false
        print(canJump3([0]))
        //true
        print(canJump3([2,3,1,1,4]))
        // true
        print(canJump3([3,2,1,0,4]))
        // false
    }
}
