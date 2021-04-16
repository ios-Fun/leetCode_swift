//
//  Solution337.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/6.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划？
class Solution337 {
    
    // 记忆化递归
    // todo
    func rob(_ root: TreeNode?) -> Int {
        let result = nodeValue(root)
        return max(result.select, result.notSelect)
    }
    
    func nodeValue(_ node: TreeNode?) -> (select: Int, notSelect: Int) {
        guard let node = node else {
            return (0, 0)
        }
        let leftResult = nodeValue(node.left)
        let rightResult = nodeValue(node.right)
        
        return ((node.val + leftResult.notSelect + rightResult.notSelect), max(leftResult.select, leftResult.notSelect) + max(rightResult.select, rightResult.notSelect))
    }
    
    func test() {
        
        let c_1 = TreeNode.init(4)
        let c_2 = TreeNode.init(1)
        let c_3 = TreeNode.init(2)
        let c_4 = TreeNode.init(3)
        c_1.left = c_2
        c_2.left = c_3
        c_3.left = c_4
        print(rob(c_1))
        
        let a_1 = TreeNode.init(3)
        let a_2 = TreeNode.init(2)
        let a_3 = TreeNode.init(3)
        let a_4 = TreeNode.init(3)
        let a_5 = TreeNode.init(1)
        a_1.left = a_2
        a_1.right = a_3
        a_2.right = a_4
        a_3.right = a_5
        print(rob(a_1))
        
        let b_1 = TreeNode.init(3)
        let b_2 = TreeNode.init(4)
        let b_3 = TreeNode.init(5)
        let b_4 = TreeNode.init(1)
        let b_5 = TreeNode.init(3)
        let b_6 = TreeNode.init(1)
        b_1.left = b_2
        b_1.right = b_3
        b_2.left = b_4
        b_2.right = b_5
        b_3.right = b_6
        print(rob(b_1))
    }
}

//           [3+3+1][5]
//      [2][3]      [3][1]
//        [3][0]      [1][0]


//        [7, 3]
//      [4,3]     nil
//   [2,3]  nil
// [3,0]
