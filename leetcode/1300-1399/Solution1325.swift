//
//  Solution1325.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1325 {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        while (true) {
            let result = dfs(root, target)
            if !result.flag {
                return result.node
            }
        }
    }
    
    // 是否有删除
    func dfs(_ root: TreeNode?, _ target: Int) -> (flag: Bool, node: TreeNode?) {
        if root == nil {
            return (false, nil)
        }
        // 先看自己
        if root!.left == nil && root!.right == nil && root!.val == target {
            return (false, nil)
        }
        var isChange = false
        if root!.left != nil &&  root!.left!.left == nil && root!.left!.right == nil && root!.left!.val == target {
            isChange = true
            root!.left = nil
        }
        if root!.right != nil &&  root!.right!.left == nil && root!.right!.right == nil && root!.right!.val == target {
            isChange = true
            root!.right = nil
        }
        if isChange {
            return (true, root)
        }else {
            if dfs(root?.left, target).flag || dfs(root?.right, target).flag {
                return (true, root)
            }
        }
        return (false,root)
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(2)
        let node5 = TreeNode(2)
        let node6 = TreeNode(4)
        
        node1.left = node2
        node1.right = node3
        
        node2.left = node4
        
        node3.left = node5
        node3.right = node6
        
        let node = removeLeafNodes(node1, 2)
        print(node)
        
        let nodea_1 = TreeNode(1)
        let nodea_2 = TreeNode(1)
        let nodea_3 = TreeNode(2)
        nodea_1.left = nodea_2
        nodea_1.left = nodea_3
        let nodea = removeLeafNodes(nodea_1, 1)
        print(nodea)
    }
}
