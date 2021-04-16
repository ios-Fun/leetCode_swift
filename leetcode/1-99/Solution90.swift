//
//  Solution90.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 回溯法，去重
class Solution90 {
    var result:[[Int]] = Array()
    
    var sNums:[Int]?
    var n:Int?
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        sNums = nums.sorted()
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
        
        var lastNum:Int? = nil
        for i in (curIndex..<n!) {
            if lastNum == nil {
                lastNum = sNums![i]
            }else {
                if sNums![i] == lastNum {
                    continue
                }
                lastNum = sNums![i]
            }
            
            numList.append(sNums![i])
            backTrace(&numList, i + 1)
            numList.removeLast()
        }
    }
    
    func test() {
        print(subsetsWithDup([1, 2, 2]))
    }
}
