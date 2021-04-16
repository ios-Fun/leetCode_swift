//
//  Solution445.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 2. 先得到长度a1, a2, 然后长的先前进几步。最后得结果链表进行进位的处理
class Solution445 {
    
    // 反转链表
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // todo
        return nil
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        var l1Count = 0
        var l2Count = 0
        var l1Cursor = l1
        var l2Cursor = l2
        while l1Cursor != nil {
            l1Count = l1Count + 1
            l1Cursor = l1Cursor!.next
        }
        while l2Cursor != nil {
            l2Count = l2Count + 1
            l2Cursor = l2Cursor!.next
        }
        
        
        // 虚拟头节点
        let resultRoot = ListNode.init(0)
        var resultCursor = resultRoot
        
        l1Cursor = l1
        l2Cursor = l2
        if l1Count > l2Count {
            // l1 先前进几步
            var count = 0
            while count < l1Count - l2Count {
                let node = ListNode.init(l1Cursor!.val)
                resultCursor.next = node
                resultCursor = node
                count = count + 1
                l1Cursor = l1Cursor!.next
            }
        }
        
        if l2Count > l1Count {
            // l2 先前进几步
            var count = 0
            while count < l2Count - l1Count {
                let node = ListNode.init(l2Cursor!.val)
                resultCursor.next = node
                resultCursor = node
                count = count + 1
                l2Cursor = l2Cursor!.next
            }
        }
        
        while l1Cursor != nil {
            let node = ListNode.init(l1Cursor!.val + l2Cursor!.val)
            resultCursor.next = node
            resultCursor = node
            l1Cursor = l1Cursor!.next
            l2Cursor = l2Cursor!.next
        }
        
        // 进位处理
        var finish = false
        while(!finish) {
            finish = true
            var cursor = resultRoot.next
            if cursor!.val > 9 {
                //
                let node = ListNode.init(1)
                node.next = cursor
                resultRoot.next = node
                cursor!.val = cursor!.val - 10
            }
            while cursor != nil {
                let next = cursor!.next
                if next != nil && next!.val > 9 {
                    next!.val = next!.val - 10
                    cursor!.val = cursor!.val + 1
                    finish = false
                }
                cursor = next
            }
            
        }
        
        return resultRoot.next
    }
    
    func test() {
        let listc_1 = ListNode.init(5)
        let listd_1 = ListNode.init(5)
        let node2 = addTwoNumbers(listc_1, listd_1)
        
        let lista_1 = ListNode.init(7)
        let lista_2 = ListNode.init(2)
        let lista_3 = ListNode.init(4)
        let lista_4 = ListNode.init(3)
        lista_1.next = lista_2
        lista_2.next = lista_3
        lista_3.next = lista_4
        
        let listb_1 = ListNode.init(5)
        let listb_2 = ListNode.init(6)
        let listb_3 = ListNode.init(4)
        listb_1.next = listb_2
        listb_2.next = listb_3
        
        let node1 = addTwoNumbers(lista_1, listb_1)
        print("aaa")
    }
}
