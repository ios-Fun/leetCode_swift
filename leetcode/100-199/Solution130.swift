//
//  Solution130.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 沿着边框搜索 O, 将O设置成 Y
// 2. bfs
// 3. 并查集
class Solution130 {
    
    var cols:Int!
    var rows:Int!
    // 并查集
    func solve(_ board: inout [[Character]]) {
        self.rows = board.count
        if rows <= 2 {
            return
        }
        
        self.cols = board.first!.count
        var uf = UnionFind.init(rows * cols + 1)
        let dummyNode = rows * cols
        for i in 0..<rows {
            for j in 0..<cols {
                if board[i][j] == "O" {
                    if i == 0 || i == rows - 1 || cols == 0 || j == cols - 1 {
                        uf.union(node(i, j), dummyNode)
                    }else {
                        if i > 0 && board[i-1][j] == "O" {
                            uf.union(node(i, j), node(i-1, j))
                        }
                        
                        if i < rows - 1  && board[i+1][j] == "O" {
                            uf.union(node(i, j), node(i+1, j))
                        }
                        
                        if j > 0 && board[i][j-1] == "O" {
                            uf.union(node(i, j), node(i, j-1))
                        }
                        
                        if j < cols - 1  && board[i][j+1] == "O" {
                            uf.union(node(i, j), node(i, j+1))
                        }
                    }
                }
            }
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if uf.isConnected(node(i, j), dummyNode) {
                    board[i][j] = "O"
                }else{
                    board[i][j] = "X"
                }
            }
        }
        
    }
    
    func node(_ i: Int, _ j:Int) ->Int {
        return i * cols + j
    }
    
    var n:Int!
    var m:Int!
    
    // dsf
    func solve2(_ board: inout [[Character]]) {
        self.n = board.count
        if n <= 2 {
            return
        }
        self.m = board.first!.count
        if m <= 2 {
            return
        }
        for i in 0..<n {
            for j in 0..<m {
                let isEdge = i == 0 || i == n-1 || j == 0 || j == m-1
                if isEdge && board[i][j] == "O" {
                    dsfChange(i, j, &board)
                }
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }else if board[i][j] == "#" {
                    board[i][j] = "O"
                }
            }
        }
    }
    
    // 改变字符内容
    func dsfChange(_ curCol:Int, _ curRow:Int, _ board: inout [[Character]]) {
        if curCol < 0 || curCol >= n || curRow < 0 || curRow >= m {
            return
        }
        
        if board[curCol][curRow] == "#" {
            return
        }
        
        if board[curCol][curRow] == "O" {
            board[curCol][curRow] = "#"
            dsfChange(curCol + 1, curRow, &board)
            dsfChange(curCol - 1, curRow, &board)
            dsfChange(curCol, curRow - 1, &board)
            dsfChange(curCol, curRow + 1, &board)
        }
    }
    
    func test() {
        
        
        var board:[[Character]] = [["X", "X", "X", "X"],
                                   ["X", "O", "O", "X"],
                                   ["X", "X", "O", "X"],
                                   ["X", "O", "X", "X"],]
        solve(&board)

        print("board:", board)

        var board2:[[Character]] = [["O","O","O","O","X","X"],["O","O","O","O","O","O"],["O","X","O","X","O","O"],["O","X","O","O","X","O"],["O","X","O","X","O","O"],["O","X","O","O","O","O"]]

        solve(&board2)

        print("board2:", board2)
    }
}

//["O","O","O","O","X","X"],
//["O","O","O","O","O","O"],
//["O","X","O","X","O","O"],
//["O","X","O","O","X","O"],
//["O","X","O","X","O","O"],
//["O","X","O","O","O","O"]
