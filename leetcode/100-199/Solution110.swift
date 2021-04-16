//
//  Solution110.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归（）
//2. 遍历-
class Solution110 {
    
    // 递归
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        return binaryNode(root).flag
    }
    
    // 返回 flag : 是否平衡二叉树 ， depth: 深度
    func binaryNode( _ node: TreeNode?) -> (flag:Bool, depth:Int) {
        if node == nil {
            return (true, 0)
        }
        
        if node!.left == nil && node!.right == nil {
            return (true, 1)
        }
        
        let leftResult = binaryNode(node!.left)
        let rightResult = binaryNode(node!.right)
        
        if abs(leftResult.depth - rightResult.depth) > 1 {
            return (false, max(leftResult.depth, rightResult.depth) + 1)
        }else {
            return (leftResult.flag && rightResult.flag, max(leftResult.depth, rightResult.depth)  + 1)
        }
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let node2_a = TreeNode.init(2)
        let node2_b = TreeNode.init(2)
        let node3_a = TreeNode.init(3)
        let node3_b = TreeNode.init(3)
        let node4_a = TreeNode.init(4)
        let node4_b = TreeNode.init(4)
        node1.left = node2_a
        node1.right = node2_b
        node2_a.left = node3_a
        node2_b.right = node3_b
        
        node3_a.left = node4_a
        node3_b.right = node4_b
        
        print(isBalanced(node1))
    }
}
