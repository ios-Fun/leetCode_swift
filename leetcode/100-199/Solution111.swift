//
//  Solution111.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 思路：1. 保存一层的节点，如果left和right为nil，则返回当前层
// 执行用时太慢
class Solution111 {
    func minDepth(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        var list:[TreeNode] = Array()
        list.append(root!)
        var depth = 0
        
        while (list.count > 0) {
            depth = depth + 1
            let count = list.count
            for _ in (0..<count) {
                let node = list.first
                list.removeFirst()
                if node!.left == nil && node!.right == nil {
                    return depth
                }else {
                    if node!.left != nil {
                        list.append(node!.left!)
                    }
                    if node!.right != nil{
                        list.append(node!.right!)
                    }
                }
            }
        }
        return depth
    }
    
    func test() {
        let root = TreeNode.init(1)
        let root2 = TreeNode.init(2)
        let root3 = TreeNode.init(3)
        let root4 = TreeNode.init(4)
        let root5 = TreeNode.init(5)
        root.left = root2
        root.right = root3
        root2.left = root4
        root2.right = root5
        print(minDepth(root))
    }
}
