//
//  Heap.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/6.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 堆
public struct Heap<T> {
    var elements = [T]()
    
    fileprivate var isOrderedBefore:(T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
      self.isOrderedBefore = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.isOrderedBefore = sort
        
    }
    
    public var isEmpty: Bool {
      return elements.isEmpty
    }

    public var count: Int {
      return elements.count
    }
    
    // 建立堆
    fileprivate mutating func buildHeap(fromArray array: [T]) {
        elements = array
        
        // O(n)复杂度 -- 自下向上建堆
        for i in stride(from: (elements.count >> 1 - 1), to: 0, by: -1) {
            shiftDown(i, heapSize: elements.count)
        }
    }
    
    // 返回 top
    public func peek() -> T? {
      return elements.first
    }
    
    // 添加元素
    mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(elements.count - 1)
    }
    
    // 删除堆顶元素
    mutating func remove() -> T? {
        if elements.isEmpty {
            return nil
        }else if elements.count == 1 {
            return elements.removeLast()
        }else {
            let value = elements[0]
            elements[0] = elements.last!
            elements.removeLast()
            shiftDown()
            return value
        }
    }
    
    // 替换元素
    mutating func replace(index i: Int, value: T) {
        guard i < elements.count else {
            return
        }
        assert(isOrderedBefore(value, elements[i]))
        elements[i] = value
        shiftUp(i)
    }
    
    // 上滤
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        while childIndex > 0 && isOrderedBefore(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        elements[childIndex] = child
    }
    
    // 下滤
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
    // 下滤 -- 带参数
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
            let rightChildIndex = self.rightChildIndex(ofIndex: parentIndex)
            var first = parentIndex
            
            // 先比较父节点与左子节点的大小
            if leftChildIndex < heapSize && isOrderedBefore(elements[leftChildIndex], elements[first]) {
                first = leftChildIndex
            }
            
            // 再比较 first 与右子节点的大小
            if rightChildIndex < heapSize && isOrderedBefore(elements[rightChildIndex], elements[first]) {
                first = leftChildIndex
            }
            
            // 已经没有比较 || 到了最后
            if first == parentIndex {
                return
            }
            elements.swapAt(parentIndex, first)
            parentIndex = first
        }
    }
    
    func leftChildIndex(ofIndex i: Int) -> Int {
        return  i << 1 + 1
    }
    
    func rightChildIndex(ofIndex i: Int) -> Int {
        return  i << 1 + 2
    }
    
    func parentIndex(ofIndex i:Int) -> Int {
        return (i-1) >> 1
    }
}

extension Heap where T: Equatable {
//    func index(of element: T) -> Int? {
//        return index(of: element)
//    }
    
//    public func index(of element: T) -> Int? {
//      return index(of: element, 0)
//    }
    
}
