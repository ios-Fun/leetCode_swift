//
//  Solution872.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution872 {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        // 中序遍历
        let list1 = midOrder(root1)
        let list2 = midOrder(root2)
//        print(list1)
//        print(list2)
        return list1 == list2
    }
    
    func midOrder(_ root: TreeNode?) -> [Int] {
        var result:[Int] = []
        
        guard let root = root else{
            return []
        }
        var curNode:TreeNode? = root
        var stack:[TreeNode] = []
        while curNode != nil || !stack.isEmpty {
            while curNode != nil {
                stack.append(curNode!)
                curNode = curNode!.left
            }
            let popNode = stack.last!
            stack.removeLast()
            if popNode.left == nil && popNode.right == nil {
                result.append(popNode.val)
            }
            curNode = popNode.right
        }
        
        return result
    }
    
    func test() {
        let a1 = TreeNode.init(3)
        let a2 = TreeNode.init(5)
        let a3 = TreeNode.init(1)
        let a4 = TreeNode.init(6)
        let a5 = TreeNode.init(2)
        let a6 = TreeNode.init(9)
        let a7 = TreeNode.init(8)
        let a8 = TreeNode.init(7)
        let a9 = TreeNode.init(4)
        a1.left = a2
        a1.right = a3
        a2.left = a4
        a2.right = a5
        a3.left = a6
        a3.right = a7
        a5.left = a8
        a5.right = a9
        
        let b1 = TreeNode.init(3)
        let b2 = TreeNode.init(5)
        let b3 = TreeNode.init(1)
        let b4 = TreeNode.init(6)
        let b5 = TreeNode.init(7)
        let b6 = TreeNode.init(4)
        let b7 = TreeNode.init(2)
        let b8 = TreeNode.init(9)
        let b9 = TreeNode.init(8)
        b1.left = b2
        b1.right = b3
        b2.left = b4
        b2.right = b5
        b3.left = b6
        b3.right = b7
        b7.left = b8
        b7.right = b9
        
        print(leafSimilar(a1, b1))
    }
}
