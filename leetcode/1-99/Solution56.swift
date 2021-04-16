//
//  Solution56.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/19.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 先排序，后合并
// 其他思路？
// 核心--快速排序

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 {
            return []
        }
        
        // O(nlogn)
        let startNums = intervals.sorted { (a, b) -> Bool in
            return a[0] < b[0]
        }
        
        var result:[[Int]] = Array()
        
        var beginStack:[Int] = Array()
        var endStack:[Int] = Array()
        
        for i in 0..<startNums.count {
            if beginStack.count == 0 {
                beginStack.append(startNums[i][0])
                endStack.append(startNums[i][1])
            }else {
                if startNums[i][0] <= endStack.last! {
                    endStack[endStack.count-1] = max(endStack.last!, startNums[i][1])
                }else {
                    beginStack.append(startNums[i][0])
                    endStack.append(startNums[i][1])
                }
            }
        }
        
        for i in 0..<beginStack.count {
            let item = [beginStack[i], endStack[i]]
            result.append(item)
        }
        
        return result
    }
    
    func test() {
        print(merge([[1,3],[2,6],[8,10],[15,18]]))
        
        print(merge([[1,4],[4,5]]))
    }
}
