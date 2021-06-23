//
//  Solution_o_28.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_28 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return true
    }
    
    func test() {
        let node1 = TreeNode.init(1)
        let nodel2 = TreeNode.init(2)
        let noder2 = TreeNode.init(2)
        let nodel3 = TreeNode.init(3)
        let noder3 = TreeNode.init(3)
        let nodel4 = TreeNode.init(4)
        let noder4 = TreeNode.init(4)
        node1.left = nodel2
        node1.right = noder2
        nodel2.left = nodel3
        nodel2.right = noder4
        
        noder2.left = nodel4
        noder2.right = noder3
        print(isSymmetric(node1))
    }
}
