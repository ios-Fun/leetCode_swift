//
//  Solution2.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 链表的遍历
// 2. 采用递归
// 3. 采用栈
class Solution2 {
    
    //1. 递归
    func addTwoNumbers3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode.init(0)
        dummyHead.next = getNode(l1, l2, 0)
        return dummyHead.next
    }
    
    func getNode(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        if l1 == nil && l2 == nil {
            if carry == 0 {
                return nil
            }else {
                return ListNode.init(carry)
            }
        }else {
            let nodeval = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            let node = ListNode.init(nodeval % 10)
            node.next = getNode(l1?.next, l2?.next, nodeval / 10)
            return node
        }
    }
    
    //2. 链表
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1Node = l1;
        var l2Node = l2;
        let root = ListNode(0)
        var cursor = root
        var carry = 0
        
        while (l1Node != nil || l2Node != nil || carry != 0) {
            
            let l1Value = l1Node?.val ?? 0
            let l2Value = l2Node?.val ?? 0
            
            let addValue =  l1Value + l2Value + carry
            print("addValue", addValue % 10, l1Value)
            let sumNode = ListNode(addValue % 10)
            
            carry = addValue / 10
            // 坐标的next指向下个节点
            // 坐标指向下个节点
            cursor.next = sumNode
            cursor = sumNode
            
            if l1Node != nil {
                l1Node = l1Node!.next
            }
            
            if l2Node != nil {
                l2Node = l2Node!.next
            }
        }
        return root.next
    }
    
    // 3. 链表的细节优化
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1Node = l1;
        var l2Node = l2;
        
        // 虚拟头节点
        let dummyHead = ListNode(0)
        var cursor = dummyHead
        var carry = 0
        
        while (l1Node != nil || l2Node != nil) {
            
            let l1Value = l1Node?.val ?? 0
            let l2Value = l2Node?.val ?? 0
            
            let addValue =  l1Value + l2Value + carry
            print("addValue", addValue % 10, l1Value)
            let sumNode = ListNode(addValue % 10)
            
            carry = addValue / 10
            // 坐标的next指向下个节点
            // 坐标指向下个节点
            cursor.next = sumNode
            cursor = sumNode
            
            if l1Node != nil {
                l1Node = l1Node!.next
            }
            
            if l2Node != nil {
                l2Node = l2Node!.next
            }
        }
        if carry > 0 {
            cursor.next = ListNode.init(carry)
        }
        return dummyHead.next
    }
    
    func test() {
        let a1 = ListNode(2)
        let a2 = ListNode(4)
        let a3 = ListNode(3)
        a1.next = a2
        a2.next = a3
        
        let b1 = ListNode(5)
        let b2 = ListNode(6)
        let b3 = ListNode(4)
        b1.next = b2
        b2.next = b3
        _ = addTwoNumbers3(a1, b1)
        print("aaa")
    }
}
