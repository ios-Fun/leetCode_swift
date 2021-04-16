//
//  Solution82.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 链表，记录先前节点，当前节点
class Solution82 {
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        
        // 虚拟头节点
        let dummyNode = ListNode.init(0)
        dummyNode.next = head
        
        var cursor = head
        var preNodeVal:Int? = nil
        
        while cursor != nil {
            let next = cursor?.next
            
            var needRemove = false
            if next != nil {
                if cursor!.val == next!.val {
                    needRemove = true
                }
            }
            if !needRemove && preNodeVal != nil && preNodeVal == cursor!.val{
                needRemove = true
            }
            preNodeVal = cursor!.val
            
            if needRemove {
                if next != nil {
                    cursor!.val = next!.val
                    cursor!.next = next!.next
                }else {
                    cursor = nil
                }
            }else {
                cursor = next
            }
        }
        
        return dummyNode.next
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var headNew = head
        var cursor:ListNode? = headNew
        var preNode:ListNode? = nil
        var preValue:Int?
        while(cursor != nil) {
            let next = cursor!.next
            if (next != nil && cursor!.val == next!.val) || (preValue != nil && cursor!.val == preValue!) {
                if cursor === headNew {
                    //如果是head
                    headNew = next
                }else {
                    preNode!.next = next
                }
                preValue = cursor!.val
                cursor = next
                continue
            }else {
                preNode = cursor
                preValue = cursor!.val
                cursor = next
            }
        }
        return headNew
    }
    
    func test() {
        
        let a1 = ListNode.init(1)
        let a2 = ListNode.init(2)
        let a3 = ListNode.init(3)
        let a4 = ListNode.init(3)
        let a5 = ListNode.init(4)
        let a6 = ListNode.init(4)
        let a7 = ListNode.init(5)
        a1.next = a2
        a2.next = a3
        a3.next = a4
        a4.next = a5
        a5.next = a6
        a6.next = a7
        let node1 = deleteDuplicates2(a1)
        
        let b1 = ListNode.init(1)
        let b2 = ListNode.init(1)
        let b3 = ListNode.init(1)
        let b4 = ListNode.init(2)
        let b5 = ListNode.init(3)
        b1.next = b2
        b2.next = b3
        b3.next = b4
        b4.next = b5
        let node2 = deleteDuplicates2(b1)
    }
}
