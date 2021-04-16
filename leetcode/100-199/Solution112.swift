//
//  Solution112.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 遍历
class Solution112 {
    
    // 非递归 -- 广度优先搜索
    func hasPathSum2(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var queue:[TreeNode] = Array()
        queue.append(root!)
        var valuequeue:[Int] = Array()
        valuequeue.append(root!.val)
        
        while !queue.isEmpty {
            let count = queue.count
            var index = 0
            while index < count {
                // pop
                let node = queue.first!
                queue.removeFirst()
                
                let nodeValue = valuequeue.first!
                valuequeue.removeFirst()
                
                if node.left == nil && node.right == nil {
                    if nodeValue == sum {
                        return true
                    }
                }else {
                    // 有子节点
                    if node.left != nil {
                        queue.append(node.left!)
                        valuequeue.append(nodeValue + node.left!.val)
                    }
                    if node.right != nil {
                        queue.append(node.right!)
                        valuequeue.append(nodeValue + node.right!.val)
                    }
                }
                //
                index += 1
            }
            
        }
        
        return false
    }
    
    // 递归
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        if root == nil {
            return false
        }
        
        if root!.left == nil && root!.right == nil && root!.val == sum {
            return true
        }else {
            // 在左子树 或右子树中查找
            return hasPathSum( root!.left, sum - root!.val) || hasPathSum(root!.right, sum - root!.val)
        }
    }
    
    func test() {
        let node5 = TreeNode.init(5)
        let node4 = TreeNode.init(4)
        let node8 = TreeNode.init(8)
        let node11 = TreeNode.init(11)
        let node13 = TreeNode.init(13)
        let node4_r = TreeNode.init(4)
        let node7 = TreeNode.init(7)
        let node2 = TreeNode.init(2)
        let node1 = TreeNode.init(1)
        node5.left = node4
        node5.right = node8
        node4.left = node11
        node8.left = node13
        node8.right = node4_r
        node11.left = node7
        node11.right = node2
        node4.right = node1
        print(hasPathSum2(node5, 22))
    }
}
