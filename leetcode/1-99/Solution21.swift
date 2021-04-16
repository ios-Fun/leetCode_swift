//
//  Solution21.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//合并两个有序链表
// 思路，两个链表同时遍历取节点，比较大小，如果相同，都next，大小不同，则next 小的那个节点
class Solution21 {

    // 递归
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val < l2!.val {
            l1!.next = mergeTwoLists2(l1?.next, l2)
            return l1
        }else {
            l2!.next = mergeTwoLists2(l1, l2?.next)
            return l2
        }
    }
    
    // 迭代 -- 虚拟头节点
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        // 虚拟头节点
        let dummyNode = ListNode(0)
        var cursor = dummyNode
        var cursor1 = l1
        
        var cursor2 = l2
        
        while(cursor1 != nil || cursor2 != nil) {
            
            if cursor1 == nil {
                cursor.next = cursor2
                break
            }
            if cursor2 == nil {
                cursor.next = cursor1
                break
            }
            
            if cursor1!.val <= cursor2!.val {
                cursor.next = cursor1
                cursor1 = cursor1!.next
            }else {
                cursor.next = cursor2
                cursor2 = cursor2!.next
            }
            cursor = cursor.next!
        }
        
        return dummyNode.next
    }
    
    func test() {
        let node1_1 = ListNode(1)
        let node1_2 = ListNode(2)
        let node1_3 = ListNode(4)
        node1_1.next  = node1_2
        node1_2.next  = node1_3
        
        let node2_1 = ListNode(1)
        let node2_2 = ListNode(3)
        let node2_3 = ListNode(4)
        node2_1.next  = node2_2
        node2_2.next  = node2_3
        
        let node = mergeTwoLists2(node1_1, node2_1)
        print("aaa")
    }
}
