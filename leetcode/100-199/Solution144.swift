//
//  Solution144.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 前序遍历， 先根遍历
// 1.遍历，采用栈
// 2. 递归
class Solution144 {
    
    // 遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result:[Int] = Array()
        
        // stack
        var stack:[TreeNode] = Array()
        stack.append(root!)
        while(stack.count > 0) {
            // pop
            let node = stack.last!
            stack.removeLast()
            result.append(node.val)
            if node.right != nil {
                // push
                stack.append(node.right!)
            }
            if node.left != nil {
                // push
                stack.append(node.left!)
            }
            
        }
        return result
    }
    
    func test() {
        let root = TreeNode.init(1)
        let node2 = TreeNode.init(4)
        let node3 = TreeNode.init(2)
        let node4 = TreeNode.init(3)
        root.right = node4
        root.left = node2
        node2.left = node3
        print(preorderTraversal(root))
    }
}
