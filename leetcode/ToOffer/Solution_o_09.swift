//
//  Solution_o_09.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class CQueue {
    
    var inStack:[Int] = []
    var outStack:[Int] = []
    init() {
        
    }
    
    // 加入队尾
    func appendTail(_ value: Int) {
        inStack.append(value)
    }
    
    // 删除头结点
    func deleteHead() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        if outStack.isEmpty {
            return -1
        }else {
            return outStack.removeLast()
        }
        
    }
}

class Solution_o_09 {
    func test() {
        let queue = CQueue()
        print(queue.deleteHead())
        queue.appendTail(5)
        queue.appendTail(2)
        print(queue.deleteHead())
        print(queue.deleteHead())
    }
}
