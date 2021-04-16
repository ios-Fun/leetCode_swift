//
//  Solution328.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution328 {
    // todo 可以省去虚拟头节点
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        let dummyFirst = ListNode(0)
        let dummySecond = ListNode(0)
        
        var tailFirst:ListNode? = dummyFirst
        var tailSecond:ListNode? = dummySecond
        
        var first = head
        var second = head?.next
        while first != nil {
            
            let firstNext = second?.next
            let secondNext = firstNext?.next
            
            tailFirst?.next = first
            tailFirst = first
            
            tailSecond?.next = second
            tailSecond = second
            
            first = firstNext
            second = secondNext
        }
        tailFirst?.next = dummySecond.next
        return dummyFirst.next
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
        
        let node = oddEvenList(node5)
        print("aaa")
        
        let nodeb_1 = ListNode.init(2)
        let nodeb_2 = ListNode.init(1)
        let nodeb_3 = ListNode.init(3)
        let nodeb_4 = ListNode.init(5)
        let nodeb_5 = ListNode.init(6)
        let nodeb_6 = ListNode.init(4)
        let nodeb_7 = ListNode.init(7)
        nodeb_1.next = nodeb_2
        nodeb_2.next = nodeb_3
        nodeb_3.next = nodeb_4
        nodeb_4.next = nodeb_5
        nodeb_5.next = nodeb_6
        nodeb_6.next = nodeb_7
        let nodeb = oddEvenList(nodeb_1)
        print("bbb")
        
        let nodec = oddEvenList(nil)
        print("ccc")
    }
}
