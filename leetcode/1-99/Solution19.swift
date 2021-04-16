//
//  Solution19.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 用数组
// 2. 用字典<位置，Node>
// 3. 快慢指针，快指针先走N步
// 4. 先获取长度，然后找到倒数第K个节点后删除
class Solution19 {
    
    //3. 快慢指针，快指针先走N步(最好的方法)
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode.init(0)
        dummyHead.next = head
        
        var fastNode = head
        
        var slowNode = head
        
        // 快指针先走n + 1步
        
        // n + 1是否会空指针异常？
        var index = 0
        while index <= n {
            fastNode = fastNode?.next
            index += 1
        }
        
        while fastNode != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        
        // n+1 是取删除节点的头节点
        slowNode?.next = slowNode?.next?.next
        
        return dummyHead.next
    }
    
    func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var nodeArray:[ListNode] = Array()
        
        // 遍历
        //let root = head
        var cursor = head
        
        while (cursor != nil) {
            nodeArray.append(cursor!)
            cursor = cursor!.next
        }
        
        let size = nodeArray.count
        
        // 删除的是头节点
        if n == size {
            if size > 1 {
                return nodeArray[1]
            }else {
                // 长度是1
                return nil
            }
        }else {
            if n == 1 {
                nodeArray[size-2].next = nil
            }else {
                nodeArray[size - n - 1].next = nodeArray[size - n + 1]
            }
            
        }
        return nodeArray[0]
    }
    
    func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let newNode = removeNthFromEnd(node1, 2)
        print(newNode)
    }
}
