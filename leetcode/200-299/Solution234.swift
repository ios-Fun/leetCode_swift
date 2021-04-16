//
//  Solution234.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 判断是否回文链表
// 1->2 false
// 1->2->2->1 true

// 1. 链表反转后，遍历比较 --- 空间复杂度O(n)
// 2. O(n) 时间复杂度和 O(1) 空间复杂度 -- 反转一半的链表
class Solution234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var cursor = head
        var count = 0
        while cursor != nil {
            count = count + 1
            cursor = cursor!.next
        }
        if count == 1 {
            return true
        }
        
        let step = count & 1 == 0 ? count >> 1 : count >> 1 + 1
        var fast = head
        var fastCount = 0
        while fastCount != step {
            fastCount = fastCount + 1
            fast = fast!.next
        }
        
        // 反转
        var cur = fast
        var fastHead:ListNode? = nil
        while cur != nil {
            let next = cur!.next
            cur!.next = fastHead
            fastHead = cur
            cur = next
        }
        var fastHeadCursor = fastHead
        cursor = head
        while fastHeadCursor != nil {
            if fastHeadCursor!.val != cursor!.val {
                return false
            }
            fastHeadCursor = fastHeadCursor!.next
            cursor = cursor!.next
        }
        
        return true
    }
    
    func test() {
        let a_1 = ListNode.init(1)
        let a_2 = ListNode.init(2)
        a_1.next = a_2
        print(isPalindrome(a_1))
        
        let b_1 = ListNode.init(1)
        let b_2 = ListNode.init(2)
        let b_5 = ListNode.init(3)
        let b_3 = ListNode.init(2)
        let b_4 = ListNode.init(1)
        b_1.next = b_2
        b_2.next = b_5
        b_5.next = b_3
        b_3.next = b_4
        print(isPalindrome(b_1))
    }
}
