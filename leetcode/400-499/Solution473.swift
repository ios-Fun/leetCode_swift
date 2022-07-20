//
//  Solution473.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/1.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// dfs
// 动态规划-todo
class Solution473 {
    var matchsticks: [Int]!
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        if sum % 4 > 0 {
            return false
        }
        self.matchsticks = matchsticks.sorted {a, b in
            return a > b
        }
        let edgeValue = sum / 4
        return dfs(curIndex: 0, i1: 0, i2: 0, i3: 0, i4: 0, edgeValue: edgeValue)
    }
    
    func dfs(curIndex:Int, i1: Int, i2: Int, i3: Int, i4: Int, edgeValue: Int) -> Bool {
        if curIndex == self.matchsticks.count {
            if i1 == edgeValue && i2 == edgeValue && i3 == edgeValue && i4 == edgeValue {
                return true
            }
        }
        if i1 > edgeValue || i2 > edgeValue || i3 > edgeValue || i4 > edgeValue {
            return false
        }
        if dfs(curIndex: curIndex + 1, i1: i1 + self.matchsticks[curIndex], i2: i2, i3: i3, i4: i4, edgeValue: edgeValue) {
            return true
        }
        if dfs(curIndex: curIndex + 1, i1: i1, i2: i2 + self.matchsticks[curIndex], i3: i3, i4: i4, edgeValue: edgeValue) {
            return true
        }
        if dfs(curIndex: curIndex + 1, i1: i1, i2: i2, i3: i3 + self.matchsticks[curIndex], i4: i4, edgeValue: edgeValue) {
            return true
        }
        if dfs(curIndex: curIndex + 1, i1: i1, i2: i2, i3: i3, i4: i4 + self.matchsticks[curIndex], edgeValue: edgeValue) {
            return true
        }
        return false
    }
    
    func test() {
        print(makesquare([13,11,1,8,6,7,8,8,6,7,8,9,8]))
        print(makesquare([1,1,2,2,2]))
        print(makesquare([3,3,3,3,4]))
    }
}

// 13， 11, 9 ,8, 8, 8 ,8, 8, 7 ,7 ,6, 6, 1
// 13, 6, 6
// 11, 7, 7
// 9, 8, 8
// 8, 8, 8, 1
// 9, 8 8
// 8, 8 8
// 7, 7, 6

