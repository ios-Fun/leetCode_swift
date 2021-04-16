//
//  Solution453.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution453 {
    func minMoves(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        var count = 0
        let sortNums = nums.sorted()
        for i in 1..<sortNums.count {
            count = count + (sortNums[i] - sortNums[0])
        }
        return count
    }
    
    func test() {
        print(minMoves([1,2,3]))
        print(minMoves([1,2,2]))
        
        print(minMoves([-100,0,100]))
        
    }
}

// -100,0,100  sum 0
// max 100, 100* 3 = 300

// 6 + 2 = 8

// 6 + a * (n-1) = 9 + 3 * c

// y = 0 + 2* a
// y = 300 + 3 * b

// a + b 最小

// 1 ,2 ,2
// sum 6

// 2, 3, 3
// 3， 4，3
// 4，4，4
