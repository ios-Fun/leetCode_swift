//
//  Solution83.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var cursor = head
        var pre:ListNode? = nil
        
        while cursor != nil {
            let next = cursor!.next
            if pre == nil {
                pre = cursor
            }else {
                if cursor!.val == pre!.val {
                    pre!.next = next
                }else {
                    pre = cursor
                }
            }
            cursor = next
        }
        
        return head
    }
    
    func test() {
        let a1 = ListNode.init(1)
        let a2 = ListNode.init(1)
        let a3 = ListNode.init(2)
        a1.next = a2
        a2.next = a3
        
        let node_1 = deleteDuplicates(a1)
        
        let b1 = ListNode.init(1)
        let b2 = ListNode.init(1)
        let b3 = ListNode.init(2)
        let b4 = ListNode.init(3)
        let b5 = ListNode.init(3)
        b1.next = b2
        b2.next = b3
        b3.next = b4
        b4.next = b5
        let node_2 = deleteDuplicates(b1)
        
        let node_3 = deleteDuplicates(b1)
    }
}
