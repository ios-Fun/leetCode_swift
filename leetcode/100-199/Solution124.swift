//
//  Solution124.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/3.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution124 {
    
    
    
    // 递归
    var maxValue = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxValue = Int.min
        maxPath(root)
        return maxValue
    }

    func maxPath( _ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftValue = max(maxPath(node.left), 0)
        let rightValue = max(maxPath(node.right), 0)
        let value = node.val + leftValue + rightValue
        maxValue = max(maxValue, value)
        return max(leftValue, rightValue) + node.val
    }
    
    func test() {
        
        
        let nodeb1 = TreeNode.init(-3)
        print(maxPathSum(nodeb1))

        let nodea1 = TreeNode.init(2)
        let nodea2 = TreeNode.init(-1)
        nodea1.left = nodea2
        print(maxPathSum(nodea1))


        let node1 = TreeNode.init(-10)
        let node2 = TreeNode.init(9)
        let node3 = TreeNode.init(20)
        let node4 = TreeNode.init(15)
        let node5 = TreeNode.init(7)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        print(maxPathSum(node1))
        
        // 2, -1
        let nodec_1 = TreeNode.init(-1)
        let nodec_2 = TreeNode.init(8)
        let nodec_3 = TreeNode.init(2)
        let nodec_4 = TreeNode.init(-9)
        let nodec_5 = TreeNode.init(0)
        let nodec_6 = TreeNode.init(-3)
        let nodec_7 = TreeNode.init(-9)
        let nodec_8 = TreeNode.init(2)
        nodec_1.left = nodec_2
        nodec_1.right = nodec_3
        nodec_2.right = nodec_4
        nodec_3.left = nodec_5
        nodec_4.left = nodec_6
        nodec_5.right = nodec_7
        print(maxPathSum(nodec_1))
    }
}

//      -1
//   8     2
//  nil/-9  0 nil
//nil/nil -3/nil nil/-9 nil/2

//       9
//   6       -3
//  n/n       -6/2
//n/n 2/n   -6/-6 -6
