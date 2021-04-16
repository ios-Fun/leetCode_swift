//
//  Solution513.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution513 {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        // 层序遍历
        var nodesArray:[TreeNode] = Array()
        nodesArray.append(root!)
        
        repeat {
            var nextLevelArray:[TreeNode] = Array()
            for i in 0..<nodesArray.count {
                if nodesArray[i].left != nil {
                    nextLevelArray.append(nodesArray[i].left!)
                }
                if nodesArray[i].right != nil {
                    nextLevelArray.append(nodesArray[i].right!)
                }
            }
            if nextLevelArray.count == 0 {
                return nodesArray.first!.val
            }else {
                nodesArray = nextLevelArray
            }
        }while (true)
    }
    
    func test() {
        let node2 = TreeNode.init(2)
        let node1 = TreeNode.init(1)
        let node3 = TreeNode.init(3)
        node2.left = node1
        node2.right = node3
        print(findBottomLeftValue(node2))
        
        
    }
}
