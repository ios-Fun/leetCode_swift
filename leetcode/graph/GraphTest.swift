//
//  GraphTest.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

public class GraphTest {
    private var edges: [Graph_Edge]
    
    var nodes: [Graph_Node]
    
    public init(edges: [Graph_Edge], nodes: [Graph_Node]) {
        self.edges = edges
        self.nodes = nodes
    }
    
    private func resetElements() {
        self.edges.forEach{
            $0.from.reset()
            $0.to.reset()
        }
    }
    
    public func addEdge(_ from: Graph_Node, _ to: Graph_Node, _ weight: Int) {
        if !nodes.contains(from) {
            nodes.append(from)
        }
        if !nodes.contains(to) {
            nodes.append(to)
        }
        let edge = Graph_Edge.init(from: from, to: to, cost: weight, bidirectional: true)
        if !edges.contains(edge) {
            edges.append(edge)
        }
    }
    
    // Dijkstra -- 单对单，不能处理负权边，时间负责度 O(n*n)
    public func shortestPath(from: Graph_Node, to: Graph_Node) -> [Graph_Node] {
        if from === to {
            return [from]
        }
        
        for e in edges {
            e.from.outEdges.append(e)
            if e.bidirectional {
                e.to.outEdges.append(e.reversedEdge)
            }
        }
        
        // 用到了父节点的方式
        from.pathCost = 0
        var queue = [from]
        while queue.count > 0 {
            let current = queue.removeFirst()
            for e in current.outEdges {
                let dest = e.to
                if current.ID == dest.ID {
                    continue
                }
                let currCost = current.pathCost ?? 0
                if let destCost = dest.pathCost, destCost <= currCost + e.cost {
                    continue
                }
                dest.pathCost = currCost + e.cost
                dest.parentNode = current
                queue.append(dest)
            }
        }
        
        var top:Graph_Node? = to
        var path = [Graph_Node]()
        while top != nil {
            path.insert(top!, at: 0)
            top = top!.parentNode
        }
        self.resetElements()
        return path
    }
    
    // bellman-Ford -- 处理负权值
    public func bellmanFord(from: Graph_Node, to: Graph_Node) -> [Graph_Node] {
        // var path = [Graph_Node]()
        var costMap:[String: Int] = Dictionary()
        // var parentMap:[String: String] = Dictionary()
    
        costMap[from.ID] = 0
        
        for _ in 1..<nodes.count {
            var hasChange = false
            for edge in edges {
                var curEdge = edge
                var startPointCost = costMap[curEdge.from.ID] ?? 0
                var endPointCost = costMap[curEdge.to.ID] ?? Int.max
                if endPointCost > startPointCost + curEdge.cost {
                    costMap[curEdge.to.ID] = startPointCost + curEdge.cost
                    curEdge.to.parentNode = curEdge.from
                    hasChange = true
                }
                
                // 无向图
                if edge.bidirectional {
                    curEdge = curEdge.reversedEdge
                    startPointCost = costMap[curEdge.from.ID] ?? 0
                    endPointCost = costMap[curEdge.to.ID] ?? Int.max
                    if endPointCost > startPointCost + curEdge.cost {
                        costMap[curEdge.to.ID] = startPointCost + curEdge.cost
                        curEdge.to.parentNode = curEdge.from
                        hasChange = true
                    }
                }
            }
            if !hasChange {
                break
            }
        }
        
        // 判断是否存在负环路
        var hasRing = false
        for edge in edges {
            let startPointCost = costMap[edge.from.ID] ?? 0
            let endPointCost = costMap[edge.to.ID] ?? Int.max
            if endPointCost > startPointCost + edge.cost {
                print("有负环路")
                hasRing = true
                break
            }
        }
        
        // 如果不存在负环路
        var path = [Graph_Node]()
        if !hasRing {
            var top:Graph_Node? = to
            while top != nil {
                path.insert(top!, at: 0)
                top = top!.parentNode
            }
        }
        self.resetElements()
        return path
    }
    
    //Floyd-Warshall 算法 -- O(n3)，可以处理负权值
    public func FloydWarshall() {
        let node_count = nodes.count
        var result:[[Int]] = Array.init(repeating: Array.init(repeating: 10000, count: node_count), count: node_count)

        
        var dic:[String: Int] = Dictionary()
        for i in 0..<node_count {
            dic[nodes[i].ID] = i
        }
        
        for edge in edges {
            let i = dic[edge.from.ID]!
            let j = dic[edge.to.ID]!
            result[i][j] = edge.cost
            result[j][i] = edge.cost
        }
        for i in 0..<node_count {
            result[i][i] = 0
        }
        
        
        for i in 0..<node_count {
            for j in 0..<node_count {
                for k in 0..<node_count {
                    result[j][k] = min(result[j][i] + result[i][k], result[j][k])
                }
            }
        }
        
        for i in 0..<node_count {
            print("from: ", nodes[i])
            for j in 0..<node_count {
                print("to: ", nodes[j], result[i][j])
            }
        }
    }
    
    // prim 最小生成树
    func prim() -> (cost: Int, tree: GraphTest){
        var cost: Int = 0
        let tree = GraphTest(edges: [], nodes: [])
        // guard let start =
        guard nodes.count > 0 else {
            return (0, tree)
        }
        
        var visited  = Set<String>()
        var priorityQueue = PriorityQueue<(vertex: Graph_Node, weight: Int, parent: Graph_Node?)>(
            sort: {$0.weight < $1.weight}
        )
        
        // 第一个顶点入队
        priorityQueue.enqueue((vertex: nodes[0], weight: 0, parent: nil))
        
        while let head = priorityQueue.dequeue() {
            let vertex = head.vertex
            if visited.contains(vertex.ID) {
                continue
            }
            visited.insert(vertex.ID)
            cost += head.weight
            if let prev = head.parent {
                tree.addEdge(prev, head.vertex, head.weight)
            }
            
            // todo
        }
        
        return (cost: cost, tree: tree)
    }
    
    // kruskal 最小生成树 -- 遍历 边， 要用到并查集
    func kruskal() -> (cost: Int, tree: GraphTest){
        var cost: Int = 0
        let tree = GraphTest(edges: [], nodes: [])
        
        let node_count = nodes.count
        var dic:[String: Int] = Dictionary()
        for i in 0..<node_count {
            dic[nodes[i].ID] = i
        }
        
        let sortedEdgeList = edges.sorted(by: {$0.cost < $1.cost})
        
        var unionFind = UnionFind.init(node_count)
        
        for edge in sortedEdgeList {
            let from = edge.from
            let to = edge.to
            if !unionFind.isConnected(dic[from.ID]!, dic[to.ID]!) {
                cost += edge.cost
                tree.addEdge(from, to, edge.cost)
                unionFind.union(dic[from.ID]!, dic[to.ID]!)
            }
        }
        
        return (cost: cost, tree: tree)
    }
}
