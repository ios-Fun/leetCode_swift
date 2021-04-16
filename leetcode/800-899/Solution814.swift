//
//  Solution814.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/11.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution814 {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        let result = removeNode(root)
        if result.hasOne {
            return result.toNode
        }else {
            return nil
        }
    }
    
    func removeNode(_ node: TreeNode?) -> (toNode:TreeNode?, hasOne: Bool) {
        guard let node = node else {
            return (nil, false)
        }
        let left = removeNode(node.left)
        let right = removeNode(node.right)
        if left.hasOne {
            node.left = left.toNode
        }else {
            node.left = nil
        }
        if right.hasOne {
            node.right = right.toNode
        }else {
            node.right = nil
        }
        return (node, node.val == 1 || left.hasOne || right.hasOne)
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(0)
        let node3 = TreeNode(0)
        let node4 = TreeNode(1)
        node1.right = node2
        node2.left = node3
        node2.right = node4
        
        let a = pruneTree(node1)
        
        print(a)
        
        let nodeb1 = TreeNode(0)
        let b = pruneTree(nodeb1)
        
        print(b)
    }
}
