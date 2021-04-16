//
//  Solution236.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 遍历后 哈希表存储父节点

// 2. 递归

// 3. 深度遍历存父节点，数组的添加操作时间复杂度 -- 用时间过长
class Solution236 {
    
    private var resultNode: TreeNode?
    
    
    // 采用数组 存储节点
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        //var listp: [TreeNode] = Array()
        // var listq: [TreeNode] = Array()
        let listp = dst2(root, p, [])
        let listq = dst2(root, q, [])
        let minCount = min(listp!.count, listq!.count)
        
        if minCount < 2 {
            return root
        }
        
        for i in (1..<minCount) {
            if listp?[i].val != listq?[i].val {
                return listp?[i-1]
            }
        }
        return listp?[minCount-1]
    }
    
    func dst2(_ node: TreeNode?, _ target: TreeNode, _ parentList: [TreeNode]) ->[TreeNode]? {
        guard let node = node else {
            return nil
        }
        var parentList = parentList
        parentList.append(node)
        if node.val == target.val {
            return parentList
        }
        if let list = dst2(node.left, target, parentList) {
            return list
        }
        if let list2 = dst2(node.right, target, parentList) {
            return list2
        }
        return nil
    }
    
    // 递归3
    func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let leftNode = lowestCommonAncestor3(root.left, p, q)
        let rightNode = lowestCommonAncestor3(root.right, p, q)
        if leftNode == nil {
            return rightNode
        }
        if rightNode == nil {
            return leftNode
        }
        if leftNode != nil && rightNode != nil {
            return root
        }
        return nil
    }
    
    // 递归
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        dst(root, p, q)
        return resultNode
    }
    
    // 深度优先遍历 -- 包含其中一个节点
    func dst(_ node: TreeNode?,_ p: TreeNode, _ q: TreeNode) -> Bool{
        guard let node = node else {
            return false
        }
        
        let lFlag = dst(node.left, p, q)
        let rFlag = dst(node.right, p, q)
        
        //  或者自己为p 或者 q
        if (lFlag && rFlag) || (lFlag && node.val == q.val)  || (rFlag && node.val == p.val) {
            resultNode = node
            return true
        }
        if lFlag || rFlag {
            return true
        }
        if node.val == q.val || node.val == p.val {
            return true
        }
        return false
    }
    
    func test() {
        let root = TreeNode.init(3)
        let node5 = TreeNode.init(5)
        let node1 = TreeNode.init(1)
        let node6 = TreeNode.init(6)
        let node2 = TreeNode.init(2)
        let node0 = TreeNode.init(0)
        let node8 = TreeNode.init(8)
        let node7 = TreeNode.init(7)
        let node4 = TreeNode.init(4)
        
        root.left = node5
        root.right = node1
        node5.left = node6
        node5.right = node2
        node1.left = node0
        node1.right = node8
        node2.left = node7
        node2.right = node4
        
        let node_a = lowestCommonAncestor(root, node5, node1)
        
        let node_b = lowestCommonAncestor(root, node5, node4)
        
        print("aaa")
    }
}
