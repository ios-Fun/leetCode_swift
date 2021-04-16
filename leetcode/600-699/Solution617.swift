//
//  Solution617.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归
// 2. 遍历
class Solution617 {
    
    // 迭代
    func mergeTrees2(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        // todo
        return nil
    }
    // 递归
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        let node = TreeNode.init(t1!.val + t2!.val)
        node.left = mergeTrees(t1!.left, t2!.left)
        node.right = mergeTrees(t1!.right, t2!.right)
        return node
    }
    
    func test() {
        let t1_1 = TreeNode.init(1)
        let t1_3 = TreeNode.init(3)
        let t1_2 = TreeNode.init(2)
        let t1_5 = TreeNode.init(5)
        t1_1.left = t1_3
        t1_1.right = t1_2
        t1_3.left = t1_5
        
        let t2_2 = TreeNode.init(2)
        let t2_1 = TreeNode.init(1)
        let t2_3 = TreeNode.init(3)
        let t2_4 = TreeNode.init(4)
        let t2_7 = TreeNode.init(7)
        t2_2.left = t2_1
        t2_2.right = t2_3
        t2_1.right = t2_4
        t2_3.right = t2_7
        
        let a = mergeTrees(t1_1, t2_2)
        
        print("a")
    }
}
