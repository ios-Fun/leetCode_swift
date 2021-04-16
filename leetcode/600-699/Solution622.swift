//
//  Solution622.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 数组
// 2. 队列
class MyCircularQueue {
    private var capacity:Int!
    private var count:Int = 0
    private var nums:[Int]!
    private var headIndex:Int = 0
    init(_ k: Int) {
        capacity = k
        count = 0
        nums = Array.init(repeating: 0, count: k)
        headIndex = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        // 满了
        if count == capacity {
            return false
        }
        
        nums[(headIndex + count) % capacity] = value
        count += 1
        
        return true
    }
    
//    // 获取队尾 index
//    private func endIndex() -> Int {
//        return (headIndex + count) % capacity
//    }
    
    // 删除
    func deQueue() -> Bool {
        if count > 0 {
            headIndex += 1
            headIndex = headIndex % capacity
            count -= 1
            return true
        }
        return false
    }
    
    // 获取队首元素
    func Front() -> Int {
        if count > 0 {
            return nums[headIndex]
        }else {
            return -1
        }
    }
    
    // 获取队尾 元素
    func Rear() -> Int {
        if count > 0 {
            return nums[(headIndex + count - 1) % capacity]
        }else {
            return -1
        }
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func isFull() -> Bool {
        return count == capacity
    }
}

class Solution622 {
    func test() {
        let circularQueue = MyCircularQueue(3)
        print(circularQueue.enQueue(1))
        print(circularQueue.enQueue(2))
        print(circularQueue.enQueue(3))
        print(circularQueue.enQueue(4))
        print(circularQueue.Rear())
        print(circularQueue.isFull())
        print(circularQueue.deQueue())
        print(circularQueue.enQueue(4))
        print(circularQueue.Rear())
        
//        let circularQueue = MyCircularQueue(8)
//        print(circularQueue.enQueue(3))
//        print(circularQueue.enQueue(9))
//        print(circularQueue.enQueue(5))
//        print(circularQueue.enQueue(0))
//        print(circularQueue.deQueue())
//        print(circularQueue.deQueue())
//        print(circularQueue.isEmpty())
//        print(circularQueue.isEmpty())
//        print(circularQueue.Rear())
//        print(circularQueue.Rear())
//        print(circularQueue.deQueue())
        
        let circularQueue2 = MyCircularQueue(3)
        print(circularQueue2.enQueue(2))
        print(circularQueue2.Rear())
        print(circularQueue2.Front())
        print(circularQueue2.deQueue())
        print(circularQueue2.Front())
        print(circularQueue2.deQueue())
        print(circularQueue2.Front())
        print(circularQueue2.enQueue(4))
        print(circularQueue2.enQueue(2))
        print(circularQueue2.enQueue(2))
        print(circularQueue2.enQueue(3))
    }
}
