//
//  TreeConverse.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二叉树转链表
class TreeConverse {
    
    func converse(root: TreeNode?) -> (head: TreeNode?, tail: TreeNode?) {
        guard let root = root else {
            return (nil, nil)
        }
        
        var head:TreeNode?
        var end: TreeNode?
        
        if root.left != nil {
            let leftValue = converse(root: root.left)
            head = leftValue.head
            root.left = leftValue.tail
            leftValue.tail?.right = root
        }else {
            head = root
        }
        
        if root.right != nil {
            let rightValue = converse(root: root.right)
            end = rightValue.tail
            root.right = rightValue.head
            rightValue.head?.left = root
        }else {
            end = root
        }
        return (head, end)
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let node2 = TreeNode.init(2)
        let node3 = TreeNode.init(3)
        let node4 = TreeNode.init(4)
        let node5 = TreeNode.init(5)
        let node6 = TreeNode.init(6)
        let node7 = TreeNode.init(7)
        node1.left = node2
        node1.right = node3
        
        node2.left = node4
        node2.right = node5
        
        node3.left = node6
        node3.right = node7
        
        let value = converse(root: node1)
        
        print(value)
    }
}
