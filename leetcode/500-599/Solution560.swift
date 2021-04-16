//
//  Solution560.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 两次循环
// 2. hash
class Solution560 {
    
    // todo
    
    // 暴力法
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        for i in 0..<nums.count {
            var sum = 0
            for j in (i..<nums.count) {
                sum = sum + nums[j]
                if sum == k {
                    count = count + 1
                }
            }
        }
        return count
    }
    
    // hash + 前缀和
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var dic:[Int:Int] = Dictionary()
        dic[0] = 1
        var count = 0
        for i in 0..<nums.count {
            sum = sum + nums[i]
            if dic[sum - k] != nil {
                count = count  + dic[sum - k]!
            }
            dic[sum] = (dic[sum] ?? 0) + 1
        }
        
        return count
    }
    
    func test() {
        // print(subarraySum([1,1,1], 2))
        
        // print(subarraySum([1,2,3], 3))
        
        print(subarraySum([0,0,0,0,0,0,0,0,0,0], 0))
    }
}

// 1， 1，1 == 2

//
