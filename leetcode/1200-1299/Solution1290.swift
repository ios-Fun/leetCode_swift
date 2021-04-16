//
//  Solution1290.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1290 {
    // 递归
    func getDecimalValue(_ head: ListNode?) -> Int {
        return getValue(head).result
    }
    
    func getValue(_ head: ListNode?) -> (result: Int, count: Int, powValue:Int) {
        guard let head = head else {
            return (0, 0, 1)
        }
        let value = getValue(head.next)
        return (head.val * value.powValue + value.result, value.count + 1, value.powValue * 2)
    }
    
    // 方法2: 反转链表
    
    func test() {
        let nodea_1 = ListNode.init(1)
        let nodea_2 = ListNode.init(0)
        let nodea_3 = ListNode.init(1)
        nodea_1.next = nodea_2
        // nodea_2.next = nodea_3
        print(getDecimalValue(nodea_2))
    }
}
