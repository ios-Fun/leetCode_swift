//
//  Solution652.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/18.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 采用了hash表
// 为什么要用后序遍历
class Solution652 {
    var nodeList: [TreeNode] = []
    var resultList: [TreeNode] = []
    var dic:[String: Int] = [:]
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        nodeList = []
        resultList = []
        dic = [:]
        middleTravel(root)
        for node in nodeList {
            let nodeStr = getString(node)
            if dic[nodeStr] == nil {
                dic[nodeStr] = 1
            } else {
                dic[nodeStr] = dic[nodeStr]! + 1
                if dic[nodeStr]! == 2 {
                    resultList.append(node)
                }
            }
        }
        // print("nodeList: \(nodeList.count)")
        return resultList
    }
    
    func getString( _ node: TreeNode?) -> String{
        guard let node = node else {
            return "#"
        }
        return getString(node.left) + ";" + getString(node.right)  + ";" + "\(node.val);"
    }
    
    
    func middleTravel( _ node: TreeNode?) {
        guard let node = node else {
            return
        }
        nodeList.append(node)
        middleTravel(node.left)
        middleTravel(node.right)
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(2)
        let node6 = TreeNode(4)
        let node7 = TreeNode(4)
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node3.left = node5
        node3.right = node6
        node5.left = node7
        let resutlt = findDuplicateSubtrees(node1)
        print(resutlt.count)
        
    }
}
