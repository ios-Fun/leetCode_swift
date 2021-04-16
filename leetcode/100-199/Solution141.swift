//
//  Solution141.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 快慢指针
// 2. 把节点地址放在set中？(空间换时间)
class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        var set = Set<UnsafeMutableRawPointer>()
        
        var cursor:ListNode? = head
        while (cursor != nil) {
            let objAddress = Unmanaged.passUnretained(cursor as AnyObject).toOpaque()
            if set.contains(objAddress) {
                return true
            }
            set.insert(objAddress)
            cursor = cursor!.next
        }
        return false
    }
    
//    func addressOf(_ o: UnsafeRawPointer) -> String {
//        let addr = unsafeBitCast(o, to: Int.self)
//        return String(format: "%p", addr)
//    }
    
    
    func test() {
        let node1 = ListNode.init(3)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(0)
        let node4 = ListNode.init(-4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2
        print(hasCycle(node1))
    }
}
