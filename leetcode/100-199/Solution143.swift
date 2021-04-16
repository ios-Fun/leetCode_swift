//
//  Solution143.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution143 {
    // 1. 遍历的方式
    // todo 耗时还是偏多
    func reorderList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        // 找到中间节点
        var slow:ListNode? = head
        var fast:ListNode? = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var middle:ListNode? = slow?.next
        slow?.next = nil
        // 然后对后半节点 做反转
        var dummyNode = ListNode(0)
        var cur = middle
        while cur != nil {
            let next = cur?.next
            cur?.next = dummyNode.next
            dummyNode.next = cur
            cur = next
        }
        
        // 然后把后半链表插入到前半链表 两个链表合并
        var firstCur:ListNode? = head
        var secondCur:ListNode? = dummyNode.next
        while secondCur != nil {
            let firstNext = firstCur?.next
            let secondNext = secondCur?.next
            
            secondCur?.next = firstCur?.next
            firstCur?.next = secondCur
            
            secondCur = secondNext
            firstCur = firstNext
        }
    }
    
    // 2. 递归 -- 会超时
    func reorderList2(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        let result = getNodes(head)
        if head !== result.pre {
            result.tail?.next = head.next
            result.pre?.next = nil
            head.next = result.tail
            reorderList(head.next?.next)
        }
    }
    
    func getNodes(_ node: ListNode?) -> (pre:ListNode?, tail: ListNode?) {
        guard let node = node else {
            return (nil, nil)
        }
        var curNode:ListNode? = node
        var nextNode:ListNode? = node.next
        while nextNode?.next != nil {
            curNode = curNode?.next
            nextNode = nextNode?.next
        }
        return (curNode, nextNode)
    }
    
    
    func test() {
        let nodea_1 = ListNode.init(1)
        let nodea_2 = ListNode.init(2)
        let nodea_3 = ListNode.init(3)
        let nodea_4 = ListNode.init(4)
        //let nodea_5 = ListNode.init(5)
        nodea_1.next = nodea_2
        nodea_2.next = nodea_3
        nodea_3.next = nodea_4
        //nodea_4.next = nodea_5
        reorderList(nodea_1)
        print("aaa")
    }
}

// 1-> 2-> nil
// 3-> 4
// 4-> 3

// 1->2->3->nil
// 4->5
// 5->4

