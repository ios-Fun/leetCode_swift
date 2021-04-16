//
//  Solution86.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution86 {
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var count = 0
        var cur:ListNode? = head
        var last = cur
        while cur != nil {
            last = cur
            cur = cur!.next
            count += 1
        }
        
        var index = 0
        
        // 虚拟头节点
        let dummyhead = ListNode.init(0)
        dummyhead.next = head
        
        //var pre = head
        cur = head
        while(index < count) {
            
            //let next = cur!.next
            if cur!.val >= x {
                last!.next = ListNode.init(cur!.val)
                last = last!.next
                
                // 删除当前节点
                cur!.val = cur!.next?.val as! Int
                cur!.next = cur!.next?.next
                // pre.next = next
            }else {
                cur = cur!.next
            }
            index += 1
        }
        return dummyhead.next
    }
    
    func test() {
        
        let nodeb_1 = ListNode.init(1)
        let nodeb_2 = ListNode.init(2)
        nodeb_1.next = nodeb_2
        let nodeb_r1 = partition(nodeb_1, 2)
        print("bbb")
        
        let nodea_1 = ListNode.init(1)
        let nodea_2 = ListNode.init(4)
        let nodea_3 = ListNode.init(3)
        let nodea_4 = ListNode.init(2)
        let nodea_5 = ListNode.init(5)
        let nodea_6 = ListNode.init(2)
        nodea_1.next = nodea_2
        nodea_2.next = nodea_3
        nodea_3.next = nodea_4
        nodea_4.next = nodea_5
        nodea_5.next = nodea_6
        
        let noder1 = partition(nodea_1, 3)
        print("aaa")
    }

}
// 1 4 3 2 5 2
// 3

// 1 4 3 2 5 2 4

// 结果
// 1 2 2 4 3 5

