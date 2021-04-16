//
//  Solution606.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution606 {
    func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else {
            return ""
        }
        var result = ""
        let leftStr = tree2str(t.left)
        let rightStr = tree2str(t.right)
        result.append(String(t.val))
        if rightStr.count > 0 || leftStr.count > 0{
            result.append("(\(leftStr))")
        }
        if rightStr.count > 0 {
            result.append("(\(rightStr))")
        }
        return result
    }
    
    func test() {
        let nodea1 = TreeNode(1)
        let nodea2 = TreeNode(2)
        let nodea3 = TreeNode(3)
        let nodea4 = TreeNode(4)
        nodea1.left = nodea2
        nodea1.right = nodea3
        nodea2.left = nodea4
        print(tree2str(nodea1))
        
        let nodeb1 = TreeNode(1)
        let nodeb2 = TreeNode(2)
        let nodeb3 = TreeNode(3)
        let nodeb4 = TreeNode(4)
        nodeb1.left = nodeb2
        nodeb1.right = nodeb3
        nodeb2.right = nodeb4
        print(tree2str(nodeb1))
    }
}
