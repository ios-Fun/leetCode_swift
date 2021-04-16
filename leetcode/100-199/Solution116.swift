//
//  Solution116.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution116 {
    // 1. 递归
    func connect(_ root: Node?) -> Node? {
        root?.next = nil
        dfs(root?.left, root?.right)
        dfs(root?.right, nil)
        return root
    }
    
    func dfs(_ node: Node?, _ next: Node?) {
        guard let node = node else {
            return
        }
        node.next = next
        dfs(node.left, node.right)
        dfs(node.right, next?.left)
    }
    
    func test() {
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        let node7 = Node(7)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        let a1 = connect(node1)
        
        print("a")
    }
}

public class Node {
      public var val: Int
      public var left: Node?
      public var right: Node?
        public var next: Node?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
          self.next = nil
      }
}
