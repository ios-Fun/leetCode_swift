//
//  Solution39.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 思路，回溯法 + 剪枝
class Solution39 {
    
    var result:[[Int]] = Array()
    var newcandidates:[Int]? = nil
    var newTarget:Int? = nil
    var n:Int? = nil
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        result.removeAll()
        newcandidates = candidates.sorted()
        newTarget = target
        n = newcandidates!.count
        var curList:[Int] = []
        backtrace(&curList, 0, 0)
        return result
    }
    
    // curIndex -- index, totalNum 是和
    func backtrace(_ curList:inout [Int], _ curIndex: Int, _ totalNum: Int) {
        
        // 剪枝
        if totalNum > newTarget! || curIndex == n {
            return
        }
        
        if totalNum == newTarget! {
            result.append(curList)
        }
        
        for j in (curIndex..<n!) {
            if totalNum + newcandidates![j] > newTarget! {
                break
            }
            curList.append(newcandidates![j])
            backtrace(&curList, j, totalNum + newcandidates![j])
            curList.removeLast()
        }
    }
    
    func test() {
        print(combinationSum([2, 3, 6, 7], 7))
        
        print(combinationSum([2, 3, 5], 8))
    }
}
