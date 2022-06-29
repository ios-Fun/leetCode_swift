//
//  Solution413.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
// 采用了记忆化递归，todo 待优化
class Solution413 {
    var count = 0
    var nums: [Int] = []
    var trackList:[Bool] = []
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        count = 0
        self.nums = nums
        trackList = Array.init(repeating: false, count: nums.count)
        dfs(0, [])
        return count
    }
    
    func dfs(_ index: Int, _ curList: [Int]) {
        
        if index >= nums.count {
            return
        }
        
        if curList.count == 0 {
            if trackList[index] {
                return
            }
            trackList[index] = true
        }
        
//        if trackList[index] > curList.count {
//            return
//        }
//        trackList[index] = curList.count
        var curList = curList
        // 选中index
        curList.append(index)
        if curList.count >= 3 {
            if nums[curList[curList.count - 1]] - nums[curList[curList.count - 2]] == nums[curList[curList.count - 2]] - nums[curList[curList.count - 3]] {
                count += 1
                // print(curList)
                dfs(index + 1, curList)
            }
        } else {
            dfs(index + 1, curList)
        }
        // 不选中
        dfs(index + 1, [])
    }
    
    func test() {
        print(numberOfArithmeticSlices([1,2,3,4]))
        print(numberOfArithmeticSlices([1]))
        
        print(numberOfArithmeticSlices([1,2,3,4,5,6]))
    }
}
