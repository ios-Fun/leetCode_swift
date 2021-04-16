//
//  Solution113.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. dfs--回溯法
// 2. 遍历
class Solution113 {
    
    // 遍历 -- 层序
    func pathSum2(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        // todo
        return [[]]
    }
    
    // dfs
    var result:[[Int]] = Array()
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        //var list = [Int]()
        // binary(root, sum,&list)
        dfs(root, sum,[])
        return result
    }
    
    func dfs(_ node: TreeNode?, _ sum: Int, _ list: [Int]) {
        var curList = list
        if node == nil {
            return
        }
        if node!.left == nil && node!.right == nil {
            if node!.val == sum {
                
                curList.append(node!.val)
                result.append(curList)
            }
        }
        
        if node!.left != nil {
            curList.append(node!.val)
            dfs(node!.left, sum - node!.val, curList)
            curList.removeLast()
        }
        if node!.right != nil {
            curList.append(node!.val)
            dfs(node!.right, sum - node!.val, curList)
            curList.removeLast()
        }
    }
    
    func test() {
        let node5 = TreeNode.init(5)
        let node4 = TreeNode.init(4)
        let node8 = TreeNode.init(8)
        let node11 = TreeNode.init(11)
        let node13 = TreeNode.init(13)
        let node4_r = TreeNode.init(4)
        let node7 = TreeNode.init(7)
        let node2 = TreeNode.init(2)
        let node5_b = TreeNode.init(5)
        let node1 = TreeNode.init(1)
        node5.left = node4
        node5.right = node8
        node4.left = node11
        node8.left = node13
        node8.right = node4_r
        node11.left = node7
        node11.right = node2
        node4_r.left = node5_b
        node4_r.right = node1
        print(pathSum(node5, 22))
    }
}
