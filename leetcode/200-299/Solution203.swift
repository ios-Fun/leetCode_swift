//
//  Solution203.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution203 {
    
    // todo 待优化
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        // 可以用虚拟头节点
        var head = head
        var cursor = head
        var prev:ListNode? = nil
        
        while (cursor != nil) {
            if cursor!.val == val {
                if prev == nil {
                    head = cursor!.next
                    cursor = head
                    
                }else {
                    //previousNode = cursor
                    prev!.next = cursor!.next
                    cursor = cursor!.next
                    
                }
                continue
            }
            prev = cursor
            cursor = cursor!.next
        }
        
        return head
    }
    
    func test() {
        let node1 = ListNode.init(1)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(2)
        let node4 = ListNode.init(1)
        let node5 = ListNode.init(4)
        let node6 = ListNode.init(5)
        let node7 = ListNode.init(6)
        node1.next = node2
        node2.next = node3
        node3.next = node4
//        node4.next = node5
//        node5.next = node6
//        node6.next = node7
        
        let node_a = removeElements(node1, 2)
        
        let node_b = removeElements(node1, 6)
        
        let node_c = removeElements(node1, 3)
    }
}
