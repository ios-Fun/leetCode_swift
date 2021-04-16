//
//  Solution572.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution572 {
    // 方法2
    // 中序遍历 14235 142
    // 先序遍历 34125 412
    
    // 方法1
    // 递归
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if t == nil {
            return true
        }
        if s == nil {
            return false
        }
        return isSubtree(s?.left, t) || isSubtree(s?.right, t) || isSametree(s, t)
    }
    
    //是否相同的树
    func isSametree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if s == nil || t == nil {
            return false
        }
        if s!.val != t!.val {
            return false
        }
        return isSametree(s!.left, t!.left) && isSametree(s!.right, t!.right)
    }
    
    func test() {
        let a_3 = TreeNode(3)
        let a_4 = TreeNode(4)
        let a_5 = TreeNode(5)
        let a_1 = TreeNode(1)
        let a_2 = TreeNode(2)
        a_3.left = a_4
        a_3.right = a_5
        a_4.left = a_1
        a_4.right = a_2
        
        print(isSubtree(a_3, a_4))
    }
}
