//
//  Solution547.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution547 {
    
    // dfs
    func findCircleNum2(_ M: [[Int]]) -> Int {
        // todo
        return 0
    }
    
    // bfs
    func findCircleNum3(_ M: [[Int]]) -> Int {
       // todo
        return 0
    }
    
    func findCircleNum(_ M: [[Int]]) -> Int {
        if M.count == 0 {
            return 0
        }
        var uf = UnionFind.init(M.count)
        for i in 0..<M.count {
            for j in i..<M.count {
                if i == j {
                    continue
                }
                if M[i][j] == 1 {
                    uf.union(i, j)
                }
            }
        }
        return uf.size
    }
    
    func test() {
        print(findCircleNum([[1,1,0],
        [1,1,0],
        [0,0,1]]))
        
        print(findCircleNum([[1,1,0],
        [1,1,1],
        [0,1,1]]))
    }
}
