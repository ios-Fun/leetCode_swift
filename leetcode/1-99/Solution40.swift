//
//  Solution40.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 组合总数2
// 回溯法

class Solution40 {
    var result:[[Int]] = Array()
    var newcandidates:[Int]? = nil
    var newTarget:Int? = nil
    var n:Int? = nil
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        result.removeAll()
        newcandidates = candidates.sorted()
        newTarget = target
        n = newcandidates!.count
        var curList:[Int] = []
        backtrace(&curList, 0, 0)
        return result
    }
    
    func backtrace(_ curList:inout [Int], _ curIndex: Int, _ totalNum: Int) {
        
        if totalNum > newTarget! || curIndex > n! {
            
            return
        }
        
        if totalNum == newTarget! {
            // print(curList)
            result.append(curList)
        }
        //1， 1， 1，3，3， 5
        for j in (curIndex..<n!) {
            // print(j)
            if j != curIndex && newcandidates![j] == newcandidates![j-1] {
                continue
            }
            
            if totalNum + newcandidates![j] > newTarget! {
                break
            }
            curList.append(newcandidates![j])
            backtrace(&curList, j+1, totalNum + newcandidates![j])
            curList.removeLast()
        }
    }
    
    func test() {
        print(combinationSum2([10,1,2,7,6,1,5], 8))
        
        print(combinationSum2([2,5,2,1,2], 5))
        
        print(combinationSum2([3,1,3,5,1,1], 8))
    }
    
    
}
