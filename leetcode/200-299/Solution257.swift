//
//  Solution257.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution257 {
    
    // 迭代
    func binaryTreePaths2(_ root: TreeNode?) -> [String] {
        // todo
        return []
    }
    
    // 递归
    var list:[String] = Array()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if root == nil {
            return list
        }
        let curList:[Int] = Array()
        dfs(root!, curList)
        return list
    }
    
    func dfs(_ node: TreeNode, _ curList:[Int]) {
        var newList = curList
        newList.append(node.val)
        if node.left == nil && node.right == nil {
            let str = newList.map{String.init($0)}.reduce("", {
                if $0.isEmpty {
                    return $1
                }else {
                    return $0+"->"+$1
                }
            })
            list.append(str)
            return
        }
        if node.left != nil {
            dfs(node.left!, newList)
            //curList.removeLast()
        }
        if node.right != nil {
            dfs(node.right!, newList)
            // curList.removeLast()
        }
    }
    
    func test(){
        let nodea_1 = TreeNode.init(1)
        let nodea_2 = TreeNode.init(2)
        let nodea_3 = TreeNode.init(3)
        let nodea_4 = TreeNode.init(4)
        let nodea_5 = TreeNode.init(5)
        nodea_1.left = nodea_2
        nodea_1.right = nodea_3
        nodea_2.right = nodea_5
        nodea_3.left = nodea_4
        print(binaryTreePaths(nodea_1))
    }
}
