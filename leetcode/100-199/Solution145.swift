//
//  Solution145.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 遍历 --- 栈 和 记录上一个pop的节点
// 2. 递归
class Solution145 {
    
    // 迭代--后续遍历完善
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result:[Int] = Array()
        var stack:[TreeNode] = Array()
        
        var prev:TreeNode?
        var curNode = root
        while curNode != nil || !stack.isEmpty {
            while curNode != nil {
                // 入栈
                stack.append(curNode!)
                curNode = curNode?.left
            }
            // 出栈
            curNode = stack.last!
            if curNode!.right == nil || curNode!.right === prev {
                // right 没有 ｜｜ rigth已经遍历过了
                result.append(curNode!.val)
                prev = curNode
                curNode = nil
            }else {
                stack.append(curNode!.right!)
                curNode = curNode!.right
            }
        }
        return result
    }
    
    // 迭代--后续遍历
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result:[Int] = Array()
        
        // stack
        var stack:[TreeNode] = Array()
        stack.append(root!)
        var lastNode:TreeNode?
        while (stack.count) > 0 {
            let node = stack.last!
            
            if node.left != nil && node.left === lastNode {
                result.append(node.val)
                lastNode = node
                stack.removeLast()
                continue
            }
            
            if node.right != nil && node.right === lastNode {
                result.append(node.val)
                lastNode = node
                stack.removeLast()
                continue
            }
            
            if node.right != nil{
                stack.append(node.right!)
            }
            if node.left != nil {
                stack.append(node.left!)
            }
            if node.left == nil && node.right == nil {
                result.append(node.val)
                lastNode = node
                stack.removeLast()
            }
        }
        
        return result
    }
    
    func test() {
        let root = TreeNode.init(1)
        let node2 = TreeNode.init(4)
        let node3 = TreeNode.init(2)
        let node4 = TreeNode.init(3)
        let node7 = TreeNode.init(7)
        let node8 = TreeNode.init(8)
        root.right = node4
        root.left = node2
        node2.left = node3
        node4.left = node7
        node4.right = node8
        print(postorderTraversal(root))
    }
}
