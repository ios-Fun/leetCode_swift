//
//  Solution23.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// k个数组合并
// 1. 用了数组记录头节点，时间复杂度O(kN)，空间复杂度O(k) + O(1)
// 2. 先合并两个链表，再把下一个与新的合并
// 3. 对1改进，不用数组
// 4. 链表两两合并（最优解）
class Solution23 {
    
    
    // 链表两两合并
    func mergeKLists4(_ lists: [ListNode?]) -> ListNode? {
        // todo
        return nil
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let root:ListNode = ListNode(0)
        var cursor = root
        
        var cursorList:[ListNode?] = Array()
        
        for node in lists {
            if node != nil {
                cursorList.append(node)
            }
        }
        
        while(!isFinish(cursorList)) {
            // 只剩下一条记录了
            if cursorList.count == 1 {
                cursor.next = cursorList[0]
                break
            }
            let minIndex = minNode(cursorList)
            
            // 指针往前移动
            cursor.next = cursorList[minIndex]
            cursor = cursor.next!
            
            let nextNode = cursorList[minIndex]!.next
            if nextNode == nil {
                cursorList.remove(at: minIndex)
            }else {
                cursorList[minIndex] = nextNode
            }
        }
        
        return root.next
    }
    
    // 最小值对应的index
    func minNode(_ cursorList:[ListNode?]) -> Int {
        var minValue = cursorList[0]!.val
        var minIndex = 0
        
        for i in (1..<cursorList.count) {
            let node = cursorList[i]
            if node!.val < minValue {
                minValue = node!.val
                minIndex = i
            }
        }
        return minIndex
    }
    
    func isFinish( _ cursorList:[ListNode?]) -> Bool  {
        if cursorList.count == 0 {
            return true
        }
        for node in cursorList {
            if node != nil {
                return false
            }
        }
        
        return true
    }
    
    
    func test() {
        let node1_1 = ListNode(1)
        let node1_2 = ListNode(4)
        let node1_3 = ListNode(5)
        node1_1.next  = node1_2
        node1_2.next  = node1_3
        
        let node2_1 = ListNode(1)
        let node2_2 = ListNode(3)
        let node2_3 = ListNode(4)
        node2_1.next  = node2_2
        node2_2.next  = node2_3
        
        let node3_1 = ListNode(2)
        let node3_2 = ListNode(6)
        node3_1.next = node3_2
        
        let node = mergeKLists([node1_1, node2_1, node3_1])
    }
}
