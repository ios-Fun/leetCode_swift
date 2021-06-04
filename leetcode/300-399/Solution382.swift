//
//  Solution382.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 获取链表长度了，然后k = random(n), 获取第k个节点

//2. 随机洗牌算法
class Solution382 {

    var head:ListNode?
    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        self.head = head
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        // var current = 1
        var cursor:ListNode? = head
        var count = 0
        var returnValue = 1
        while cursor != nil {
            count = count + 1
            // 随机到0 表示选中
            if 0 == Int.random(in: Range(0...(count-1))) {
                // 选中了，选择该值
                returnValue = cursor!.val
            }
            
            cursor = cursor!.next
        }
        return returnValue
    }
    
    // n : 1/n选中, n-1/n 不选中
    // n+1: 
    
    
}
class Solution382Test {
    func test() {
        let node1 = ListNode.init(1)
        let node2 = ListNode.init(2)
        let node3 = ListNode.init(3)
        node1.next = node2
        node2.next = node3
        
        let obj = Solution382(node1)
        for _ in 1..<100 {
            print(obj.getRandom())
        }
//
//        print(obj.getRandom())
//        print(obj.getRandom())
    }
}

