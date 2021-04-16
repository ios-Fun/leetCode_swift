//
//  Graph.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 图的表示方法
// 1. 邻接矩阵
// 2. 邻接表
// 3. 逆邻接表
// 4. 十字链表

// 遍历
// 1.BFS
// 2.DFS
// 3.拓扑排序

// A*算法

// 最短路径算法
// Dijkstra
// Bellman-Ford
// Floyd-Warshall

// 最小生成树
// Prim
// Kruskal

// 图匹配
// 匈牙利算法

// 强连通分支算法与网络流
// Ford-Fulkerson

// Kosaraju、 Gabow、 Tarjan

public class Graph {
    
    func test() {
        let Brno: Graph_Node      = Graph_Node("Brno")
        let Praha: Graph_Node     = Graph_Node("Praha")
        let Ostrava: Graph_Node   = Graph_Node("Ostrava")
        let Pardubice: Graph_Node = Graph_Node("Pardubice")
        let Kolin: Graph_Node     = Graph_Node("Kolin")
        let Plzen: Graph_Node     = Graph_Node("Plzen")
        let Adamov: Graph_Node    = Graph_Node("Adamov")

        let Prcice: Graph_Node      = Graph_Node("Prcice")
        let doPrcicEdge: Graph_Edge = Graph_Edge(from: Prcice, to: Prcice)
        Prcice.outEdges = [ doPrcicEdge ]
        
        let edges = [
            Graph_Edge(from: Ostrava,   to: Brno,    cost:180),
            Graph_Edge(from: Praha,     to: Ostrava, cost:420),
            Graph_Edge(from: Pardubice, to: Brno,    cost:110),
            Graph_Edge(from: Pardubice, to: Praha,   cost:90),
            Graph_Edge(from: Pardubice, to: Plzen,   cost:140),
            Graph_Edge(from: Pardubice, to: Ostrava, cost:290),
            Graph_Edge(from: Plzen,     to: Praha,   cost:70),
            Graph_Edge(from: Adamov,    to: Adamov,  cost:0),
        ]
        
        let G = GraphTest(edges: edges, nodes: [Brno, Praha, Ostrava, Pardubice, Kolin, Plzen, Adamov, Prcice])
        
        // let result = G.shortestPath(from:Praha, to: Ostrava)
        // [Praha, Pardubice, Ostrava]
        
        // let result = G.bellmanFord(from:Praha, to: Ostrava)
        // let result = G.bellmanFord(from:Ostrava, to: Ostrava)
        
//        let result = G.bellmanFord(from:Ostrava, to: Ostrava)
//
//        print("result:", result)
        G.FloydWarshall()
    }
}
