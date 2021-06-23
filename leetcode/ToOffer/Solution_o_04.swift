//
//  Solution_o_04.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_04 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        if matrix[0].count == 0 {
            return false
        }
        let rows = matrix.count
        let cols = matrix[0].count
        var row = 0
        var col = cols - 1
        while row < rows && col >= 0 {
            let num = matrix[row][col]
            if num == target {
                return true
            }else if (num > target) {
                col -= 1
            }else {
                row += 1
            }
        }
        return false
    }
    
    func test() {
        
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 5))
        
        print(findNumberIn2DArray([
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
          ], 20))
    }
}
