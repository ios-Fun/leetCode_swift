//
//  Solution947.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution947 {
    func removeStones(_ stones: [[Int]]) -> Int {
        var uf = UnionFind.init(stones.count)
        for i in 0..<stones.count {
            for j in i..<stones.count {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    uf.union(i, j)
                }
            }
        }
        return stones.count - uf.size
    }
    
    func test() {
        print(removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]))
        print(removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]]))
        print(removeStones([[0,0]]))
    }
}
