//
//  Solution447.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 回旋镖的数量
class Solution447 {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        let count = points.count
        if count < 3 {
            return 0
        }
        var resultCount = 0
        for i in 0..<count {
            let pointI = points[i]
            var distanceList:[Int] = Array.init(repeating: 0, count: count)
            for j in 0..<count {
                let pointJ = points[j]
                distanceList[j] = (pointI[0] - pointJ[0]) * (pointI[0] - pointJ[0]) + (pointI[1] - pointJ[1]) * (pointI[1] - pointJ[1])
            }
            distanceList.sort()
            
            var left = 1
            var right = 1
            while right < count {
                while right < count && distanceList[right] == distanceList[left] && distanceList[right] != 0 {
                    right += 1
                }
                if left != right - 1 {
                    let count = right - left
                    resultCount += count * (count-1)
                }
                left = right
            }
        }
        return resultCount
    }
    
    func test() {
        
        print(numberOfBoomerangs([[0,0],[1,0],[-1,0],[0,1],[0,-1]]))
        // 20
        // 0, 1, 1, 1, 1  // 4*3 = 12
        // 1,    2
        // 2,    2
        // 3,    2
        // 4,    2
        
        print(numberOfBoomerangs([[0,0],[1,0],[2,0]]))
        //  [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]]

        print(numberOfBoomerangs([[1,1],[2,2],[3,3]]))
        // 2

        print(numberOfBoomerangs([[1,1]]))
        
        // 0
    }
}
