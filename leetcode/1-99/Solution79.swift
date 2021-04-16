//
//  Solution79.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 回溯法
class Solution79 {
    var charList:[Character]!
    
    var m:Int!
    var n:Int!
    var count:Int!
    var board:[[Character]]!
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.board = board
        charList = Array(word)
        n = board.count
        m = board[0].count
        count = charList.count
        let visitList:[Int] = Array.init(repeating: 0, count: m)
        var isVisit:[[Int]]!
        
        for i in 0..<n {
            for j in 0..<m {
                isVisit = Array.init(repeating: visitList, count: n)
                if dfs(j, i, 0, &isVisit) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func dfs(_ col: Int, _ row:Int, _ index: Int, _ isVisitList:inout [[Int]]) -> Bool{
        if board[row][col] == charList[index] {
            if index == count-1 {
                return true
            }
            isVisitList[row][col] = 1
            // 往右
            if col < m - 1 && isVisitList[row][col + 1] == 0{
                if dfs(col + 1, row, index + 1, &isVisitList) {
                    return true
                }
            }
            // 往下
            if row < n - 1 && isVisitList[row + 1][col] == 0{
                if dfs(col, row+1, index + 1, &isVisitList) {
                    return true
                }
            }
            
            // 往左
            if col > 0 && isVisitList[row][col - 1] == 0 {
                if dfs(col-1, row, index + 1, &isVisitList) {
                    return true
                }
            }
            
            // 往上
            if row > 0 && isVisitList[row - 1][col] == 0{
                if dfs(col, row-1, index + 1, &isVisitList) {
                    return true
                }
            }
            isVisitList[row][col] = 0
        }else {
            return false
        }
        return false
    }
    
    func test() {
        print(exist([
            ["A"]], "A"))
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
            ], "ABCCED"))
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
            ], "SEE"))
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
            ], "ABCB"))
        
        
    }
}
