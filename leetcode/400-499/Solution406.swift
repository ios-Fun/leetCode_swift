//
//  Solution406.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 考察技巧
class Solution406 {
    
    // 非贪心算法
    func reconstructQueue2(_ people: [[Int]]) -> [[Int]] {
        // todo
        return [[]]
    }
    
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        
        let peopleSort = people.sorted { (a, b) -> Bool in
            // return a[0] > b[0] && if a[0]
            if a[0] !=  b[0] {
                return a[0] > b[0]
            }else {
                return a[1] < b[1]
            }
        }
        var result:[[Int]] = Array()
        for item in peopleSort {
            if result.count == 0 {
                result.append(item)
            }else {
                result.insert(item, at: item[1])
            }
        }
        return result
    }
    
    func test() {
        print(reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]))
    }
}

// 7-0，7-1

