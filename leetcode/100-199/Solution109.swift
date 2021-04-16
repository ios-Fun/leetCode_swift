//
//  Solution109.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 遍历
class Solution109 {
    // 递归
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let head = head else {
            return nil
        }
        
        if head.next == nil {
            return TreeNode.init(head.val)
        }
        
        let root:ListNode? = head
        var cursor:ListNode? = root
        var cursorNext:ListNode? = root
        
        let headCopy = ListNode.init(0)
        var headCopyCursor:ListNode? = headCopy
        
        if cursorNext?.next?.next == nil {
            headCopyCursor?.next = ListNode.init(cursor!.val)
            headCopyCursor = headCopyCursor?.next
            cursor = cursor?.next
            
        }else {
            while(cursorNext != nil) {
                cursorNext = cursorNext?.next?.next
                if cursorNext != nil {
                    //if
                    headCopyCursor?.next = ListNode.init(cursor!.val)
                    headCopyCursor = headCopyCursor?.next
                    cursor = cursor?.next
                }
            }
        }
        
        //headCopyCursor = nil
        
        var rootTreeNode:TreeNode?
            //= TreeNode.init(cursor?.val)
        
        // 表示链表长度是1
        
        if cursor == nil {
            rootTreeNode = TreeNode.init(root!.val)
            rootTreeNode?.left = nil
            rootTreeNode?.right = nil
            
        }else {
            rootTreeNode = TreeNode.init(cursor!.val)
            rootTreeNode?.left = sortedListToBST(headCopy.next)
            rootTreeNode?.right = sortedListToBST(cursor?.next)
        }
        return rootTreeNode
    }
    
    // func sortedListToBSTWithNode(_ head: ListNode?,
    
    func test() {
        var node1 = ListNode.init(-10)
        var node2 = ListNode.init(-3)
        var node3 = ListNode.init(0)
        var node4 = ListNode.init(5)
        var node5 = ListNode.init(9)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        var tNode = sortedListToBST(node1)
        
        var tNode2 = sortedListToBST(node2)
    }
}
