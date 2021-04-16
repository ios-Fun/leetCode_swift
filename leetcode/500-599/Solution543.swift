//
//  Solution543.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归
// 2. 非递归
class Solution543 {
    
    var maxLength = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        binary(root)
        return maxLength
    }
    
    // 高度
    func binary(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        let leftHeight =  binary(node!.left)
        let rightHeight = binary(node!.right)
        let value = leftHeight + rightHeight
        if value > maxLength {
            maxLength = value
        }
        return max(leftHeight, rightHeight) + 1
    }
    
    func test() {
        let node_1 = TreeNode.init(1)
        let node_2 = TreeNode.init(2)
        let node_3 = TreeNode.init(3)
        let node_4 = TreeNode.init(4)
        let node_5 = TreeNode.init(5)
        let node_6 = TreeNode.init(5)
        let node_7 = TreeNode.init(7)
        node_1.left = node_2
        node_1.right = node_3
        node_2.left = node_4
        node_2.right = node_5
        node_5.right = node_6
        node_6.right = node_7
        print(diameterOfBinaryTree(node_1))
    }
}
