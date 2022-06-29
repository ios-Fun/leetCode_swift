//
//  Solution713.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/19.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// dfs 复杂了，可以用暴力法
// todo 滑动窗口
class Solution713 {
    var count = 0
    var k: Int!
    var nums:[Int]!
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        count = 0
        self.k = k
        self.nums = nums
        for i in 0..<nums.count {
            dsf(i, curNum: -1)
        }
        
        return count
    }
    
    func dsf(_ index: Int, curNum: Int) {
        if curNum >= k {
            return
        }
        if index >= nums.count {
            if curNum != -1 &&  curNum < k{
                count += 1
            }
            return
        }
        if curNum != -1 &&  curNum < k{
            // print("index:\(index), curNum: \(curNum)")
            count += 1
        }
        dsf(index + 1, curNum: curNum == -1 ? nums[index] : curNum * nums[index])
    }
    
    func test() {
        print(numSubarrayProductLessThanK([10,5,2,6], 100))
        print(numSubarrayProductLessThanK([1,2,3], 0))
    }
}
