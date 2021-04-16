//
//  Solution240.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二分法
class Solution240 {
    
    // 左下 或者 右上
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
     
        // todo
        return true
    }
    
    private var matrix:[[Int]]!
    private var target:Int!
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        self.matrix = matrix
        self.target = target
        let n = matrix.count
        if n == 0 {
            return false
        }
        let m = matrix[0].count
        if m == 0 {
            return false
        }
        
        if searchMatrix(0, n-1, 0, m-1) {
            return true
        }
        return false
    }
    
    // 在区域内查找
    func searchMatrix(_ xStart:Int, _ xEnd: Int, _ yStart:Int, _ yEnd: Int) -> Bool {
        
        if xStart > xEnd || yStart > yEnd {
            return false
        }
        if self.target < matrix[xStart][yStart] || self.target > matrix[xEnd][yEnd] {
            return false
        }
        
        if xStart == xEnd && yStart == yEnd && matrix[xStart][yStart] != target {
            return false
        }
        let xMid = xStart + (xEnd - xStart) >> 1
        let yMid = yStart + (yEnd - yStart ) >> 1
        if matrix[xMid][yMid] == target! {
            return true
        }else if matrix[xMid][yMid] > target! {
            return searchMatrix(xStart, xEnd, yStart, yMid - 1) || searchMatrix(xStart, xMid - 1, yStart, yEnd)
        }else {
            return searchMatrix(xStart, xEnd, yMid + 1, yEnd) || searchMatrix(xMid + 1, xEnd, yStart, yEnd)
        }
    }
    
    func test() {
        
        print(searchMatrix([
          [1, 1]
        ], 1))
        
        print(searchMatrix([
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ], 5))
        
        print(searchMatrix([
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ], 20))
    }
}
