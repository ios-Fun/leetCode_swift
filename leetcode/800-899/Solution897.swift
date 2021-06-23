//
//  Solution897.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution897 {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // 虚拟头节点
        let dummyNode = TreeNode.init(0)
        var listCurNode = dummyNode
        
        var stack:[TreeNode] = []
        var curNode:TreeNode? = root
        while curNode != nil || !stack.isEmpty {
            while curNode != nil {
                stack.append(curNode!)
                curNode = curNode!.left
            }
            // 出栈
            let popNode = stack.last!
            stack.removeLast()
            let node = TreeNode.init(popNode.val)
            listCurNode.right = node
            listCurNode = node
            curNode = popNode.right
        }
        
        return dummyNode.right
    }
    
    func test() {
        let a1 = TreeNode.init(5)
        let a2 = TreeNode.init(3)
        let a3 = TreeNode.init(6)
        let a4 = TreeNode.init(2)
        let a5 = TreeNode.init(4)
        let a6 = TreeNode.init(8)
        let a7 = TreeNode.init(1)
        let a8 = TreeNode.init(7)
        let a9 = TreeNode.init(9)
        a1.left = a2
        a1.right = a3
        a2.left = a4
        a2.right = a5
        a3.right = a6
        a4.left = a7
        a6.left = a8
        a6.right = a9
        let node = increasingBST(a1)
        print("a")
    }
}
