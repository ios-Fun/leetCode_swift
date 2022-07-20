//
//  Solution1339.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1339 {
    var maxResult = 0
    func maxProduct(_ root: TreeNode?) -> Int {
        // let MOD =
        maxResult = 0
        let sumValue = sum(root)
        _ = dsf(root, sumValue)
        return maxResult % 1000000007
    }
    
    func sum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return sum(root.left) + root.val + sum(root.right)
    }
    
    func dsf(_ root: TreeNode?, _ maxValue: Int) -> Int {
        guard let root = root else {
            return 0
        }
        let leftValue = dsf(root.left, maxValue)
        let rightValue = dsf(root.right, maxValue)
        self.maxResult = max(self.maxResult, leftValue * (maxValue - leftValue))
        self.maxResult = max(self.maxResult, rightValue * (maxValue - rightValue))
        return leftValue + root.val + rightValue
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        node1.left = node2
        node1.right = node3
        
        node2.left = node4
        node2.right = node5
        
        node3.left = node6
        
        print(maxProduct(node1))
    }
}
