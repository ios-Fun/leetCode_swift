//
//  Solution_o_27.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_27 {
    // 迭代
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        var stack:[TreeNode] = []
        stack.append(root!)
        while !stack.isEmpty {
            let popNode = stack.removeLast()
            if popNode.left != nil {
                stack.append(popNode.left!)
            }
            if popNode.right != nil {
                stack.append(popNode.right!)
            }
            let temp = popNode.right
            popNode.right = popNode.left
            popNode.left = temp
        }
        
        return root
    }
    
    func test() {
        let node4 = TreeNode.init(4)
        let node2 = TreeNode.init(2)
        let node7 = TreeNode.init(7)
        let node1 = TreeNode.init(1)
        let node3 = TreeNode.init(3)
        let node6 = TreeNode.init(6)
        let node9 = TreeNode.init(9)
        node4.left = node2
        node4.right = node7
        node2.left = node1
        node2.right = node3
        node7.left = node6
        node7.right = node9
        let node_a = mirrorTree(node4)
        
        print("a")
    }
}
