//
//  Solution685.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//
class Solution685 {
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
//        var set = Set<Int>()
//        for i in 0..<edges.count {
//            set.insert(edges[i][0])
//            set.insert(edges[i][1])
//        }
//        let list = Array(set)
//        var uf = UnionFind685.init(set.count)
        var lastList = [0,0]
//        for i in 0..<edges.count {
//            let a1_index = list.firstIndex(of: edges[i][0])!
//            let a2_index = list.firstIndex(of: edges[i][1])!
//
//            if uf.isConnected(a1_index, a2_index) {
//                // 如果是连接
//                lastList = edges[i]
//            }else {
//                uf.union(a1_index, a2_index)
//            }
//        }
        return lastList
    }
    
    func test() {
//        print(findRedundantDirectedConnection([[1,2], [1,3], [2,3]]))
//
//        print(findRedundantDirectedConnection([[1,2], [2,3], [3,4], [4,1], [1,5]]))
        
        print(findRedundantDirectedConnection([[2,1],[3,1],[4,2],[1,4]]))
    }
}

struct UnionFind685 {
    var parents:[Int]
    var size = 0
    
    public init(_ totalNodes: Int) {
        parents = Array.init(repeating: 0, count: totalNodes)
        for i in 0..<totalNodes {
            parents[i] = i
        }
        size = totalNodes
    }
    
    // 查找
    public func find(_ node: Int) -> Int{
        var i = node
        while i != parents[i] {
            i = parents[i]
        }
        return i
    }
    
    // 合并
    public mutating func union(_ node1: Int, _ node2: Int) {
        let root1 = find(node1)
        let root2 = find(node2)
        if root1 != root2 {
            parents[root2] = root1
            size -= 1
        }
    }
    
    public func isConnected(_ node1: Int, _ node2: Int) -> Bool{
        return find(node1) == find(node2)
    }
}
