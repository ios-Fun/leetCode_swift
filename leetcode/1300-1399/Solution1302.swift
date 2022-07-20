//
//  Solution1302.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/15.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 递归
class Solution1302 {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        
        return dfs(root).value!
    }
    
    func dfs(_ root: TreeNode?) -> (value: Int?, level: Int?) {
        guard let root = root else {
            return (nil, nil)
        }
        let leftValue = dfs(root.left)
        let rightValue = dfs(root.right)
        if leftValue.value == nil && rightValue.value == nil {
            return (root.val, 1)
        }
        if leftValue.value == nil {
            return (rightValue.value!, rightValue.level!+1)
        }
        if rightValue.value == nil {
            return (leftValue.value!, leftValue.level!+1)
        }
        if leftValue.level! == rightValue.level! {
            return (leftValue.value! + rightValue.value!, leftValue.level!+1)
        }else if leftValue.level! > rightValue.level! {
            return (leftValue.value!, leftValue.level!+1)
        }else {
            return (rightValue.value!, rightValue.level!+1)
        }
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node7 = TreeNode(7)
        let node8 = TreeNode(8)
        
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.right = node6
        node4.left = node7
        node6.right = node8
        
        print(deepestLeavesSum(node1))
    }
}
