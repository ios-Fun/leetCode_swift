//
//  Solution114.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 遍历
class Solution114 {
    
    // 遍历
    func flatten2(_ root: TreeNode?) {
        // todo
        
    }
    
    // 递归
    func flatten(_ root: TreeNode?) {
        binary(root)
    }
    
    // 返回尾节点
    // TODO: 优化
    func binary(_ head: TreeNode?) -> TreeNode? {
        //print(head?.val)
        if head == nil {
            return nil
        }
        
        if head!.left == nil && head!.right == nil {
            return head
        }
        
        let rightNode = head!.right
        
        var leftTail:TreeNode?
        if head!.left != nil {
            leftTail = binary(head!.left)
            head!.right = head!.left
            head!.left = nil
        }
        
        var rightTail:TreeNode?
        if rightNode != nil {
            
            if rightNode!.left == nil && rightNode!.right == nil {
                if leftTail != nil {
                    leftTail!.right = rightNode
                }
                
                rightTail = rightNode
            }else {
                rightTail = binary(rightNode)
                if leftTail != nil {
                    leftTail!.right = rightNode
                }
            }
        }
        
        if rightTail == nil {
            if leftTail != nil {
                return leftTail!
            }else {
                return head
            }
            
        }else {
            return rightTail!
        }
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let node2 = TreeNode.init(2)
        let node5 = TreeNode.init(5)
        let node3 = TreeNode.init(3)
        let node4 = TreeNode.init(4)
        let node6 = TreeNode.init(6)
        node1.left = node2
        node1.right = node5
        node2.left = node3
        node2.right = node4
        node5.right = node6
        
        flatten(node1)
        
        flatten(node2)
    }
}
