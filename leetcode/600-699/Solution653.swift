//
//  Solution653.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 双指针
class Solution653 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        return true
    }
    
    func test() {
        let node1 = TreeNode(5)
        let node2 = TreeNode(3)
        let node3 = TreeNode(6)
        let node4 = TreeNode(2)
        let node5 = TreeNode(4)
        let node6 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.right = node6
        print(findTarget(node1, 9))
        print(findTarget(node1, 28))
    }
}
