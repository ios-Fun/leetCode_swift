//
//  Solution1019.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1019 {
    // 单调栈 -- 递减
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        
        var list:[Int] = Array()
        var cur:ListNode? = head
        var count = 0
        while cur != nil {
            count += 1
            list.append(cur!.val)
            cur = cur!.next
        }
        
        var stack:[Int] = Array()
        var result:[Int] = Array.init(repeating: 0, count: count)
        var index = 0
        cur = head
        while cur != nil {
            while !stack.isEmpty && list[stack.last!] < cur!.val {
                let last = stack.last!
                stack.removeLast()
                result[last] = cur!.val
            }
            stack.append(index)
            index += 1
            cur = cur?.next
        }
        
        return result
    }
    
    func test() {
        let nodea1 = ListNode(2)
        let nodea2 = ListNode(1)
        let nodea3 = ListNode(5)
        nodea1.next = nodea2
        nodea2.next = nodea3
        
        print(nextLargerNodes(nodea1))
        
        let nodeb1 = ListNode(2)
        let nodeb2 = ListNode(7)
        let nodeb3 = ListNode(4)
        let nodeb4 = ListNode(3)
        let nodeb5 = ListNode(5)
        nodeb1.next = nodeb2
        nodeb2.next = nodeb3
        nodeb3.next = nodeb4
        nodeb4.next = nodeb5
        
        print(nextLargerNodes(nodeb1))
    }
}

// 2
// 1
// 1, 5

// 2
// 2, 7
// 4, 7
// 3, 4
// 3, 4, 5

