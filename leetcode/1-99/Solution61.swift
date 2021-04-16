//
//  Solution61.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 思路--用数组存放每个节点
// 2. 采用环，然后断开环

class Solution61 {
    
    // 类似快慢指针
    func rotateRight2(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard var head = head else {
            return nil
        }
        
        var dummyHead = ListNode.init(0)
        // dummyHead.next = head
        
        var count = 0
        var cursor:ListNode? = head
        while(cursor != nil) {
            
            cursor = cursor!.next
            count += 1
        }
        
        if k % count == 0 {
            return head
        }
        
        let step = k % count + 1
        let countStep = count - step
        
        cursor = head
        count = 0
        while count < countStep {
            cursor = cursor!.next
            count += 1
        }
        dummyHead.next = cursor!.next
        
        var newCursor = cursor!.next
        cursor!.next = nil
        
        while newCursor!.next != nil {
            newCursor = newCursor!.next
        }
        
        newCursor!.next = head
        
        return dummyHead.next
        
    }
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        guard var head = head else {
            return nil
        }
        
        var nodeList:[ListNode] = Array()
        
        var cursor:ListNode? = head
        
        while (cursor != nil) {
            nodeList.append(cursor!)
            cursor = cursor!.next
        }
        
        let k = k % nodeList.count
        
        for _ in (0..<k) {
            let lastNode = nodeList.last!
            lastNode.next = head
            nodeList.insert(lastNode, at: 0)
            nodeList.removeLast()
            nodeList.last!.next = nil
            head = lastNode
        }
        
        return head
    }
    
    func test() {
        let node1 = ListNode.init(0)
        let node2 = ListNode.init(1)
        let node3 = ListNode.init(2)
        let node4 = ListNode.init(4)
        let node5 = ListNode.init(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let node_a = rotateRight2(node1, 4)
        
        let node_b = rotateRight2(node1, 2)
    }
}
