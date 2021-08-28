//
//  Solution200.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 岛屿数量
// 1. dfs
// 2. 广度优先
// 3. 并查集
class Solution200 {
    
    var cols:Int!
    var rows:Int!
    // 并查集 -- 采用getCount/其他方式
    func numIslands2(_ grid: [[Character]]) -> Int {
        // var count = 0
        self.rows = grid.count
        if rows == 0 {
            return 0
        }
        
        self.cols = grid.first!.count
        var uf = UnionFind.init(rows * cols + 1)
        //let dummyNode = rows * cols
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" {
                    if i > 0 && grid[i-1][j] == "1" {
                        uf.union(node(i, j), node(i-1, j))
                    }
                    
                    if i < rows - 1  && grid[i+1][j] == "1" {
                        uf.union(node(i, j), node(i+1, j))
                    }
                    
                    if j > 0 && grid[i][j-1] == "1" {
                        uf.union(node(i, j), node(i, j-1))
                    }
                    
                    if j < cols - 1  && grid[i][j+1] == "1" {
                        uf.union(node(i, j), node(i, j+1))
                    }
                }
            }
        }
        var resSet = Set<Int>()
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" {
                    // 未连接，表示是1
                    resSet.insert(uf.find(node(i, j)))
                }
            }
        }
        return resSet.count
    }
    func node(_ i: Int, _ j:Int) ->Int {
        return i * cols + j
    }
    
    
    var n:Int!
    var m:Int!
    
    func numIslands(_ grid: [[Character]]) -> Int {
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
        var count = 0
        var isVisited:[[Int]] = Array()
        // = 1, 表示未访问过，访问过之后，置为0
        for _ in (0..<n) {
            isVisited.append([Int].init(repeating: 1, count: m))
        }
        
        var maxNum = 0
        var visitNum = 0
        for i in (0..<n) {
            for j in (0..<m) {
                if grid[i][j] == "1" && isVisited[i][j] == 1 {
                    count = count + 1
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
        print("maxNum:", maxNum)
        return count
    }
    
    func dfs(_ row: Int, _ column: Int,  _ isVisited: inout [[Int]], _ grid: [[Character]], _ visitNum:inout Int ) {
        isVisited[row][column] = 0
        visitNum = visitNum + 1
        //up
        if row > 0 && isVisited[row-1][column] == 1 && grid[row-1][column] == "1"{
            dfs(row-1, column, &isVisited, grid, &visitNum)
        }
        
        //down
        if n > 1 {
            if row < n - 1 && isVisited[row+1][column] == 1 && grid[row+1][column] == "1" {
                dfs(row+1, column, &isVisited, grid,&visitNum)
            }
        }
        
        //left
        if column > 0 && isVisited[row][column-1] == 1 && grid[row][column-1] == "1"{
            dfs(row, column-1,&isVisited, grid, &visitNum)
        }
        
        //right
        if m > 1 {
            if column < m - 1 && isVisited[row][column+1] == 1 && grid[row][column+1] == "1"{
                dfs(row, column+1,&isVisited, grid, &visitNum)
            }
        }
    }
    
    func test() {
        print(numIslands2([["1","1","1","1","0"],
                     ["1","1","0","1","0"],
                     ["1","1","0","0","0"],
                     ["0","0","0","0","0"],
            ]))
        print(numIslands2([["1","1","0","0","0"],
                          ["1","1","0","0","0"],
                          ["0","0","1","0","0"],
                          ["0","0","0","1","1"],
            ]))
    }
}
