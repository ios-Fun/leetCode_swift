//
//  File.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1367 {
    
    // 递归 -- 超时
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        return dfs(head, root) || isSubPath(head, root.left) || isSubPath(head, root.right)
    }
    
    func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else {
            return true
        }
        guard let root = root else {
            return false
        }
        if head.val != root.val {
            return false
        }
        return dfs(head.next, root.left) || dfs(head.next, root.right)
    }
    
    
    func test() {
        let lista1 = ListNode.init(4)
        let lista2 = ListNode.init(2)
        let lista3 = ListNode.init(8)
        lista1.next = lista2
        lista2.next = lista3
        
        let treea1 = TreeNode.init(1)
        let treea2 = TreeNode.init(4)
        let treea3 = TreeNode.init(4)
        let treea4 = TreeNode.init(2)
        let treea5 = TreeNode.init(2)
        let treea6 = TreeNode.init(1)
        let treea7 = TreeNode.init(6)
        let treea8 = TreeNode.init(8)
        let treea9 = TreeNode.init(1)
        let treea10 = TreeNode.init(3)
        treea1.left = treea2
        treea1.right = treea3
        treea2.right = treea4
        treea3.right = treea5
        treea4.left = treea6
        treea5.left = treea7
        treea5.right = treea8
        treea8.left = treea9
        treea8.right = treea10
        
        print(isSubPath(lista1, treea1))
    }
}
