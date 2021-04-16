//
//  PriorityQueue.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/6.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 优先级队列
public struct PriorityQueue<T> {
    var heap: Heap<T>
    
    public init(sort: @escaping(T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    // 头部元素
    public func peek() -> T? {
        return heap.peek()
    }
    
    // 入队
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    // 出队
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    // 修改某处的值（优先级）
    public mutating func changePriority(index i: Int, value: T) {
        return heap.replace(index: i, value: value)
    }
}
