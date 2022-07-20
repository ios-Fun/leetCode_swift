//
//  Solution1395.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

//

class Solution1395 {
    func numTeams(_ rating: [Int]) -> Int {
        var count = 0
        for i in 1..<(rating.count-1) {
            var leftSmallCount = 0
            var leftBigCount = 0
            var rightSmallCount = 0
            var rightBigCount = 0
            for l in 0..<i {
                if rating[l] < rating[i] {
                    leftSmallCount += 1
                }else if  rating[l] > rating[i] {
                    leftBigCount += 1
                }
            }
            for r in (i+1)..<rating.count {
                if rating[r] < rating[i] {
                    rightSmallCount += 1
                }else if  rating[r] > rating[i] {
                    rightBigCount += 1
                }
            }
            count += leftSmallCount * rightBigCount + leftBigCount * rightSmallCount
        }
        return count
    }
    
    func test() {
        print(numTeams([2,5,3,4,1]))
        
        print(numTeams([2,1,3]))
        
        print(numTeams([1,2,3,4]))
    }
}

//  2 ,3 ,4

// 1, 4, 5 ,2, 7

// 1, 2, 3, 4

//  1, 4, 3, 5, 2


//  1, 4 , 5
