//
//  Solution206.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 迭代 记录先前，当前，和下一个
// 2. 递归
class Solution206 {
    
    // 采用虚拟头节点
    func reverseList2(_ head: ListNode?) -> ListNode? {
        let dummyHeadNode = ListNode.init(0)
        var cur:ListNode? = head
        while cur != nil {
            let next = cur!.next
            cur!.next = dummyHeadNode.next
            dummyHeadNode.next = cur
            cur = next
        }
        return dummyHeadNode.next
    }
    
    // 头插法
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next = cur!.next
            cur!.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    func test() {
        let node1 = ListNode.init(1)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(3)
        let node4 = ListNode.init(4)
        let node5 = ListNode.init(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let node_a = reverseList2(node1)
        let node_b = reverseList2(node2)
    }
}
