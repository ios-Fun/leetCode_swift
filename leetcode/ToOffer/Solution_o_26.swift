//
//  Solution_o_26.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_26 {
    // 1. 递归
    // 2. 比较遍历结果
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        return isSameSub(A, B!) || isSubStructure(A!.left, B) || isSubStructure(A!.right, B)
    }
    
    // 是否有相同的子树
    func isSameSub(_ nodeA: TreeNode?, _ nodeB: TreeNode) -> Bool {
        if nodeA == nil {
            return false
        }
        // A 和 B 都不为空
        if nodeA!.val == nodeB.val {
            return (nodeB.left == nil || isSameSub(nodeA!.left, nodeB.left!)) && (nodeB.right == nil || isSameSub(nodeA!.right, nodeB.right!))
        }
        return false
    }
    
//    func isSameTree(_ nodeA: TreeNode?, _nodeB:TreeNode?) -> Bool {
//
//    }
    
    func test() {
        let nodea_3 = TreeNode(3)
        let nodea_4 = TreeNode(4)
        let nodea_5 = TreeNode(5)
        let nodea_1 = TreeNode(1)
        let nodea_2 = TreeNode(2)
        nodea_3.left = nodea_4
        nodea_3.right = nodea_5
        nodea_4.left = nodea_1
        nodea_4.right = nodea_2
        
        let nodeb_4 = TreeNode(4)
        let nodeb_1 = TreeNode(1)
        nodeb_4.left = nodeb_1
        
        print(isSubStructure(nodea_3, nodeb_4))
    }
}
