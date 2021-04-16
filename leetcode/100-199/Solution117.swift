//
//  Solution117.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution117 {
    // todo
    func connect(_ root: Node?) -> Node? {
        
        return root
    }
    
    
    func test() {
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        let node7 = Node(7)
        let node8 = Node(8)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.right = node6
        node4.left = node7
        node6.right = node8
        let a1 = connect(node1)
        
        print("a")
    }
}

//   1
// 2   3
//4      5

//    1
// 2    3
//4 5     6
//7         8
