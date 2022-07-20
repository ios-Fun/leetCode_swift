//
//  Solution1310.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/15.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 前缀异或
class Solution1310 {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var preList:[Int] = []
        var preValue = arr.first!
        preList.append(preValue)
        for i in 1..<arr.count {
            let value = preValue ^ arr[i]
            preList.append(value)
            preValue = value
        }
        var result:[Int] = []
        for query in queries {
            if query[0] == 0 {
                result.append(preList[query[1]])
            } else {
                result.append(preList[query[0]-1] ^ preList[query[1]])
            }
        }
        return result
    }
    
    func test() {
        print(xorQueries([1,3,4,8], [[0,1],[1,2],[0,3],[3,3]]))
        
        print(xorQueries([4,8,2,10], [[2,3],[1,3],[0,0],[0,3]]))
        
        print(xorQueries([4], [[0,0]]))
    }
}
