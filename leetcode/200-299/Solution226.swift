//
//  Solution226.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/2.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 非递归
class Solution226 {
    
    // 非递归
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        // todo
        return root
    }
    
    // 递归
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        let node = root
        if node == nil {
            return nil
        }
        let temp = node!.left
        
        node!.left = invertTree(node!.right)
        node!.right = invertTree(temp)
        
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
        let node_a = invertTree(node4)
        
        print("a")
    }
}
