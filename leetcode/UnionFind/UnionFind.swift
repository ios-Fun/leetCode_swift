//
//  UnionFind.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 并查集
struct UnionFind {
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
//    public func find(_ node: Int) -> Int{
//        var i = node
//        while i != parents[i] {
//            i = parents[i]
//        }
//        return i
//    }
    
    // 查找 路径压缩
    public mutating func find( _ node: Int) -> Int {
        var i = node
        while i != parents[i] {
            parents[i] = parents[parents[i]]
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
    
    public mutating func isConnected(_ node1: Int, _ node2: Int) -> Bool{
        return find(node1) == find(node2)
    }
}

