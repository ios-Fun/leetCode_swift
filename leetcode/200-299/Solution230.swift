//
//  Solution230.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution230 {
    // 中序遍历 -- 栈
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack:[TreeNode] = Array()
        
        
        return 0
    }
    
    func test() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(1)
        let node3 = TreeNode(4)
        let node4 = TreeNode(2)
        node1.left = node2
        node1.right = node3
        node2.right = node4
        print(kthSmallest(node1, 1))
    }
}
