//
//  Solution103.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var list:[TreeNode] = Array()
        list.append(root)
        var result:[[Int]] = Array()
        
        var level = 1
        while !list.isEmpty {
            var itemArray:[Int] = Array()
            var newQueue:[TreeNode] = Array()
            for i in 0..<list.count {
                let node = list[i]
                itemArray.append(node.val)
                if node.left != nil {
                    newQueue.append(node.left!)
                }
                if node.right != nil {
                    newQueue.append(node.right!)
                }
            }
            
            if level & 1 == 0 {
                itemArray = itemArray.reversed()
            }
            list = newQueue
            result.append(itemArray)
            level += 1
        }
        return result
    }
    
    func test() {
        let nodea_3 = TreeNode(3)
        let nodea_9 = TreeNode(9)
        let nodea_20 = TreeNode(20)
        let nodea_15 = TreeNode(15)
        let nodea_7 = TreeNode(7)
        nodea_3.left = nodea_9
        nodea_3.right = nodea_20
        nodea_9.left = nodea_15
        nodea_20.right = nodea_7
        
        print(zigzagLevelOrder(nodea_3))
    }
}

// 3
 // 9 , 20

// 15, 7
