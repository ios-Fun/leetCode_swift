//
//  Solution452.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 用最少数量的箭引爆气球
// todo 用时过长
class Solution452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let sortPoint = points.sorted {a, b in
            return a[0] < b[0]
        }
        var resultList:[[Int]] = []
        for item in sortPoint {
            if resultList.count == 0 {
                resultList.append(item)
                continue
            }
            if item[0] <= resultList.last![1] {
                resultList[resultList.count - 1][0] = item[0]
                resultList[resultList.count - 1][1] = min(item[1], resultList[resultList.count - 1][1])
            } else {
                resultList.append(item)
            }
        }
        return resultList.count
    }
    
    func test() {
        // print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
        // 2
        
        print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]))
        // 4
//
//        print(findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]))
//        // 2
//
//        print(findMinArrowShots([[1,2]]))
//        // 1
//
//        print(findMinArrowShots([[2,3],[2,3]]))
        // 1
    }
}
