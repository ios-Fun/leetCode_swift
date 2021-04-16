//
//  Solution695.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution695 {
    
    // 并查集
    func maxAreaOfIsland2(_ grid: [[Int]]) -> Int {
        // todo
        return 0
    }
    
    // dfs
    var n:Int!
    var m:Int!
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 0 {
            return 0
        }
        let m = grid[0].count
        if m == 0 {
            return 0
        }
        self.m = m
        self.n = n
        // var count = 0
        var isVisited:[[Int]] = Array()
        for _ in (0..<n) {
            isVisited.append([Int].init(repeating: 1, count: m))
        }
        
        var maxNum = 0
        var visitNum = 0
        for i in (0..<n) {
            for j in (0..<m) {
                if grid[i][j] == 1 && isVisited[i][j] == 1 {
                    // count = count + 1
                    if visitNum > maxNum {
                        maxNum = visitNum
                    }
                    visitNum = 0
                    dfs(i, j, &isVisited, grid, &visitNum)
                }
            }
        }
        if visitNum > maxNum {
            maxNum = visitNum
        }
        //print("maxNum:", maxNum)
        return maxNum
    }
    
    func dfs(_ row: Int, _ column: Int,  _ isVisited: inout [[Int]], _ grid: [[Int]], _ visitNum:inout Int ) {
        isVisited[row][column] = 0
        visitNum = visitNum + 1
        //up
        if row > 0 && isVisited[row-1][column] == 1 && grid[row-1][column] == 1{
            dfs(row-1, column, &isVisited, grid, &visitNum)
        }
        
        //down
        if n > 1 {
            if row < n - 1 && isVisited[row+1][column] == 1 && grid[row+1][column] == 1 {
                dfs(row+1, column, &isVisited, grid,&visitNum)
            }
        }
        
        //left
        if column > 0 && isVisited[row][column-1] == 1 && grid[row][column-1] == 1{
            dfs(row, column-1,&isVisited, grid, &visitNum)
        }
        
        //right
        if m > 1 {
            if column < m - 1 && isVisited[row][column+1] == 1 && grid[row][column+1] == 1{
                dfs(row, column+1,&isVisited, grid, &visitNum)
            }
        }
    }
    
    func test() {
        print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                         [0,0,0,0,0,0,0,1,1,1,0,0,0],
                         [0,1,1,0,1,0,0,0,0,0,0,0,0],
                         [0,1,0,0,1,1,0,0,1,0,1,0,0],
                         [0,1,0,0,1,1,0,0,1,1,1,0,0],
                         [0,0,0,0,0,0,0,0,0,0,1,0,0],
                         [0,0,0,0,0,0,0,1,1,1,0,0,0],
                         [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
    }
}
