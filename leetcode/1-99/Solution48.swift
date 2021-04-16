//
//  Solution48.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 矩阵旋转
class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        
        if matrix.count < 2 {
            return
        }
        
        for i in (0..<matrix.count) {
            for j in (0...i) {
                //swap a[i][j] = a[j][i]
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        for i in (0..<matrix.count) {
            for j in (0..<matrix.count/2) {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[i][matrix.count-1-j]
                matrix[i][matrix.count-1-j] = temp
            }
        }
    }
    
    func test() {
        var list1 = [[1,2,3],[4,5,6],[7,8,9]]
        rotate(&list1)
        
        var list2 = [[ 5, 1, 9,11],
                     [ 2, 4, 8,10],
                     [13, 3, 6, 7],
                     [15,14,12,16]]
        rotate(&list2)
        
//        var list3 = [[]]
//        rotate(&list3)
        
        var list4 = [[1]]
        rotate(&list4)
    }
}
