//
//  Solution235.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        if (p.val >= root.val && root.val >= q.val) || (p.val <= root.val && root.val <= q.val) {
            return root
        }
        if p.val <= root.val && q.val <= root.val {
            return lowestCommonAncestor(root.left, p, q)
        }else {
            return lowestCommonAncestor(root.right, p, q)
        }
    }
    
    func test() {
        let node1 = TreeNode(6)
        let node2 = TreeNode(2)
        let node3 = TreeNode(8)
        let node4 = TreeNode(0)
        let node5 = TreeNode(4)
        let node6 = TreeNode(7)
        let node7 = TreeNode(9)
        let node8 = TreeNode(3)
        let node9 = TreeNode(5)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        node5.left = node8
        node5.right = node9
        let a1 = lowestCommonAncestor(node1, node2, node3)
        let a2 = lowestCommonAncestor(node1, node2, node5)
        print("aaa")
    }
}
