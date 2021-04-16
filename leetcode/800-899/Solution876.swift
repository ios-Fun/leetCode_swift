//
//  Solution876.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution876 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow:ListNode? = head
        // var fast:ListNode? = slow?.next?.next
        var fast:ListNode? = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        if fast?.next != nil {
            slow = slow?.next
        }
        return slow
    }
    
    func test() {
        let nodea_1 = ListNode.init(1)
        let nodea_2 = ListNode.init(2)
        let nodea_3 = ListNode.init(3)
        let nodea_4 = ListNode.init(4)
        let nodea_5 = ListNode.init(5)
        
        nodea_1.next = nodea_2
        nodea_2.next = nodea_3
        nodea_3.next = nodea_4
        nodea_4.next = nodea_5
        let nodea = middleNode(nodea_5)
        print("aaa")
        
        let nodeb_1 = ListNode.init(1)
        let nodeb_2 = ListNode.init(2)
        let nodeb_3 = ListNode.init(3)
        let nodeb_4 = ListNode.init(4)
        let nodeb_5 = ListNode.init(5)
        let nodeb_6 = ListNode.init(6)
        nodeb_1.next = nodeb_2
        nodeb_2.next = nodeb_3
        nodeb_3.next = nodeb_4
        nodeb_4.next = nodeb_5
        nodeb_5.next = nodeb_6
        let nodeb = middleNode(nodeb_4)
        print("aaa")
    }
}
