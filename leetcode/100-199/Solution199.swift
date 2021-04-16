//
//  Solution199.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. bfs 层序遍历
// 2. dfs 深度优先遍历
class Solution199 {
    var result = [Int]()
    func rightSideView(_ root: TreeNode?) -> [Int] {
        dfs(root, 0)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ depth: Int) {
        guard let node = node else {
            return
        }
        if depth >= result.count {
            result.append(node.val)
        }
        dfs(node.right, depth + 1)
        dfs(node.left, depth + 1)
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let node2 = TreeNode.init(2)
        let node3 = TreeNode.init(3)
        let node4 = TreeNode.init(4)
        let node5 = TreeNode.init(5)
        node1.left = node2
        node1.right = node3
        node2.right = node5
        node3.right = node4
        print(rightSideView(node1))
    }
}

// 1， 3，4
