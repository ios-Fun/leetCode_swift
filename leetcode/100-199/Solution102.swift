//
//  Solution102.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二叉树的层次遍历
// 用数组存储当前层的
class Solution102 {
    
    // 递归
    
    
    // 迭代
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var resultList:[[Int]] = Array()
        var curLevelNodes:[TreeNode] = Array()
        
        curLevelNodes.append(root)
        
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
            resultList.append(valueList)
            curLevelNodes.removeAll()
            curLevelNodes.append(contentsOf: tempNodes)
        }
        return resultList
    }
    
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
        
        print(levelOrder(root))
    }
}


//if stonenumber >=4 :
//    print("获得了打败灭霸的力量。。。")
//elif stonenumber >=1 :
//    print("可以全员出动。。。")
//else :
//    print("没办法了。。")
