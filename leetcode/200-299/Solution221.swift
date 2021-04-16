//
//  Solution221.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution221 {
    
    // 动态规划
    func maximalSquare2(_ matrix: [[Character]]) -> Int {
        // todo
        return 0
    }
    
    // dfs
    var matrix:[[Character]]!
    var m:Int!
    var n:Int!
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        self.matrix = matrix
        n = matrix.count
        if n == 0 {
            return 0
        }
        m = matrix[0].count
        if m == 0 {
            return 0
        }
        var max = 0
        for i in (0..<n) {
            if n - i <= max {
                break
            }
            for j in (0..<m) {
                if m - j <= max {
                    break
                }
                let count = dfs(i, j, 0)
                // print(i, j, count)
                if count > max {
                    max = count
                }
            }
        }
        return max * max
    }
    
    func dfs(_ i: Int, _ j: Int, _ index: Int) ->Int {
        
        if index == 0 {
            if matrix[i][j] == "1" {
                // max = 1
                return dfs(i, j , 1)
            }else {
                return 0
            }
        }else {
            if j + index == m || i + index == n {
                return index
            }
            if matrix[i+index][j+index] == "0" {
                return index
            }
            for iIndex in (i..<i+index) {
                if matrix[iIndex][j+index] == "0" {
                    return index
                }
            }
            for jIndex in (j..<j+index) {
                if matrix[i+index][jIndex] == "0" {
                    return index
                }
            }
            return dfs(i, j , index+1)
        }
        //return max
    }
    
    func test() {
        print(maximalSquare([
            ["1","0","1","0","0"],
            ["1","0","1","1","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
            ]))

        print(maximalSquare([
            ["1","0","1","0","0"],
            ["1","0","1","1","1"],
            ["1","1","1","1","1"],
            ["1","0","1","1","1"]
            ]))
        
        print(maximalSquare([
           ["0","0","0","1","0","1","1","1"],
           ["0","1","1","0","0","1","0","1"],
           ["1","0","1","1","1","1","0","1"],
           ["0","0","0","1","0","0","0","0"],
           ["0","0","1","0","0","0","1","0"],
           ["1","1","1","0","0","1","1","1"],
           ["1","0","0","1","1","0","0","1"],
           ["0","1","0","0","1","1","0","0"],
           ["1","0","0","1","0","0","0","0"]
            ]))
    }
}
