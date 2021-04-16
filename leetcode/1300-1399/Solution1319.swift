//
//  Solution1319.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. dfs todo
//2. 并查集
class Solution1319 {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        var uf = UnionFind.init(n)
        for item in connections {
            uf.union(item[0], item[1])
        }
        if connections.count < n - 1 {
            return -1
        }else {
            return uf.size - 1
        }
    }
    
    func test() {
        print(makeConnected(4, [[0,1],[0,2],[1,2]]))
        
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]]))
        
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2]]))
        
        print(makeConnected(5, [[0,1],[0,2],[3,4],[2,3]]))
    }
}
