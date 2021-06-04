//
//  Solution74.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 搜索二维矩阵
// 二分查找, 先查找到对应的行，再这一行中找列
class Solution74 {
    // 二分查找
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // smatrix = matrix
        let n = matrix.count
        if n == 0 {
            return false
        }
        let m = matrix[0].count
        if m == 0 {
            return false
        }
        return binaryMatrix(matrix, 0, n-1, 0, m-1, target)
        //return true
    }
    
    func binaryMatrix(_ matrix: [[Int]], _ top:Int, _ bottom:Int,_ left:Int,_ right:Int, _ target: Int) -> Bool {
        if top > bottom {
            return false
        }
        if left > right {
            return false
        }
        if top == bottom && left == right {
            if matrix[top][left] == target {
                return true
            }else {
                return false
            }
        }
        //let nMid = (top + bottom)/2
        
        if top == bottom {
            
            if target < matrix[top][left] || target > matrix[top][right] {
                return false
            }else {
                let mid = (left + right)/2
                if matrix[top][mid] == target {
                    return true
                }else {
                    if target < matrix[top][mid] {
                        return binaryMatrix(matrix, top, bottom, left, mid-1, target)
                    }else {
                        return binaryMatrix(matrix, top, bottom, mid+1, right, target)
                    }
                }
            }
        }else {
            let nMid = (top + bottom) / 2
            if target >= matrix[nMid][0] && target <= matrix[nMid][right] {
                return binaryMatrix(matrix, nMid, nMid, 0, right, target)
            }else if target < matrix[nMid][0] {
                return binaryMatrix(matrix, top, nMid-1, 0, right, target)
            }else {
                return binaryMatrix(matrix, nMid + 1, bottom, 0, right, target)
            }
        }
    }
    
    func test() {
//        print(searchMatrix([
//            [1,   3,  5,  7],
//            [10, 11, 16, 20],
//            [23, 30, 34, 50]
//            ], 3))
        
        print(searchMatrix([[1],[3]], 0))
    }
}
