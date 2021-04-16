//
//  Edge.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

public class Graph_Edge : CustomStringConvertible {
    var from: Graph_Node
    var to: Graph_Node
    var cost: Int
    var bidirectional: Bool
    
    public init(from: Graph_Node, to: Graph_Node, cost: Int = 1, bidirectional: Bool = true) {
        self.from = from
        self.to = to
        self.cost = cost
        self.bidirectional = bidirectional
    }
    
    var reversedEdge: Graph_Edge {
        get {
            Graph_Edge(from: to, to: from, cost: cost, bidirectional: bidirectional)
        }
    }
    
    public var description: String {
        return "\(from.ID) -> \(to.ID)"
    }
}

extension Graph_Edge: Equatable {
     public static func == (lhs: Graph_Edge, rhs: Graph_Edge) -> Bool {
        lhs.from == rhs.from && lhs.to == rhs.to && lhs.cost == rhs.cost && lhs.bidirectional == rhs.bidirectional
     }
}
