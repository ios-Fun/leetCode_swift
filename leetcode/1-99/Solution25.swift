//
//  Solution25.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// K 个一组翻转链表
// 1. 用K个元素的数组（队列）存放cursor， 然后反转
// 2. 头尾节点，快慢指针
// 3. 递归
class Solution25 {
    
    // 递归 -- todo
    func reverseKGroup3(_ head: ListNode?, _ k: Int) -> ListNode? {
        // todo
        return nil
    }
    
    // 快慢指针
    func reverseKGroup2(_ head: ListNode?, _ k: Int) -> ListNode? {
        // todo
        return nil
    }
    
    // 差的方案 用数组
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if k == 1 {
            return head
        }
        
        var root = head
        var cursorArray:[ListNode?] = Array()
        // 初始化cursor数组
        var cursor = root
        
        var cursorHead:ListNode? = nil
        
        for _ in(0..<k) {
            cursorArray.append(cursor)
            cursor = cursor?.next
        }
        
        
        while(!isEnd(cursorArray)) {
            //交换
            cursorArray[0]!.next = cursorArray[k-1]!.next
            // cursorArray[k-1]!.next = cursorArray[0]!
            for i in (1...(k-1)){
                cursorArray[i]!.next = cursorArray[i-1]!
            }
            
            if cursorHead != nil {
                cursorHead!.next = cursorArray[k-1]
            }else {
                root = cursorArray[k-1]
            }
            
            //再赋值
            cursorHead = cursorArray[0]!
            var cursor = cursorHead!.next
            for i in(0..<k) {
                cursorArray[i] = cursor
                cursor = cursor?.next
            }
        }
        
        return root
    }
    
    // 有一个为nil
    func isEnd(_ cursorArray:[ListNode?]) -> Bool {
        for node in cursorArray {
            if node == nil {
                return true
            }
        }
        return false
    }
    
    func test() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        let node6 = ListNode(6)
        node1.next  = node2
        node2.next  = node3
        node3.next  = node4
        node4.next  = node5
        node5.next  = node6
        //reverseKGroup(node1, 2)
        
        reverseKGroup(node1, 3)
    }
}
