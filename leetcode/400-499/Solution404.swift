//
//  Solution404.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution404 {
    var sum = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        sum = 0
        dsf(root, isLeft: false)
        return sum
    }
    
    func dsf(_ node: TreeNode?, isLeft: Bool) {
        guard let node = node else {
            return
        }
        if node.left == nil && node.right == nil && isLeft{
            sum += node.val
        }
        dsf(node.left, isLeft: true)
        dsf(node.right,isLeft: false)
    }
    
    func test() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        print(sumOfLeftLeaves(node1))
    }
}
