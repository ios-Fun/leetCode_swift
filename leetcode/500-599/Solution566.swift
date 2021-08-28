//
//  Solution566.swift
//  leetcode
//
//  Created by xiao on 2021/8/28.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 重塑矩阵
class Solution566 {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let m = mat.count
        let n = mat.first!.count
        if r * c != m * n {
            return mat
        }
        var result = Array.init(repeating: Array.init(repeating: 0, count: c), count: r)
        var count = 0
        for i in 0..<m {
            for j in 0..<n {
                let toI = count / c
                let toJ = count % c
                count += 1
                result[toI][toJ] = mat[i][j]
            }
        }
        return result
    }
    
    func test() {
        print(matrixReshape([[1,2],[3,4]], 1, 4))
        
        print(matrixReshape([[1,2],[3,4]], 2, 4))
        print(matrixReshape([[1,2, 3],[4,5,6]], 3, 2))
    }
}
