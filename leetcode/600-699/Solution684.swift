//
//  Solution684.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 并查集 -- 无向图判断有没有环
class Solution684 {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var set = Set<Int>()
        for i in 0..<edges.count {
            set.insert(edges[i][0])
            set.insert(edges[i][1])
        }
        let list = Array(set)
        var uf = UnionFind.init(set.count)
        var lastList = [0,0]
        for i in 0..<edges.count {
            let a1_index = list.firstIndex(of: edges[i][0])!
            let a2_index = list.firstIndex(of: edges[i][1])!
            
            if uf.isConnected(a1_index, a2_index) {
                // 如果是连接
                lastList = edges[i]
            }else {
                uf.union(a1_index, a2_index)
            }
        }
        return lastList
    }
    
    func test() {
        print(findRedundantConnection([[1,2], [1,3], [2,3]]))
        
        print(findRedundantConnection([[1,2], [2,3], [3,4], [1,4], [1,5]]))
    }
}
