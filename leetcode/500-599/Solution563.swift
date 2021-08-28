//
//  Solution563.swift
//  leetcode
//
//  Created by xiao on 2021/8/28.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution563 {
    func findTilt(_ root: TreeNode?) -> Int {
        // return findTiltValues(root).sub
        return 0
    }
    
//    func findTiltValues(_ root: TreeNode?) -> (sub: Int, add: Int) {
//        guard let root = root else {
//            return (sub:0, add: 0)
//        }
//        let leftValues = findTiltValues(root.left)
//        let rightValues = findTiltValues(root.right)
//        return (sub: abs(leftValues.sub - rightValues.sub), add: leftValues.add + rightValues.add)
//    }
    
    func test() {
        let nodea1 = TreeNode.init(1)
        let nodea2 = TreeNode.init(2)
        let nodea3 = TreeNode.init(3)
        nodea1.left = nodea2
        nodea1.right = nodea3
        print(findTilt(nodea1))
        
        let nodeb1 = TreeNode.init(4)
        let nodeb2 = TreeNode.init(2)
        let nodeb3 = TreeNode.init(9)
        let nodeb4 = TreeNode.init(3)
        let nodeb5 = TreeNode.init(5)
        let nodeb6 = TreeNode.init(7)
        nodeb1.left = nodeb2
        nodeb1.right = nodeb3
        nodeb2.left = nodeb4
        nodeb2.right = nodeb5
        nodeb3.right = nodeb6
        print(findTilt(nodeb1))
    }
}
