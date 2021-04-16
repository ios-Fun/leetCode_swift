//
//  Solution99.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 莫里斯遍历
// 前驱的right指向node
class Solution99 {
    func recoverTree(_ root: TreeNode?) {
        var preNode:TreeNode?
        var first:TreeNode?
        var second:TreeNode?
        
        var cur = root
        
        while cur != nil {
            if cur!.left != nil {
                // 左节点为不为空
                // 前驱
                let pre = findPreNode(cur!)
                if pre.right != nil {
                    pre.right = nil
                    // resultList.append(cur!.val)
                    if preNode != nil && preNode!.val > cur!.val {
                        if first == nil {
                            first = preNode
                        }
                        second = cur
                    }
                    preNode = cur
                    cur = cur!.right
                    
                }else {
                    pre.right = cur!
                    cur = cur!.left
                }
            }else {
                // resultList.append(cur!.val)
                if preNode != nil && preNode!.val > cur!.val {
                    if first == nil {
                        first = preNode
                    }
                    second = cur
                }
                preNode = cur
                cur = cur!.right
            }
        }
        let temp = second?.val ?? 0
        second?.val = first?.val as! Int
        first?.val = temp
    }
    
    // 找前驱节点
    func findPreNode(_ node: TreeNode) -> TreeNode{
        var returnNode:TreeNode? = node.left
        
        while returnNode!.right != nil && returnNode!.right !== node {
            returnNode = returnNode!.right
        }
        return returnNode!
    }
    
    func test() {
        let a_1 = TreeNode(1)
        let a_3 = TreeNode(3)
        let a_2 = TreeNode(2)
        a_1.left = a_3
        a_3.right = a_2
        recoverTree(a_1)
        
        let b_3 = TreeNode(3)
        let b_1 = TreeNode(1)
        let b_4 = TreeNode(4)
        let b_2 = TreeNode(2)
        b_3.left = b_1
        b_3.right = b_4
        b_4.left = b_2
        recoverTree(b_3)
    }
}

// 1 3 2 4
