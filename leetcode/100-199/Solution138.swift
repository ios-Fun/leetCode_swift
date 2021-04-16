//
//  Solution138.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 字典
// key - value
// 原有节点Node -- 复制后的Node？

// 2. 新旧节点交替

class Solution138 {
    /*
    func copyRandomList(_ head: Node?) -> Node? {
        
        guard let head = head else {
            return nil
        }
        
        var cursor:Node? = head
        while cursor != nil {
            let next = cursor!.next
            
            let copyNode = Node.init(cursor!.val)
            cursor!.next = copyNode
            copyNode.next = next
            cursor = next
        }
        
        // 随机指针
        cursor = head
        while cursor != nil {
            let copyNode = cursor!.next
            copyNode?.random = cursor?.random?.next
            cursor = cursor?.next?.next
        }
        
        // 恢复正常链表
        cursor = head
        let headCopy:Node? = head.next
        var cursorCopy = headCopy
        while cursor != nil {
            let next = cursor!.next?.next
            cursorCopy = cursor!.next
            
            cursor!.next = next
            cursorCopy?.next = next?.next
            
            cursor = next
        }
        return headCopy
    }
    */
    
    func test() {
        let nodea_7 = Node1.init(7)
        let nodea_13 = Node1.init(13)
        let nodea_11 = Node1.init(11)
        let nodea_10 = Node1.init(10)
        let nodea_1 = Node1.init(1)
        nodea_7.next = nodea_13
        nodea_13.next = nodea_11
        nodea_11.next = nodea_10
        nodea_10.next = nodea_1
        
        nodea_13.random = nodea_7
        nodea_11.random = nodea_1
        nodea_10.random = nodea_11
        nodea_1.random = nodea_7
        
        //let node = copyRandomList(nodea_7)
        
        //print(node)
    }
}

public class Node1 {
    public var val: Int
    public var next: Node1?
    public var random: Node1?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
          self.random = nil
    }
}
