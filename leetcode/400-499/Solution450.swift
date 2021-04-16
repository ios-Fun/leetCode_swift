//
//  Solution450.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution450 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard var root = root else {
            return nil
        }
        if root.val == key && root.left == nil && root.right == nil {
            return nil
        }
        
        // 其他情况非nil
        var curNode:TreeNode? = root
        var parentNode: TreeNode? = root        // 父节点
        while curNode != nil {
            if curNode!.val == key {
                break
            }else {
                parentNode = curNode
                if curNode!.val < key {
                    // 往右
                    curNode = curNode?.right
                }else {
                    curNode = curNode?.left
                }
            }
        }
        // 未找到key
        guard curNode != nil else {
            return root
        }
        
        // 如果是叶子节点，直接删除
        if curNode!.left == nil && curNode!.right == nil {
            deleteANode(parentNode!, curNode!)
        }else if (curNode!.left != nil && curNode!.right == nil) || (curNode!.left == nil && curNode!.right != nil) {
            if curNode!.val == root.val {
                // 如果删除的是根节点
                if curNode!.left != nil {
                    return curNode!.left
                }else {
                    return curNode!.right
                }
            }else {
                // 删除的不是根节点
                deleteANode(parentNode!, curNode!)
            }
        }else {
            // 有两个节点 -- 查找右节点
            // 非叶子节点 找后继
            let nextResult = findNext(curNode!)
            
            // 要删除的节点的val 替换为 后继节点的值
            curNode?.val = nextResult.nextNode!.val
            
            // 删除后继节点
            deleteANode(nextResult.parentNode!, nextResult.nextNode!)
        }
        return root
    }
    
    // 删除其中的一个节点
    func deleteANode(_ parentNode: TreeNode, _ curNode: TreeNode) {
        if curNode.left == nil && curNode.right == nil {
            // 叶子节点
            if let left = parentNode.left, left.val == curNode.val {
                parentNode.left = nil
            }else {
                parentNode.right = nil
            }
        }else {
            // 非叶子节点
            if curNode.left != nil {
                if parentNode.left?.val == curNode.val {
                    //
                    parentNode.left = curNode.left
                }else {
                    parentNode.right = curNode.left
                }
            }else {
                if parentNode.left?.val == curNode.val {
                    //
                    parentNode.left = curNode.right
                }else {
                    parentNode.right = curNode.right
                }
            }
        }
    }
    
    // 删除叶子节点
//    func deleteLeaf(_ parentNode: TreeNode, _ curNode: TreeNode) {
//        if let left = parentNode.left, left.val == curNode.val {
//            parentNode.left = nil
//        }else {
//            parentNode.right = nil
//        }
//    }
    
    // 查找后继
    // 返回后继节点 和后继节点的父节点
    func findNext(_ node: TreeNode) -> (nextNode: TreeNode?, parentNode: TreeNode?) {
        var cur: TreeNode? = node.right
        var parent: TreeNode = node
        while cur != nil {
            if cur!.left != nil {
                parent = cur!
                cur = cur!.left
            }else{
                break
            }
        }
        return (cur, parent)
    }
    
    func test() {
        let node1 = TreeNode(5)
//        let node2 = TreeNode(3)
//        let node3 = TreeNode(6)
//        let node4 = TreeNode(2)
//        let node5 = TreeNode(4)
//        let node6 = TreeNode(7)
//        node1.left = node2
//        node1.right = node3
//        node2.left = node4
//        node2.right = node5
//        node3.right = node6
        let result = deleteNode(node1, 5)
        print("aaa")
    }
}

// 先二分查找到节点A
// 找这个节点的前驱 或者 后继 B
// 用 B的值 替换 节点 A的值
// B 的 父节点删除 B


//      5
//  3       7
//2   4。 6。  8
