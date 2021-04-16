//
//  Solution64.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 0 {
            return 0
        }
        let m = grid[0].count
        if m == 0 {
            return 0
        }
        var result:[[Int]] = Array()
        for i in (0..<n) {
            var rowArray:[Int] = Array()
            for j in (0..<m) {
                var value = grid[i][j]
                if i == 0 && j > 0{
                    value = value + rowArray[j-1]
                }
                if j == 0 && i > 0{
                    value = value + result[i-1][j]
                }
                if i > 0 && j > 0 {
                    value = min(result[i-1][j], rowArray[j-1]) + value
                }
                rowArray.append(value)
            }
            result.append(rowArray)
        }
        return result[n-1][m-1]
    }
    
    func test() {
        print(minPathSum([[1,3,1],[1,5,1],[4,2,1]]))
    }
}
