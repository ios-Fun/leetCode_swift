//
//  Solution538.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 1. 递归 --利用后继节点
// 2. 遍历
class Solution538 {
    
    // 遍历
    func convertBST2(_ root: TreeNode?) -> TreeNode? {
        // todo
        return root
    }
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        // var node = root
        
        guard let root = root else {
            return nil
        }
        binary(root, nil)
        
        return root
    }
    
    func binary(_ node: TreeNode?, _ previous: TreeNode?) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        
        // 先右
        let rightNode = binary(node.right, previous)
        if rightNode != nil {
            node.val = node.val + (rightNode?.val ?? 0)
        }else {
            node.val = node.val + (previous?.val ?? 0)
        }
        
        // 再左
        let leftNode = binary(node.left, node)
        
        if leftNode != nil {
            return leftNode
        }
        return node
    }
    
    func test() {
        let node_1 = TreeNode.init(5)
        let node_2 = TreeNode.init(2)
        let node_3 = TreeNode.init(13)
        
        
        node_1.left = node_2
        node_1.right = node_3
        
        let node_4 = TreeNode.init(3)
        node_2.right = node_4
        
        let node_5 = TreeNode.init(4)
        node_4.right = node_5
        
        let node_6 = TreeNode.init(8)
        node_3.left = node_6
        
        let a = convertBST(node_1)
        print("a")
    }
}

//           ----5-------
//          2--        --13
//             3--     8
//                4

// ----26-------
//35--        --13
//   33--     21
//      30
