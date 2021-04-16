//
//  MyStack225.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class MyStack {
    
    // 借助两个队列
    var list:[Int] = Array()
    var listTemp:[Int] = Array()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        while(list.count > 0) {
            listTemp.append(list.first!)
            list.removeFirst()
        }
        list.append(x)
        
        while listTemp.count > 0 {
            list.append(listTemp.first!)
            listTemp.removeFirst()
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        let topValue = list.first!
        list.removeFirst()
        return topValue
    }
    
    /** Get the top element. */
    func top() -> Int {
        return list.first!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return list.count == 0
    }
}
