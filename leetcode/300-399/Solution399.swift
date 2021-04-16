//
//  Solution399.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 图？
// 图的遍历
// dfs
// bfs

class Solution399 {
    
    
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        if equations.count == 0 {
            return []
        }
        var parents:[String: [String]] = Dictionary()
        var mValues:[String: [Double]] = Dictionary()
        
        for i in 0..<equations.count {
            let string1 = equations[i][0]
            let string2 = equations[i][1]
            if parents[string1] == nil {
                // 不存在
                parents[string1] = [string2]
            }else {
                parents[string1]!.append(string2)
            }
        }
        return []
    }
    
    // 深度遍历 dfs
    func dfs(_ start: String, _ end: String,_ visited: inout [Int]) {
        
    }
    
    // 广度优先遍历 bfs
    
    
    func test() {
        print(calcEquation2([ ["a", "b"], ["b", "c"] ], [2.0, 3.0], [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]]))
        
        print(calcEquation2([["a","b"],["e","f"],["b","e"]],
        [3.4,1.4,2.3],
        [["b","a"],["a","f"],["f","f"],["e","e"],["c","c"],["a","c"],["f","e"]]))
    }
    
    // 并查集
    func calcEquation2(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var uf = UnionFind399()
        for i in 0..<equations.count {
            uf.add(equations[i][0], equations[i][1], values[i])
        }
        var resList:[Double] = Array()
        for i in 0..<queries.count {
            resList.append(uf.isConnected(queries[i][0], queries[i][1]))
        }
        
        return resList
    }
}


struct UnionFind399 {
    
    var parents:[String:String] = Dictionary()
    var weights:[String:Double] = Dictionary()
    
    public mutating func add (_ node1: String, _ node2: String, _ value: Double) {

        if parents[node1] == nil {
            parents[node1] = node1
            weights[node1] = 1.0
        }

        if parents[node2] == nil {
            parents[node2] = node2
            weights[node2] = 1.0
        }

        self.union(node1, node2, value)
    }
    
    // 查找
    public func find(_ node: String) -> (node: String, value:Double){
//        guard var i = parents[node] else {
//            return ("", -1)
//        }
        
        if parents[node] == nil {
            return ("", -1)
        }
        
        var i = node
        var result = 1.0
        while i != parents[i] {
            result *= weights[i]!
            i = parents[i]!
        }
        return (i, result)
    }
    
    // 合并
    public mutating func union(_ node1: String, _ node2: String, _ value: Double) {
        let (node1_root, value1) = find(node1)
        let (node2_root, value2) = find(node2)
        if node1_root.count == 0 || node2_root.count == 0 {
            return
        }
        if node1_root != node2_root {
            parents[node1_root] = node2_root
            weights[node1_root] = 1/value1 * value * value2
            // count -= 1
        }
    }
    
    public func isConnected(_ node1: String, _ node2: String) -> Double{
        let value1 = find(node1)
        let value2 = find(node2)
        if value1.value == -1 || value2.value == -1 {
            return -1.0
        }
        if value1.node == value2.node {
            // 相同的集合
            return value1.value / value2.value
        }else {
            return -1.0
        }
    }
}
