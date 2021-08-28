//
//  Solution498.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 对角线遍历
class Solution498 {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count
        if m == 0 {
            return []
        }
        let n = mat.first!.count
        if n == 0 {
            return []
        }
        
        var result:[Int] = []
        
        var mIndex = 0
        var nIndex = 0
        var isUp = true
        while mIndex < m && nIndex < n {
            if mIndex <= m && nIndex <= nIndex && mIndex >= 0 && nIndex >= 0 {
                result.append(mat[mIndex][nIndex])
                if isUp {
                    if mIndex == 0 {    // 达到了最上面
                        if nIndex < n - 1{
                            nIndex += 1
                        }else {     // 到到了最右边
                            mIndex += 1
                        }
                        isUp = false
                    }else {
                        if nIndex < n - 1 {
                            mIndex -= 1
                            nIndex += 1
                        }else {
                            mIndex += 1
                            isUp = false
                        }
                    }
                } else {
                    if nIndex == 0 {    // 到了最左边
                        if mIndex < m - 1 {
                            mIndex += 1
                        } else {
                            nIndex += 1
                        }
                        isUp = true
                    }else {
                        if mIndex < m - 1 {
                            mIndex += 1
                            nIndex -= 1
                        }else {
                            nIndex += 1
                            isUp = true
                        }
                    }
                }
            }else {
                break
            }
        }
        return result
    }
    
    func test() {
        print(findDiagonalOrder([
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
           ]))
        print(findDiagonalOrder([
            [ 1, 2, 3 ]
           ]))
        print(findDiagonalOrder([
            [ 1, 2, 3 ],
            [ 4, 5, 6 ]
           ]))
        
        print(findDiagonalOrder([
            [ 1, 2 ],
            [ 4, 5 ],
            [ 7, 8 ]
           ]))
        print(findDiagonalOrder([
            [ 1 ],
            [ 4 ],
            [ 7]
           ]))
        print(findDiagonalOrder([
            [ ],
            [ ],
            [ ]
           ]))
    }
}
