//
//  Solution_o_54.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_54 {
    
    //1. 中序遍历
    //2. 从右遍历
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var count = 0
        var stack:[TreeNode] = Array()
        var cur:TreeNode? = root
        
        while cur != nil || !stack.isEmpty {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.right
            }
            cur = stack.last!
            count += 1
            if count == k {
                return cur!.val
            }
            stack.removeLast()
            cur = cur?.left
        }
        
        return 0
    }
    
    func test() {
        let roota_3 = TreeNode(3)
        let roota_1 = TreeNode(1)
        let roota_4 = TreeNode(4)
        let roota_2 = TreeNode(2)
        roota_3.left = roota_1
        roota_3.right = roota_4
        roota_1.right = roota_2
        print(kthLargest(roota_3, 3))
    }
}
