//
//  Solution216.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution216 {
    var result:[[Int]]!
    var k:Int!
    var n:Int!
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        result = Array()
        self.k = k
        self.n = n
        var curList:[Int]  = Array()
        var curValue: Int = 0
        backTrace(0, &curList, &curValue)
        return result
    }
    
    func backTrace(_ curIndex: Int, _ curList:inout [Int], _ curValue:inout Int) {
        if curIndex == k && curValue == n {
            result.append(curList)
            return
        }
        if curIndex > k {
            return
        }
        if curValue > n {
            return
        }
        let lastValue = curList.last ?? 0
        if lastValue == 9 {
            return
        }
        for i in lastValue+1...9 {
            curList.append(i)
            curValue += i
            backTrace(curIndex + 1, &curList, &curValue)
            curList.removeLast()
            curValue -= i
        }
    }
    
    
    func test() {
        print(combinationSum3(3, 7))
        print(combinationSum3(3, 9))
    }
}
