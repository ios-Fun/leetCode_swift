//
//  Solution414.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 待优化，用时间过长
class Solution414 {
    
    func thirdMax2(_ nums: [Int]) -> Int {
        
        return 0
    }
    
    //
    func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var ans:[Int] = Array()
        // ans[0] = Int.min
        
        for i in 0..<nums.count {
            // 如果包含了，continue
            if ans.contains(nums[i]) {
                continue
            }
            
            if ans.count < 3 {
                ans.append(nums[i])
                
                // 从大到小排列
                ans = ans.sorted(by: { (a, b) -> Bool in
                    return a > b
                })
                continue
            }
            
            // 这里已经是有三个数字的情况了
            if ans[0] < nums[i] {
                // 大于 最大值
                ans[2] = ans[1]
                ans[1] = ans[0]
                ans[0] = nums[i]
            }else if ans[1] < nums[i] {
                ans[2] = ans[1]
                ans[1] = nums[i]
            }else if ans[2] < nums[i] {
                ans[2] = nums[i]
            }
        }
        return ans.count == 3 ? ans[2] : ans[0]
    }
    
    func test() {
        print(thirdMax([3,2,1]))
        print(thirdMax([1,2]))
        print(thirdMax([2,2,3,1]))
    }
}
