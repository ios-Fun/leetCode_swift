//
//  Solution148.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 链表排序
// 思路： 归并排序
// 先2个的排序，然后再4个的排序, 8..
// 不能用递归，递归的空间复杂度不是常数级别了
// 1. 先使用递归的方式--不推荐
// 2. 再使用非递归的方式

class Solution148 {
    
    func sortList(_ head: ListNode?) -> ListNode? {
        var allCount = 0
        var node = head
        // 计算长度
        while ( node != nil) {
            node = node?.next
            allCount = allCount + 1
        }
        // 虚拟头节点
        let dummyNode = ListNode.init(0)
        dummyNode.next = head
        var subCount = 1
        while subCount < allCount {
            var curNode = dummyNode.next
            var cursor:ListNode? = dummyNode
            while curNode != nil {
                // 原来的头
                let cur1 = curNode
                
                // 截取第一段, head为cur1
                let cur2 = cut(curNode, subCount)
                // 截取第二段，head为cur2
                curNode = cut(cur2, subCount)
                cursor?.next = merge(cur1, cur2)
                while cursor?.next != nil {
                    cursor = cursor?.next!
                }
            }
            subCount = subCount << 1
        }
        
        return dummyNode.next
    }
    
    // 分割 --> 下一个节点
    func cut(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard var cursor = head else {
            return nil
        }
        var count = 1
        while count < n {
            if cursor.next != nil {
                cursor = cursor.next!
                count = count + 1
            } else {
                return nil
            }
        }
        let next = cursor.next
        cursor.next = nil
        return next
    }
    
    func sortList2(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        let middle = findMiddle(head)
        let right = sortList(middle?.next)
        middle?.next = nil
        let left = sortList(head)
        let mergeNode =  merge2(left, right)
        return mergeNode
    }
    
    // 找到中间 -- 快慢指针
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head?.next
        while(fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    // 两个有序链表合并2
    private func merge2(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
        var head: ListNode? = nil
        var cursor = head
        var cursor1 = head1
        var cursor2 = head2
        
        while( cursor1 != nil && cursor2 != nil) {
            // var node: ListNode?
            if cursor1!.val < cursor2!.val {
                if head == nil {
                    cursor = cursor1
                    head = cursor
                }else {
                    cursor?.next = cursor1
                    cursor = cursor?.next
                }
                cursor1 = cursor1!.next
            } else {
                if head == nil {
                    cursor = cursor2
                    head = cursor
                }else {
                    cursor?.next = cursor2
                    cursor = cursor?.next
                }
                cursor2 = cursor2!.next
            }
        }
        if cursor1 != nil {
            // head1 还有没有遍历完成
            cursor?.next = cursor1
        }else {
            cursor?.next = cursor2
        }
        return head
    }
    
    // 两个有序链表合并
    private func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
        
        // 虚拟头节点
        let head = ListNode.init(0)
        var cursor = head
        var cursor1 = head1
        var cursor2 = head2
        while(cursor1 != nil && cursor2 != nil) {
            if cursor1!.val < cursor2!.val {
                cursor.next = cursor1
                cursor1 = cursor1!.next
            }else {
                cursor.next = cursor2
                cursor2 = cursor2!.next
            }
            cursor = cursor.next!
        }
        if cursor1 != nil {
            // head1 还有没有遍历完成
            cursor.next = cursor1
        }else {
            cursor.next = cursor2
        }
        return head.next
    }
    
    func test() {
//        let a1 = ListNode.init(4)
//        let a2 = ListNode.init(2)
//        let a3 = ListNode.init(1)
//        let a4 = ListNode.init(3)
        let a1 = ListNode.init(4)
        let a2 = ListNode.init(2)
        let a3 = ListNode.init(1)
        let a4 = ListNode.init(3)
        a1.next = a2
        a2.next = a3
        a3.next = a4
        let a = sortList(a1)
        
//        let b1 = ListNode.init(-1)
//        let b2 = ListNode.init(5)
//        let b3 = ListNode.init(3)
//        let b4 = ListNode.init(4)
//        let b5 = ListNode.init(0)
        let b1 = ListNode.init(-1)
        let b2 = ListNode.init(0)
        let b3 = ListNode.init(3)
        let b4 = ListNode.init(4)
        let b5 = ListNode.init(0)
        b1.next = b2
        b2.next = b3
        b3.next = b4
        b4.next = b5
        let b = sortList(b1)
        
        print("finish")
    }
}
