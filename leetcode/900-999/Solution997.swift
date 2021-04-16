//
//  Solution997.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/7.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 出度为0，入度 = N-1

// 有向图--二维数组， 用一维数组是否可以？，因为出度最小值只会为0，入度最大值只会为N-1
class Solution997 {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        if trust.count == 0 {
            if N == 1 {
                return 1
            }
            return -1
        }
        
        // 0位是出度， 1位数入度
        let directionList:[Int] = Array.init(repeating: 0, count: 2)
        var nums:[[Int]] = Array.init(repeating: directionList, count: N)
        
        for i in 0..<trust.count {
            nums[trust[i][0]-1][0] = nums[trust[i][0]-1][0] + 1
            nums[trust[i][1]-1][1] = nums[trust[i][1]-1][1] + 1
        }
        
        var succssCount = 0
        var succssValue = -1
        for i in 0..<N {
            if nums[i][0] == 0 && nums[i][1] == N-1 {
                succssCount = succssCount + 1
                succssValue = i + 1
                if succssCount > 1 {
                    return -1
                }
            }
        }
        if succssCount == 1 {
            return succssValue
        }
        return -1
    }
    
    func test() {
        
        print(findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]]))
        // 3
        
        print(findJudge(1, []))
        // 1
        
        print(findJudge(2, [[1,2], [2,1]]))
        // -1
        
        print(findJudge(2, [[1,2]]))
        // 2

        print(findJudge(3, [[1,3],[2,3]]))
        // 3
        
        print(findJudge(3, [[1,3],[2,3], [3,1]]))
        // -1
        
        print(findJudge(3, [[1,2],[2,3]]))
        //-1
        
        
    }
}

// 1->2

// 1->3, 2->3

// 1->3, 2->3, 3->1

// 1->2, 2->3

// 1->3, 1-> 4, 2->3, 2->4, 4->3
// 3
