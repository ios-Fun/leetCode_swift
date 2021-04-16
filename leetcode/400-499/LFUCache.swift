//
//  LFUCache.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 数据结构：
// 1. hash1: 所有的node都放在hash，查找时直接查找
// 2. hash2: 存放次数和 双向链表的头节点。
// 3. 双向链表: 相同次数的双向链表
class LFUCache {
    var capacity = 0
    var dicNodes:[Int: LFUCacheNode] = Dictionary()
    var dicFrqNodes:[Int: LFUCacheList] = Dictionary()
    
    var minFrq = 0
    
    var size = 0
    
    init(_ capacity: Int) {
        self.size = 0
        self.minFrq = 0
        self.capacity = capacity
        self.dicNodes = Dictionary()
        self.dicFrqNodes = Dictionary()
    }
    
    // 频次增加
    private func freqOnNode(_ node: LFUCacheNode) {
        let feq = node.count
        let linkListOld = dicFrqNodes[feq]
        linkListOld?.removeNode(node)
        if feq == minFrq && linkListOld!.head.next === linkListOld!.tail {
            minFrq = minFrq + 1
        }
        node.count = node.count + 1
        var linkListNew = dicFrqNodes[feq+1]
        if linkListNew == nil {
            linkListNew = LFUCacheList.init()
            dicFrqNodes[feq+1] = linkListNew
        }
        linkListNew!.addNode(node)
    }
    
    func get(_ key: Int) -> Int {
        if let node = dicNodes[key]{
            freqOnNode(node)
            return node.value
        }else {
            return -1
        }
    }
    
    // 如果超出容量，要删除最低频次的最后一个元素，tail?
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {
            return
        }
        
        if let node = dicNodes[key] {
            // 已经有key对应的node -- 更新value
            node.value = value
            freqOnNode(node)
        }else {
            
            if size == capacity {
                // 先删除再添加
                if let linkedList = dicFrqNodes[minFrq] {
                    // 删除尾节点--如何快速获取
                    dicNodes.removeValue(forKey: linkedList.tail.prev!.key)
                    linkedList.removeNode(linkedList.tail.prev!)
                    size = size - 1
                }
            }
            
            // 新的key
            let newNode = LFUCacheNode.init(key, value)
            dicNodes[key] = newNode
            var linkList = dicFrqNodes[1]
            if linkList == nil {
                linkList = LFUCacheList.init()
                dicFrqNodes[1] = linkList
            }
            linkList!.addNode(newNode)
            minFrq = 1
            size = size + 1
        }
    }
}

class LFUCacheList {
    var head: LFUCacheNode  //虚拟头节点
    var tail: LFUCacheNode  //虚拟尾节点
    
    init() {
        head = LFUCacheNode.init()
        tail = LFUCacheNode.init()
        head.next = tail
        tail.prev = head
    }
    
    // 删除节点
    func removeNode(_ node: LFUCacheNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // 增加节点
    func addNode(_ node: LFUCacheNode) {
        node.next = head.next
        node.next?.prev = node
        head.next = node
        node.prev = head
    }
}


// 
class LFUCacheNode{
    
    var value:Int = 0          // value
    var key:Int = 0               // key
    var count:Int = 1               // 频次
    var next:LFUCacheNode?
    var prev:LFUCacheNode?
    
    init(_ key: Int, _ value:Int) {
        self.key = key
        self.value = value
        self.count = 1
        self.next = nil
        self.prev = nil
    }
    
    init() {
        
    }
}

class LFUCacheTest {
    
    func test() {
        let cache = LFUCache.init(2)
        cache.put(1, 1)
        cache.put(2, 2)
        print(cache.get(1))
        cache.put(3, 3)
        print(cache.get(2))
        print(cache.get(3))
        cache.put(4, 4)
        print(cache.get(1))
        print(cache.get(3))
        print(cache.get(4))
    }
}
