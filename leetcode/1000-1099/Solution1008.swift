//
//  Solution1008.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归
// 2. 遍历 -- 采用顺序队列
class Solution1008 {
    
    // 遍历
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        
        let root:TreeNode? = TreeNode.init(preorder[0])
        if preorder.count == 1 {
            return root
        }
        var queueList:[TreeNode] = Array()
        queueList.append(root!)
        
        for i in 1..<preorder.count {
            var node = queueList.last
            let child = TreeNode.init(preorder[i])
            while(queueList.count > 0 && queueList.first!.val < preorder[i]) {
                node = queueList.last
                queueList.removeLast()
            }
            if node!.val < preorder[i] {
                node!.right = child
            }else {
                node!.left = child
            }
            queueList.append(child)
        }
        
        return root
    }
    
    // 递归
    func bstFromPreorder2(_ preorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        let root:TreeNode? = TreeNode.init(preorder[0])
        if preorder.count == 1 {
            return root
        }
        let index = getList(preorder)
        if index != nil {
            // 数组截取
            if index != 1 {
                root!.left = bstFromPreorder(Array(preorder[1..<index!]))
            }
            root!.right = bstFromPreorder(Array(preorder[index!..<preorder.count]))
        }else {
            root!.left = bstFromPreorder(Array(preorder[1..<preorder.count]))
        }
        return root
    }
    
    // 找比你大的
    func getList(_ preorder: [Int])-> Int? {
        for i in 1..<preorder.count {
            if preorder[i] > preorder[0] {
                return i
            }
        }
        return nil
    }
    
    func test() {
        let node1 = bstFromPreorder([8,5,1,7,10,12])
        
        let node2 = bstFromPreorder([8,5,1,7,10,12])
    }
}

// 8
// 5 8
// 1 5 8

