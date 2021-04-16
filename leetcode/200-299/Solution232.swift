//
//  Solution232.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// todo O(1)的思路
class MyQueue232 {
    
    // 用两个栈
    var stack:[Int] = Array()
    
    var stackTemp:[Int] = Array()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        //stack.append(x)
        
        //
        while(stack.count > 0) {
            let lastValue = stack.last!
            stack.removeLast()
            stackTemp.append(lastValue)
        }
        stack.append(x)
        
        while(stackTemp.count > 0){
            let lastValue = stackTemp.last!
            stackTemp.removeLast()
            stack.append(lastValue)
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        let lastValue = stack.last!
        stack.removeLast()
        return lastValue
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return stack.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack.count == 0 ? true : false
    }
    
    func test() {
        push(1)
        push(2)
        push(3)
        print(peek())
    }
}

//if value == 1:
//    print('存取款')
//elif value == 2:
//    input()
//elif value == 3:
//    print('咨询')
