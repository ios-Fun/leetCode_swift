//
//  Solution120.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 临时数组， 从上往下，可以从下往上
//2. 如何用O(n)的额外空间，倒着存储
class Solution120 {
    
    // 从上往下
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        if triangle.count == 1 {
            return triangle[0][0]
        }
        var triangleTemp = triangle
        for i in (1..<triangle.count) {
            for j in (0..<triangle[i].count) {
                var preLeft:Int? = nil
                var preRight:Int? = nil
                var minValue:Int!
                if j > 0  &&  j < triangle[i].count-1{
                    preLeft = triangleTemp[i-1][j-1]
                    preRight = triangleTemp[i-1][j]
                    minValue = preLeft! < preRight! ? preLeft : preRight
                }else if j == 0 {
                    preRight = triangleTemp[i-1][j]
                    minValue = preRight
                }else {
                    preLeft = triangleTemp[i-1][j-1]
                    minValue = preLeft
                }
                
                triangleTemp[i][j] = triangleTemp[i][j] + minValue
            }
        }
        
        // 最后一行查找，可以二分查找，为了方便就遍历了
        var minNum = triangleTemp.last!.first!
        for num in triangleTemp.last! {
            if num < minNum {
                minNum = num
            }
        }
        return minNum
    }
    
    func test() {
        let arr:[[Int]] = [
            [2],
            [3,4],
            [6,5,7],
            [4,1,8,3]
        ]
        print(minimumTotal(arr))
    }
}


// 4， 1， 8， 3
// 7， 6， 10， 0
// 9， 10，0，0
// 2
// 11
