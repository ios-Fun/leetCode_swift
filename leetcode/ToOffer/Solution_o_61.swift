//
//  Solution_o_61.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_61 {
    func isStraight(_ nums: [Int]) -> Bool {
        let numsSort = nums.sorted()
        var zeroCount = 0
        var beginNum = -1
        for i in 0..<5 {
            if numsSort[i] == 0 {
                zeroCount += 1
            }else {
                if beginNum == -1 {
                    beginNum = numsSort[i]
                }else {
                    if numsSort[i] == beginNum {
                        return false
                    }
                    if numsSort[i] == beginNum + 1 {
                        beginNum = numsSort[i]
                        continue
                    }else {
                        if numsSort[i] - beginNum - 1 > zeroCount {
                            return false
                        }else {
                            zeroCount -= numsSort[i] - beginNum - 1
                            beginNum = numsSort[i]
                        }
                    }
                }
            }
        }
        return true
    }
    
    func test() {
        print(isStraight([9,0,6,0,10]))
//        print(isStraight([8,7,11,0,9]))
//        print(isStraight([1,2,3,4,5]))
//        print(isStraight([0,0,1,2,6]))
//        print(isStraight([0,0,2,2,5]))
        
        
        
    }
}
