//
//  Solution73.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 可以额外创建O(m+n)的空间，如果不创建怎么办，用数组原有的首行首列来存储
// 采用自身作为存储空间
class Solution73 {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count == 0 {
            return
        }
        if matrix[0].count == 0 {
            return
        }
        let m = matrix[0].count //列
        let n = matrix.count    //行
        
        // 列
        var colHasZero = false
        for i in (0..<n) {
            if matrix[i][0] == 0 {
                colHasZero = true
                break
            }
        }
        
        // 行
        var rowHasZero = false
        for j in (0..<m) {
            if matrix[0][j] == 0 {
                rowHasZero = true
                break
            }
        }
        if n > 1 && m > 1 {
            // 给第一行，第一列赋值
            for i in (1..<n) {
                for j in (1..<m) {
                    if matrix[i][j] == 0 {
                        matrix[i][0] = 0
                        matrix[0][j] = 0
                    }
                }
            }
            
            // 处理第一列
            for i in (1..<n) {
                if matrix[i][0] == 0 {
                    for j in (1..<m) {
                        matrix[i][j] = 0
                    }
                }
            }
            
            // 处理第一行
            for j in (1..<m) {
                if matrix[0][j] == 0 {
                    for i in (1..<n) {
                        matrix[i][j] = 0
                    }
                }
            }
        }

        if rowHasZero {
            for j in (0..<m) {
                matrix[0][j] = 0
            }
        }
        
        if colHasZero {
            for i in (0..<n) {
                matrix[i][0] = 0
            }
        }
    }
    
    func test() {
        var lista = [[0,1]]
        setZeroes(&lista)
        print(lista)
        
        var listb = [[0], [1]]
        setZeroes(&listb)
        print(listb)
        
        var list1 = [
            [1,1,1],
            [1,0,1],
            [1,1,1]
        ]
        setZeroes(&list1)
        print(list1)
        
        var list2 = [
            [0,1,2,0],
            [3,4,5,2],
            [1,3,1,5]
        ]
        setZeroes(&list2)
        print(list2)
        
        var list3 = [[1,1,1],[1,0,1],[1,1,1]]
        setZeroes(&list3)
        print(list3)
    }
}
