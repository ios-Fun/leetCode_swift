//
//  Solution237.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution {
    func deleteNode(_ node: ListNode?) {
        if node == nil {
            return
        }
        guard let nextNode = node!.next else{
            var curNode = node
            curNode = nil
            return
        }
        node?.val = nextNode.val
        node?.next = nextNode.next
    }
    
    func test() {
        var node4 = ListNode.init(4)
        var node5 = ListNode.init(5)
        var node1 = ListNode.init(1)
        var node9 = ListNode.init(9)
        node4.next = node5
        node5.next = node1
        node1.next = node9
        deleteNode(node5)
        
        deleteNode(node1)
    }
    
}
