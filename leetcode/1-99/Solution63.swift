//
//  Solution63.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划

class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let n = obstacleGrid.count
        if n == 0 {
            return 0
        }
        let m = obstacleGrid[0].count
        if m == 0 {
            return 0
        }
        
        var result:[[Int]] = Array()
        
        for i in (0..<n) {
            var rowArray:[Int] = Array()
            for j in (0..<m) {
                var value = 1
                if obstacleGrid[i][j] == 0 {
                    if i == 0 && j > 0{
                        value = rowArray[j-1]
                    }
                    if j == 0 && i > 0{
                        value = result[i-1][j]
                    }
                    if i > 0 && j > 0 {
                        value = result[i-1][j] + rowArray[j-1]
                    }
                }else {
                    value = 0
                }
                rowArray.append(value)
            }
            result.append(rowArray)
        }
        return result[n-1][m-1]
    }
    
    func test() {
        print(uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
        print(uniquePathsWithObstacles([[1,0]]))
    }
}
