//
//  Solution160.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 把一个链表的地址放Set， 然后另外一个遍历
//2. 先获取各自长度，长的先走几步
class Solution160 {
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard let headA = headA, let headB = headB else {
            return nil
        }
        
        var lengthA = 0
        var lengthB = 0
        var cursorA:ListNode? = headA
        var cursorB:ListNode? = headB
        
        while(cursorA != nil) {
            lengthA = lengthA + 1
            cursorA = cursorA!.next
        }
        
        while(cursorB != nil) {
            lengthB = lengthB + 1
            cursorB = cursorB!.next
        }
        cursorA = headA
        cursorB = headB
        
        if lengthA > lengthB {
            //A先走几步
            while(lengthA != lengthB) {
                cursorA = cursorA!.next
                lengthA = lengthA - 1
            }
        }else {
            while(lengthA != lengthB) {
                cursorB = cursorB!.next
                lengthB = lengthB - 1
            }
        }
        
        while(cursorA != nil) {
            if cursorA === cursorB {
                return cursorA
            }
            cursorA = cursorA?.next
            cursorB = cursorB?.next
        }
        
        return nil
    }
    
    func test() {
        let node1_4 = ListNode.init(0)
        let node1_1 = ListNode.init(9)
        let node2_5 = ListNode.init(1)
        
        let node2_0 = ListNode.init(3)
        //let node2_1 = ListNode.init(1)
        let node8 = ListNode.init(2)
        let node4 = ListNode.init(4)
        //let node5 = ListNode.init(5)
        node1_4.next = node1_1
        node1_1.next = node2_5
        node2_5.next = node8
        
        node2_0.next = node8
        
        //node2_1.next = node8
        node8.next = node4
        //node5.next = node4
        
        let node = getIntersectionNode(node1_4, node2_0)
        
        let node2 = getIntersectionNode(node1_4, node2_5)
    }
}
