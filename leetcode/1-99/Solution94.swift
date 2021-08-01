//
//  Solution94.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 中序遍历，中根遍历
// 1. 递归
// 2. 迭代--栈
// 3. 莫里斯遍历
class Solution94 {
    
    // 莫里斯遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // 当前节点和前驱
        guard let root = root else {
            return []
        }
        var cur:TreeNode? = root
        var result:[Int] = Array()
        while cur != nil {
            if cur!.left == nil {
                result.append(cur!.val)
                cur = cur!.right
            }else {
                // 左节点有值
                var prev:TreeNode = cur!.left!
                while prev.right != nil && prev.right !== cur{
                    prev = prev.right!
                }
                
                // 前驱节点
                if prev.right == nil {
                    prev.right = cur;
                    cur = cur!.left
                }else {
                    result.append(cur!.val)
                    prev.right = nil
                    cur = cur?.right
                }
                
            }
        }
        return result
    }
    
    // 迭代--中序遍历
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result:[Int] = Array()
        var stack:[TreeNode] = Array()
        var curr:TreeNode? = root
        
        while curr != nil || !stack.isEmpty {
            // 先把左边的全加进来
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            // pop 栈顶元素
            curr = stack.last!
            stack.removeLast()
            result.append(curr!.val)
            curr = curr!.right
        }
        return result
    }
    
    //迭代
    func inorderTraversal3(_ root: TreeNode?) -> [Int] {
        var stack:[TreeNode] = Array()
        var resultList:[Int] = Array()
        // binary(root, &resultList)
        
        var curNode = root
        while (curNode != nil || stack.count > 0) {
            if curNode != nil {
                stack.append(curNode!)
                curNode = curNode!.left
            }else {
                curNode = stack.last
                stack.removeLast()
                resultList.append(curNode!.val)
                curNode = curNode!.right
            }
        }
        return resultList
    }
    
    // 迭代4 -- 思路最清晰
    func inorderTraversal4(_ root: TreeNode?) -> [Int] {
        var stack:[TreeNode] = Array()
        var resultList:[Int] = Array()
        
        var node :TreeNode? = root
        while(true) {
            if node != nil {
                // 将左全部入栈
                stack.append(node!)
                node = node!.left
            }else if stack.isEmpty{
                break
            }else {
                // 左边为nil了， 访问右边
                node = stack.removeLast()
                resultList.append(node!.val)
                node = node!.right
            }
        }
        
        return resultList
    }
    
    // 递归
    func binary(_ node: TreeNode?, _ list: inout [Int]) {
        
        guard let node = node else {
            return
        }
        binary(node.left, &list)
        list.append(node.val)
        binary(node.right, &list)
    }
    
    // 迭代算法
    
    
    func test(){
//        let node1 = TreeNode.init(1)
//
//        let node2 = TreeNode.init(2)
//        let node3 = TreeNode.init(3)
//        let node4 = TreeNode.init(4)
//
//        let node5 = TreeNode.init(5)
//
//        let node6 = TreeNode.init(6)
//        node1.right = node2
//        node2.left = node3
//        node2.right = node4
//
//        node4.left = node5
//        node4.right = node6
//
//        print(inorderTraversal(node1))
        
        let t_3 = TreeNode.init(3)
        let t_1 = TreeNode.init(1)
        let t_2 = TreeNode.init(2)
        t_3.left = t_1
        t_1.right = t_2
        print(inorderTraversal(t_3))
        
        print(inorderTraversal4(t_3))
    }
}

// 3
//1
//  2
