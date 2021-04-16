//
//  Solution107.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1.层次遍历后reverse
//2.insert at 0---- 队列
class Solution107 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
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
            //resultList.append(valueList)
            resultList.insert(valueList, at: 0)
            curLevelNodes.removeAll()
            curLevelNodes.append(contentsOf: tempNodes)
        }
        return resultList
    }
    
    
}
