//
//  Solution98.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 1. 递归
// 2. 中序遍历
class Solution98 {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return binaryTree(root!).flag
    }
    
    func binaryTree(_ node: TreeNode) -> (flag:Bool, min:Int, max:Int) {
        if node.left == nil &&  node.right == nil {
            return (true, node.val, node.val)
        }
        
        if node.right != nil && node.left == nil {
            // 右子树存在, 左不存在
            let result =  binaryTree(node.right!)
            
            let returnFlag = result.flag && (node.val < result.min)
            return (returnFlag, node.val, result.max)
        }
        if node.left != nil && node.right == nil {
            // 左子树存在, 右不存在
            let result =  binaryTree(node.left!)
            let returnFlag = result.flag && (node.val > result.max)
            return (returnFlag, result.min, node.val)
        }
        
        if node.left != nil && node.right != nil {
            let resultLeft =  binaryTree(node.left!)
            let resultRight =  binaryTree(node.right!)
            let returnFlag = resultLeft.flag && (node.val > resultLeft.max) && resultRight.flag && (node.val < resultRight.min)
            return (returnFlag, resultLeft.min, resultRight.max)
        }
        return (true, 0, 0)
    }
    
    func test() {
        let node5 = TreeNode.init(5)
        let node1 = TreeNode.init(1)
        let node4 = TreeNode.init(4)
        let node3 = TreeNode.init(3)
        let node6 = TreeNode.init(6)
        node5.left = node1
        node5.right = node4
        node4.left = node3
        node4.right = node6
        print(isValidBST(node5))
        
        let a_2 = TreeNode.init(2)
        let a_1 = TreeNode.init(1)
        let a_3 = TreeNode.init(3)
        a_2.left = a_1
        a_2.right = a_3
        print(isValidBST(a_2))
    }
}
