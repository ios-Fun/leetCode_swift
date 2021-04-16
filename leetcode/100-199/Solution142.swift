//
//  Solution142.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 思路--快慢指针，两个到达同一个节点后，再继续下次的次数就是环的长度，然后用两个指针，一个先走环的长度
// 2. 字典<存地址, 节点>, 或者是set
class Solution142 {
    
    // 快慢指针
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        //todo
        return nil
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var dic = Dictionary<UnsafeMutableRawPointer, ListNode>()
        
        var cursor:ListNode? = head
        
        while(cursor != nil) {
            let objAddress = Unmanaged.passUnretained(cursor as AnyObject).toOpaque()
            if dic[objAddress] != nil {
                
                return dic[objAddress]
            }
            dic[objAddress] = cursor
            cursor = cursor!.next
        }
        return nil
    }
    
    func test() {
        let node1 = ListNode.init(3)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(0)
        let node4 = ListNode.init(-4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2
        let nodea = detectCycle(node1)
        
        let nodeb = detectCycle(node2)
    }
}
