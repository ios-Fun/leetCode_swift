//
//  Solution101.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 对称二叉树
//  1.递归
// 2. 遍历
class Solution101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else{
            return true
        }

        
        return isNonesSymmetric(root.left, root.right)
    }
    
    func isNonesSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        // 有一个为空
        if (left == nil && right != nil) || (left != nil && right == nil) {
            return false
        }
        
        // 值不相同
        if left!.val != right?.val {
            return false
        }
        // (left, right) = (right, left)
        
        let flagLeft = isNonesSymmetric(left!.left, right!.right)
        let flagRight = isNonesSymmetric(left!.right, right!.left)
        return flagLeft && flagRight
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let nodel2 = TreeNode.init(2)
        let noder2 = TreeNode.init(2)
        let nodel3 = TreeNode.init(3)
        let noder3 = TreeNode.init(3)
        let nodel4 = TreeNode.init(4)
        let noder4 = TreeNode.init(4)
        node1.left = nodel2
        node1.right = noder2
        nodel2.left = nodel3
        nodel2.right = noder4
        
        noder2.left = nodel4
        noder2.right = noder3
        
        print(isSymmetric(node1))
    }
}
