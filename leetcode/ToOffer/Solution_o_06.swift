//
//  Solution_o_06.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/4/20.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_06 {
    
    // todo 递归 回溯法
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var result:[Int] = reversePrint(head!.next)
        result.append(head!.val)
        return result
    }
    
    func reversePrint2(_ head: ListNode?) -> [Int] {
        var list:[Int] = []
        var curNode = head
        while curNode != nil {
            list.insert(curNode!.val, at: 0)
            curNode = curNode!.next
        }
        return list;
    }
    
    func test() {
        let node1 = ListNode(1);
        let node2 = ListNode(3);
        let node3 = ListNode(2);
        node1.next = node2
        node2.next = node3
        print(reversePrint(node1))
    }
}
