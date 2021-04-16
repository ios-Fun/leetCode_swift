//
//  Solution104.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归
// 2. 遍历--用数组存储当前层
// 3. 遍历- 采用队列，遍历这一层的节点节点，push每个节点的左右节点后，就把它pop
class Solution104 {
    
    // 递归
    /*
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftCount = maxDepth(root.left)
        let rightCount = maxDepth(root.right)
        let maxCount =  leftCount > rightCount ? leftCount : rightCount
        return maxCount + 1
    }
    */
    
    //
    func maxDepth(_ root: TreeNode?) -> Int {
        return 0
    }
    
    // 非递归1
    /*
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        //var resultList:[[Int]] = Array()
        var curLevelNodes:[TreeNode] = Array()
        
        curLevelNodes.append(root)
        var depth:Int = 1
        while ( curLevelNodes.count > 0) {
            var tempNodes:[TreeNode] = Array()
            var valueList:[Int] = Array()
            for node in curLevelNodes {
                valueList.append(node.val)
                if node.left != nil {
                    tempNodes.append(node.left!)
                }
                if node.right != nil {
                    tempNodes.append(node.right!)
                }
            }
            if tempNodes.count == 0 {
                break
            }
            depth = depth + 1
            //resultList.append(valueList)
            curLevelNodes.removeAll()
            curLevelNodes.append(contentsOf: tempNodes)
        }
        return depth
    }
 */
    
    func test() {
        let root = TreeNode.init(3)
        let node9 = TreeNode.init(9)
        let node20 = TreeNode.init(20)
        let node15 = TreeNode.init(15)
        let node7 = TreeNode.init(7)
        root.left = node9
        root.right = node20
        node20.left = node15
        node20.right = node7
        print(maxDepth(root))
    }
}
