//
//  Solution85.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. dsf + 剪枝？ -- 要处理好剪枝，不然就超时
//2. 先行遍历，求每一行矩阵的最大面积
//3. 动态规划
class Solution85 {
    
    // 动态规划
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        if m == 0 {
            return 0
        }
        let n = matrix.last!.count
        if n == 0 {
            return 0
        }
        var res = 0
        let list1 = Array.init(repeating: 0, count: n + 1)
        var height:[[Int]] = Array.init(repeating: list1, count: m + 1)
        
        let lista1 = Array.init(repeating: 0, count: m + 1)
        let lista2 = Array.init(repeating: lista1, count: n + 1)
        var dp:[[[Int]]] = Array.init(repeating: lista2, count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if matrix[i-1][j-1] == "1" {
                    height[i][j] = height[i-1][j] + 1
                }else {
                    height[i][j] = 0
                    continue
                }
                for k in 1...height[i][j] {
                    dp[i][j][k] = dp[i][j-1][k] + k
                    res = max(res, dp[i][j][k])
                }
            }
        }
        return res
    }
    
    
    var maxValue = 0
    var m:Int!
    var n:Int!
    var matrix:[[Character]]!
    func maximalRectangle2(_ matrix: [[Character]]) -> Int {
        maxValue = 0
        if matrix.count == 0 {
            return 0
        }
        if matrix.last!.count == 0 {
            return 0
        }
        self.m = matrix.count
        self.n = matrix.last!.count
        self.matrix = matrix
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    // 往右
                    dsf2(i, j, i, j+1, false)
                    // 往下
                    dsf2(i, j, i+1, j, true)
                }
            }
        }
        return maxValue
    }
    
    // 行是否有效
    func validCol(_ fromCol: Int, _ toCol: Int, _ row: Int) -> Bool {
        for i in fromCol...toCol {
            if matrix[i][row] == "0" {
                return false
            }
        }
        return true
    }
    
    // 列是否有效
    func validRow(_ fromRow: Int, _ toRow: Int, _ col: Int) -> Bool {
        for j in fromRow...toRow {
            if matrix[col][j] == "0" {
                return false
            }
        }
        return true
    }
    
    func dsf2(_ mIndex: Int, _ nIndex: Int, _ mTo: Int, _ nTo:Int, _ isMStep: Bool) {
        
        // 到达了最后一个点
        if (mTo == m && nTo >= n-1 ) || (nTo == n && mTo >= m - 1) {
            let value = (m - mIndex) * (n - nIndex)
            maxValue = max(maxValue, value)
            // print("m4:",mIndex, "n:",nIndex, "toM:", mTo, "toN:", nTo, "max:", maxValue)
            return
        }
        
        // 到达了下边界
        if mTo == m {
            // 方向向下的
            if isMStep {
                if validCol(mIndex, m-1, nTo) {
                    dsf2(mIndex, nIndex,m-1, nTo + 1, false)
                }else{
                    let value = (m - mIndex) * (nTo - nIndex + 1)
                    maxValue = max(maxValue, value)
                    // print("m2:",mIndex, "n:",nIndex, "toM:", mTo, "toN:", nTo, "max:", maxValue)
                }
                return
            }
        }
        if nTo == n {
            // 到达了右边界
            if !isMStep {
                if validRow(nIndex, n-1, mTo) {
                    // 有效的列
                    dsf2(mIndex, nIndex, mTo + 1, n-1, true)
                }else {
                    let value = (mTo - mIndex + 1) * (n - nIndex)
                    maxValue = max(maxValue, value)
                    // print("m3:",mIndex, "n:",nIndex, "toM:", mTo, "toN:", nTo, "max:", maxValue)
                }
                return
            }
        }
        if mTo < m && nTo < n {
            
            if isMStep {
                if validRow(nIndex, nTo, mTo) {
                    dsf2(mIndex, nIndex, mTo+1, nTo, true)
                    dsf2(mIndex, nIndex, mTo, nTo + 1, false)
                }else {
                    let value = (mTo - mIndex) * (nTo - nIndex + 1)
                    maxValue = max(maxValue, value)
                    //print("m:",mIndex, "n:",nIndex, "toM:", mTo, "toN:", nTo, "max:", maxValue)
                }
            }else {
                if validCol(mIndex, mTo, nTo) {
                    dsf2(mIndex, nIndex, mTo, nTo+1, false)
                    dsf2(mIndex, nIndex, mTo+1, nTo, true)
                }else {
                    let value = (mTo - mIndex + 1) * (nTo - nIndex)
                    maxValue = max(maxValue, value)
                    // print("m:",mIndex, "n:",nIndex, "toM:", mTo, "toN:", nTo, "max:", maxValue)
                }
            }
        }
    }
    
    func test() {
        print(maximalRectangle([
          ["1"]
        ]))
        
        print(maximalRectangle(
            [["0","0","1","0"],
             ["1","1","1","1"],
             ["1","1","1","1"],
             ["1","1","1","0"],
             ["1","1","0","0"],
             ["1","1","1","1"],
             ["1","1","1","0"]]
        ))
        
        

        print(maximalRectangle([
          ["1","0","1","0","0"],
          ["1","0","1","1","1"],
          ["1","1","1","1","1"],
          ["1","0","0","1","0"]
        ]))
        
        print(maximalRectangle(
            [["1","1","1","1","1","1","1","1"],
             ["1","1","1","1","1","1","1","0"],
             ["1","1","1","1","1","1","1","0"],
             ["1","1","1","1","1","0","0","0"],
             ["0","1","1","1","1","0","0","0"]]
        ))
    }
}
