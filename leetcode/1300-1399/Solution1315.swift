//
//  Solution1315.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1315 {
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.val & 1 == 0 {
            // 偶数
            return childSum(root.left) + childSum(root.right) + sumEvenGrandparent(root.left) + sumEvenGrandparent(root.right)
        } else {
            return sumEvenGrandparent(root.left) + sumEvenGrandparent(root.right)
        }
    }
    
    func childSum(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftValue = node.left?.val ?? 0
        let rightValue = node.right?.val ?? 0
        return leftValue + rightValue
    }
    
    func test() {
        let node1 = TreeNode(6)
        let node2 = TreeNode(7)
        let node3 = TreeNode(8)
        let node4 = TreeNode(2)
        let node5 = TreeNode(7)
        let node6 = TreeNode(1)
        let node7 = TreeNode(3)
        let node8 = TreeNode(9)
        let node9 = TreeNode(1)
        let node10 = TreeNode(4)
        let node11 = TreeNode(5)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        node4.left = node8

        node5.left = node9
        node5.right = node10
        
        node7.right = node11
        
        print(sumEvenGrandparent(node1))
    }
}
