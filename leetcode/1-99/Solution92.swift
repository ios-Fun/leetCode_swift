//
//  Solution92.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 把节点存为数组？循环完后
// 2. 遍历到m节点，然后 m-n次，头差法反转
class Solution92 {
    
    // 递归
    func reverseBetween2(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        return nil
    }
    
    // 头插入法
    func reverseBetween3(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        return nil
    }
    
    // 类似 双指针 方式
    func reverseBetween4(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        return nil
    }
    
    // 做的差的方式
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var headNew = head
        let mNew = m - 1
        let nNew = n - 1
        
        var list:[ListNode] = Array()
        var cursor = headNew
        var curIndex = 0
        
        let mid = (mNew + nNew)/2
        while(curIndex <= nNew) {
            
            list.append(cursor!)
            
            if curIndex > mid {
                // 交换 count 和 m+n-count
                let toIndex = mNew+nNew-curIndex
                let temp = list[curIndex].next
                if toIndex != 0 {
                    //不是头部
                    list[toIndex-1].next = list[curIndex]
                }
                
                if curIndex > toIndex + 1 {
                    // 两者不相邻
                    list[curIndex].next = list[toIndex].next
                    list[curIndex-1].next = list[toIndex]
                    list[toIndex].next = temp
                }else {
                    // 两者相邻
                    list[curIndex].next = list[toIndex]
                    list[toIndex].next = temp
                }
                if toIndex == 0 {
                    headNew = list[curIndex]
                }
                // 数组也交换
                let listTemp = list[curIndex]
                list[curIndex] = list[toIndex]
                list[toIndex] = listTemp
                cursor = temp
            }else {
                cursor = cursor!.next
            }
            
            curIndex = curIndex + 1
        }
        return headNew
    }
    
    func test() {
        let a1 = ListNode.init(1)
        let a2 = ListNode.init(2)
        let a3 = ListNode.init(3)
        let a4 = ListNode.init(4)
        let a5 = ListNode.init(5)
        a1.next = a2
        a2.next = a3
        a3.next = a4
        a4.next = a5
        let node = reverseBetween(a1, 1, 1)
    }
}
