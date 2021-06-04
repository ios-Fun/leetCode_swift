//
//  Solution24.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 记录上一个，当前，下一个

// 3. 递归 -- 一般链表都可以有递归思路
class Solution24 {
    
    // 2. 采用虚拟头节点
    func swapPairs2(_ head: ListNode?) -> ListNode? {
        // 虚拟头节点
        let dummyHead = ListNode.init(0)
        dummyHead.next = head
        var pre = dummyHead
        var cursor = dummyHead.next
        var cursorNext = cursor?.next
        while cursor != nil && cursorNext != nil {
            cursor!.next = cursorNext!.next
            cursorNext!.next = cursor!
            pre.next = cursorNext!
            
            pre = cursor!
            cursor = cursor!.next
            cursorNext = cursor?.next
        }
        return dummyHead.next
    }
    
    // 1. 不采用虚拟头节点
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        // var root = ListNode(0)
        var root = head
        
        var cursor = root
        var cursorNext = cursor?.next
        var cursorHead:ListNode? = nil
        while cursor != nil && cursorNext != nil {
            // 交换
            cursor!.next = cursorNext!.next
            cursorNext!.next = cursor
            if cursorHead != nil {
                cursorHead!.next = cursorNext
            }else {
                root = cursorNext
            }
            cursorHead = cursor
            cursor = cursor!.next
            cursorNext = cursor?.next
        }
        
        return root
    }
    
    func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        node1.next  = node2
        node2.next  = node3
        node3.next  = node4
        
        swapPairs(node1)
    }
}
