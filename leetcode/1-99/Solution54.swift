//
//  Solution54.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/19.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 用一个临时二维数组，初始全是0，遍历过的为1，然后最后到全是1
// 2. 用循环的方式，确定好四条边和循环条件的加减，待尝试这种方法
class Solution54 {
    
    // TODO: 待优化
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var result:[Int] = Array()
        var listInt:[[Int]] = Array()
        let column = matrix.count
        if column == 0  {
            return []
        }
        let row = matrix[0].count
        if row == 0 {
            return []
        }
        for _ in (0..<column) {
            var array:[Int] = Array()
            for _ in (0..<row) {
                array.append(0)
            }
            listInt.append(array)
        }
        
        var i = 0
        var j = 0
        
        var upFlag = true
        var downFlag = true
        var leftFlag = true
        var rightFlag = true
        
        //1 --right, 2--down, 3--left, 4--up
        var direction = 1
        while true {
            result.append(matrix[i][j])
            listInt[i][j] = 1
            
            if i < column && j < row {
                // 判断上下左右是否都为1，
                
                // 上
                if i > 0 && listInt[i-1][j] == 0{
                    upFlag = false
                }else {
                    upFlag = true
                }
                //下
                if i < column - 1 && listInt[i+1][j] == 0{
                    downFlag = false
                }else {
                    downFlag = true
                }
                // 左
                
                if j > 0 && listInt[i][j-1] == 0{
                    leftFlag = false
                }else {
                    leftFlag = true
                }
                // 右
                if j < row - 1 && listInt[i][j+1] == 0{
                    rightFlag = false
                }else {
                    rightFlag = true
                }
                // 上下左右都不通了
                if upFlag && downFlag && leftFlag && rightFlag {
                    break
                }
                
                
                if direction == 1 {
                    if !rightFlag {
                        j  = j + 1
                    }else {
                        direction = 2
                    }
                }
                
                if direction == 2 {
                    if !downFlag {
                        i = i + 1
                    }else {
                        direction = 3
                    }
                }
                
                if direction == 3 {
                    if !leftFlag {
                        j = j - 1
                    }else {
                        direction = 4
                    }
                }
                if direction == 4 {
                    if !upFlag {
                        i = i - 1
                    }else {
                        direction = 1
                        j  = j + 1
                    }
                }
            }
            
        }
        
        return result
    }
    
    func test() {
        print(spiralOrder([]))
        // 1 2 3 4
        // 5 6 7 8
        // 9 10 11 12
        //13 14 15 16
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]))
        print(spiralOrder([[ 1, 2, 3 ],[ 4, 5, 6 ],[ 7, 8, 9 ]]))
        print(spiralOrder([[1, 2, 3, 4],[5, 6, 7, 8],[9,10,11,12]]))
    }
}
