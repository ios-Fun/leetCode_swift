//
//  Solution725.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution725 {
    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var count:Int = 0
        var curNode:ListNode? = root
        var resultList:[ListNode?] = Array()
        while curNode != nil {
            count += 1
            curNode = curNode?.next
        }
        
        let width = count / k
        let rem = count % k
        curNode = root
        for i in 0..<k {
            let remValue = i < rem ? 1 : 0
            let dummyHead = ListNode(0)
            var stepCur = dummyHead
            for _ in 0..<(width+remValue) {
                let node = ListNode(curNode?.val ?? 0)
                stepCur.next = node
                stepCur = node
                curNode = curNode?.next
            }
            resultList.append(dummyHead.next)
        }
        return resultList
    }
    
    func test() {
        let node1 = ListNode.init(1)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(3)
        let node4 = ListNode.init(4)
        let node5 = ListNode.init(5)
        let node6 = ListNode.init(6)
        let node7 = ListNode.init(7)
        let node8 = ListNode.init(8)
        let node9 = ListNode.init(9)
        let node10 = ListNode.init(10)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node8
        node8.next = node9
        node9.next = node10
        let result = splitListToParts(node1, 3)
        print("aaa")
    }
}
