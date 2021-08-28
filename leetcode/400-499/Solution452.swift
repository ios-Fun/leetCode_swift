//
//  Solution452.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 用最少数量的箭引爆气球
class Solution452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        return 0
    }
    
    func test() {
        print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
        // 2
        
        print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
        // 4
        
        print(findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]))
        // 2
        
        print(findMinArrowShots([[1,2]]))
        // 1
        
        print(findMinArrowShots([[2,3],[2,3]]))
        // 1
    }
}
