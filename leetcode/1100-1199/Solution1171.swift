//
//  Solution1171.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// todo 用时过长
class Solution1171 {
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        if head != nil && head!.next == nil && head!.val == 0 {
            return nil
        }
        let dummyNode = ListNode(0)
        dummyNode.next = head
        var curNode:ListNode? = head
        var sumList:[Int] = Array()
        var preNode:ListNode? = dummyNode
        while curNode != nil {
            
            // let nextNode = curNode!.next
            if curNode!.val == 0 {
                preNode!.next = curNode!.next
                //preNode = curNode
                curNode = curNode!.next
                continue
            }
            
            if sumList.count != 0 {
                for i in 0..<sumList.count {
                    if sumList[i] + curNode!.val == 0 {
                        var index = 0
                        var cur = dummyNode
                        while index < i {
                            index += 1
                            cur = cur.next!
                        }
                        cur.next = curNode?.next
                        return removeZeroSumSublists(dummyNode.next)
                        //break
                    }
                }
            }
            for i in 0..<sumList.count {
                sumList[i] += curNode!.val
            }
            sumList.append(curNode!.val)
            preNode = curNode
            curNode = curNode?.next
        }
        
        return dummyNode.next
    }

    
    func test() {
        let a1 = ListNode(0)
        let a2 = ListNode(2)
//        let a3 = ListNode(-3)
//        let a4 = ListNode(3)
//        let a5 = ListNode(1)
        a1.next = a2
//        a2.next = a3
//        a3.next = a4
//        a4.next = a5
        
        let nodea = removeZeroSumSublists(a1)
        
        print("aaa")
    }
}

// 1, 2, 3, -3 ,4
//    1
//    2,3
//       3,5,6
//
