//
//  Solution530.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution530 {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        
        var cur:TreeNode? = root
        var stack:[TreeNode] = []
        
        var minSub:Int = -1
        var preValue:Int?
        while cur != nil || stack.count > 0 {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            let popValue = stack.removeLast()
            if preValue == nil {
                preValue = popValue.val
            }else {
                if minSub == -1 {
                    minSub = popValue.val - preValue!
                }else {
                    minSub = min(minSub, popValue.val - preValue!)
                }
                
                preValue = popValue.val
            }
            cur = popValue.right
        }
        
        return minSub
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node3 = TreeNode(4)
        let node2 = TreeNode(3)
        node1.right = node3
        node3.left = node2
        print(getMinimumDifference(node1))
    }
}
