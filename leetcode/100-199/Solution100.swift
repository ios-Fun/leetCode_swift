//
//  Solution100.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 遍历--未完成
class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if (p == nil && q != nil) || (p != nil && q == nil) {
            return false
        }
        if p == nil && q == nil {
            return true
        }
        
        if p!.val != q!.val {
            return false
        }
        let flagLeft = isSameTree(p!.left, q!.left)
        let flagRight = isSameTree(p!.right, q!.right)
        
        return flagLeft && flagRight
    }
    
//    func isSameNode(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//
//    }
    
    func test() {
        let a1: TreeNode = TreeNode.init(1)
        let a2: TreeNode = TreeNode.init(2)
        let a3: TreeNode = TreeNode.init(3)
        a1.left = a2
        a1.right = a3
        let b1: TreeNode = TreeNode.init(1)
        let b2: TreeNode = TreeNode.init(2)
        let b3: TreeNode = TreeNode.init(4)
        b1.left = b2
        b1.right = b3
        
        print(isSameTree(a1, b1))
    }
}
