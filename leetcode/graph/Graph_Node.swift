//
//  Graph_Node.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

public class Graph_Node: CustomStringConvertible, Equatable {
    var ID: String
    var pathCost: Int?
    var parentNode:Graph_Node?
    var outEdges = [Graph_Edge]()
    
    public init(_ ID: String) {
        self.ID = ID
    }
    
    func reset() {
        pathCost = nil
        parentNode = nil
        outEdges = []
    }
    
    public static func == (lhs: Graph_Node, rhs: Graph_Node) -> Bool {
        lhs.ID == rhs.ID
    }
    public var description: String {
        return ID
    }
}


