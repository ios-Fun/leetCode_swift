//
//  Solution147.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// -1, 5, 3, 4, 0
//    pre cur
// -1 ,5  3
//       pre cur
// -1. 3, 5, 4
//          pre cur
// -1, 3, 4, 5, 0

// 记录前一个和当前节点
class Solution147 {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var head = head
        var cursor = head
        
        // var pre = head
        var pre = head  //前一个节点
        
        while cursor != nil {
            let nextNode = cursor!.next
            //let preTemp = cursor
            if cursor!.val < pre!.val {
                // 插入到合适位置
                var cursorIndexNode = head
                var indexPre = head
                while cursorIndexNode !== cursor {
                    if cursor!.val < cursorIndexNode!.val {
                        //let node = cursor
                        
                        if cursorIndexNode === head {
                            pre!.next = cursor!.next
                            cursor!.next = head
                            head = cursor
                        }else {
                            pre!.next = cursor!.next
                            indexPre!.next = cursor
                            cursor!.next = cursorIndexNode
                        }
                        break
                    }
                    indexPre = cursorIndexNode
                    cursorIndexNode = cursorIndexNode!.next
                }
                // pre =
            }else {
                pre = cursor
            }
            cursor = nextNode
        }
        return head
    }
    
    func test() {
//        let node4 = ListNode.init(4)
//        let node2 = ListNode.init(2)
//        let node1 = ListNode.init(1)
//        let node3 = ListNode.init(3)
//        node4.next = node2
//        node2.next = node1
//        node1.next = node3
//        let node = insertionSortList(node4)
        
        let b1 = ListNode.init(-1)
        let b2 = ListNode.init(5)
        let b3 = ListNode.init(3)
        let b4 = ListNode.init(4)
        let b5 = ListNode.init(0)
        b1.next = b2
        b2.next = b3
        b3.next = b4
        b4.next = b5
        
        let node_b = insertionSortList(b1)
    }
}
