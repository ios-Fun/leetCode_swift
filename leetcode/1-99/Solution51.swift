//
//  Solution51.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// N皇后-经典算法问题
// 图论？？
// DFS??
//0 1 2 3 4 5 6 7 8

//1 0 0 0 0 0 0 0 0
//0 0 1 0 0 0 0 0 0
//0 0 0 0 0 1 0 0 0
//0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 1 0 0
//0 0 0 1 0 0 0 0 0
//0 1 0 0 0 0 0 0 0
//0 0 0 0 1 0 0 0 0

// 回溯法
class Solution51 {
    var findArray:[[String]]!
    var n:Int = 0
    var count:Int = 0
    func solveNQueens(_ n: Int) -> [[String]] {
        findArray = Array()
        let list1 = Array.init(repeating: 0, count: n)
        var queen:[[Int]] = Array.init(repeating: list1, count: n)
        self.n = n
        findQueen(row: 0, queue: &queen)
        return findArray
    }
    
    // 第几个row（行） 对应的queens
    func findQueen(row:Int, queue: inout [[Int]]) {
        // 已经找到了
        if row >= n {
            let str =  queue.map{
                $0.map{
                    (num) -> String in
                    if num == 1 {
                        return "Q"
                    }else {
                        return "."
                    }
                }
            }.map{
                $0.reduce("", +)
            }
            
            
            findArray.append(str)
            
            count += 1
            return
        }
        
        for column in (0..<n) {
            // 检查 row行的每一列
            if check(row, column, queue) {
                queue[row][column] = 1
                
                // 继续找下一行
                findQueen(row: row+1, queue: &queue)
                //找完后置0，进行下一次循环
                queue[row][column] = 0
            }
        }
        
    }
    
    // 检查(row, column)的有效性
    func check(_ row:Int, _ column: Int, _ queue: [[Int]]) -> Bool {
        // 检查列
        for i in (0..<n) {
            if queue[i][column] == 1 {
                // 列上有重复了
                return false
            }
        }
        
        // 检测右上方
        var x = row
        var y = column
        while x >= 0 && y < n {
            if queue[x][y] == 1 {
                return false
            }
            x = x - 1
            y = y + 1
        }
        
        // 检测左上方
        x = row
        y = column
        while (x>=0 && y >= 0) {
            if queue[x][y] == 1 {
                return false
            }
            x = x - 1
            y = y - 1
        }
        return true
    }
    
    func test() {
        print(solveNQueens(8))
        print("count: ", count)
    }
}
