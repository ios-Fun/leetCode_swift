//
//  Solution542.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 01 矩阵
// bfs
class Solution542 {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let m  = matrix.count
        let n = matrix.first!.count
        
        var visited:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        var result = matrix
        
        var levelList:[[Int]] = []
        
        var curValue = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    levelList.append([i, j])
                    visited[i][j] = true
                }
            }
        }
        
        while levelList.count > 0 {
            curValue += 1
            var nextList:[[Int]] = []
            for item in levelList {
                let i = item[0]
                let j = item[1]
                
                // 上
                if i != 0 {
                    if !visited[i-1][j] {
                        visited[i-1][j] = true
                        result[i-1][j] = curValue
                        nextList.append([i-1, j])
                    }
                }
                
                // 下
                if i != m - 1 {
                    if !visited[i+1][j] {
                        visited[i+1][j] = true
                        result[i+1][j] = curValue
                        nextList.append([i+1, j])
                    }
                }
                
                // 左
                if j != 0 {
                    if !visited[i][j-1] {
                        visited[i][j-1] = true
                        result[i][j-1] = curValue
                        nextList.append([i, j-1])
                    }
                }
                
                // 右
                if j != n - 1 {
                    if !visited[i][j+1] {
                        visited[i][j+1] = true
                        result[i][j+1] = curValue
                        nextList.append([i, j+1])
                    }
                }
            }
            levelList = nextList
        }
        
        return result
    }
    
    func test() {
        print(updateMatrix([[0,0,0],[0,1,0],[0,0,0]]))
        print(updateMatrix([[0,0,0],[0,1,0],[1,1,1]]))
    }
}
