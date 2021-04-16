//
//  Solution78.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 回溯法
class Solution78 {
    
    var result:[[Int]] = Array()
    
    var sNums:[Int]?
    var n:Int?
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        sNums = nums
        n = nums.count
        // var isVisitList:[Int] = Array.init(repeating: 0, count: n!)
        var numList:[Int] = Array()
        result.removeAll()
        backTrace(&numList, 0)
        return result
    }
    
    func backTrace(_ numList: inout [Int], _ curIndex:Int) {
        
        result.append(numList)
        if curIndex == n {
            return
        }
        
        for i in (curIndex..<n!) {
            numList.append(sNums![i])
            backTrace(&numList, i + 1)
            numList.removeLast()
        }
    }
    
    func test() {
        print(subsets([]))
        print(subsets([1]))
        print(subsets([1, 2, 3]))
    }
}
