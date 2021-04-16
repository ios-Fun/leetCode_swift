//
//  SkipList.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/7.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 跳表 时间负责度：logN
open class SkipList<Key: Comparable, Payload> {
    
    public typealias Node = DataNode<Key, Payload>
    
    fileprivate(set) var head: Node?
    
    public init() {
        
    }
}

// 查找
extension SkipList {
    // 查找
    private func findNode(key: Key) -> Node? {
        var currentNode: Node? = head
        var isFound:Bool = false
        while !isFound {
            if let node = currentNode {
                // next节点的key与当前key比较
                switch node.next {
                case .none:
                    currentNode = node.down
                case .some(let value) where value.key != nil:
                    if value.key == key {
                        isFound = true
                        break
                    }else {
                        if key < value.key! {
                            // 向下
                            currentNode = node.down
                        }else {
                            // 向右
                            currentNode = node.next
                        }
                    }
                default:
                    continue
                }
            }else {
                break
            }
        }
        if isFound {
            return currentNode
        }else {
            return nil
        }
    }
    
    // 根据key 查找value
    private func search(key: Key) -> Payload? {
        guard let node = findNode(key: key) else {
            return nil
        }
        return node.next!.data
    }
    
    // 开放的接口
    public func get(key: Key) ->Payload? {
        return search(key: key)
    }
}

// 添加
extension SkipList {
    private func bootstrapBaseLayer(key: Key, data: Payload) {
        
        // 头节点
        head = Node(asHead: true)
        var node = Node(key: key, data: data)
        head!.next = node
        
        var currentTopNode = node
        
        // 一半的概率
        while coinFlip() {
            let newHead = Node(asHead: true)
            node = Node(key: key, data: data)
            node.down = currentTopNode
            newHead.next = node
            newHead.down = head
            head = newHead
            currentTopNode = node
        }
    }
    
    // 插入元素
    private func insertItem(key: Key, data:Payload) {
        // stack 是 看 有多少层
        var stack = Stack<Node>()
        var currentNode: Node? = head
        while currentNode != nil {
            if let nextNode = currentNode!.next {
                if nextNode.key! > key {
                    stack.push(currentNode!)
                    currentNode = currentNode!.down
                }else {
                    currentNode = nextNode
                }
            }else {
                stack.push(currentNode!)
                currentNode = currentNode!.down
            }
        }
        let itemAtLayer = stack.pop()
        var node = Node(key: key, data: data)
        node.next = itemAtLayer!.next
        itemAtLayer!.next = node
        var currentTopNode = node
        
        // 随机概率 创建 N 层
        while coinFlip() {
            if stack.isEmpty {
                let newNode = Node(asHead: true)
                node = Node(key: key, data: data)
                node.down = currentTopNode
                newNode.next = node
                newNode.down = head
                head = newNode
                currentTopNode = node
            }else {
                let nextNode = stack.pop()
                node = Node(key: key, data: data)
                node.down = currentTopNode
                node.next = nextNode!.next
                nextNode!.next = node
                currentTopNode = node
            }
        }
    }
    
    // 插入元素
    func insert(key: Key, data: Payload) {
        if head != nil {
            if let node = findNode(key: key) {
                var currentNode = node.next
                while currentNode != nil && currentNode!.key == key {
                    currentNode!.data = data
                    currentNode = currentNode!.down
                }
            }else {
                insertItem(key: key, data: data)
            }
        }else {
            bootstrapBaseLayer(key: key, data: data)
        }
    }
}

// 删除
extension SkipList {
    public func remove(key: Key) {
        guard let item = findNode(key: key) else{
            return
        }
        var currentNode = Optional(item)
        while currentNode != nil {
            let node = currentNode!.next
            if node!.key != key {
                currentNode = node
                continue
            }
            let nextNode = node!.next
            currentNode!.next = nextNode
            currentNode = currentNode!.down
        }
    }
}

public class DataNode<Key: Comparable, Payload> {
    public typealias Node = DataNode<Key, Payload>
    var data: Payload?
    fileprivate var key: Key?
    var next: Node?
    var down: Node?
    
    public init(key: Key, data: Payload) {
        self.key = key
        self.data = data
    }
    
    public init(asHead head: Bool) {}
}

// 栈
public struct Stack<T> {
    fileprivate var array: [T] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    // 入栈
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    // 出栈
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    // 查看栈顶元素
    public func peek() -> T? {
        return array.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
      var curr = self
      return AnyIterator { curr.pop() }
    }
}

private func coinFlip() -> Bool {
    return arc4random_uniform(2) == 1
}
