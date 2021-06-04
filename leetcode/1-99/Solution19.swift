//
//  Solution19.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 快慢指针，快指针先走N步
// 2. 先获取长度，然后找到倒数第K个节点后删除
class Solution19 {
    
    //1. 快慢指针，快指针先走N步(最好的方法)
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 虚拟头节点
        let dummyHead = ListNode.init(0)
        dummyHead.next = head
        
        var fastNode = head
        
        var slowNode = head
        
        // 快指针先走n + 1步
        
        // n + 1是否会空指针异常？
        var index = 0
        while index <= n {
            fastNode = fastNode?.next
            index += 1
        }
        
        while fastNode != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        
        // n+1 是取删除节点的头节点
        slowNode?.next = slowNode?.next?.next
        
        return dummyHead.next
    }
    
    func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let newNode = removeNthFromEnd(node1, 2)
        print(newNode)
    }
}
