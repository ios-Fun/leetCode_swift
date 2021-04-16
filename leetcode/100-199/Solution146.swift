//
//  Solution146.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// LRU--访问过的放在最前面
// 字典 + 链表
class LRUCache {
    
    var map: [Int: LRUCacheNode]
    
    var count:Int
    var capacity:Int
    var head: LRUCacheNode?
    var tail: LRUCacheNode?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        count = 0
        head = nil
        tail = nil
        self.map = [Int: LRUCacheNode]()
    }
    
    // 获取key的value值，并且将该节点设置到head
    func get(_ key: Int) -> Int {
        guard let node = map[key] else{
            return -1
        }
        
        if node.prev != nil {
            
            if node == tail {
                // 如果node是尾节点
                tail = node.prev
            }
            
            // node的前节点 下个指向 node 的后节点
            node.prev!.next = node.next
            
            // node的后节点 前指向 node的前节点
            node.next?.prev = node.prev
            node.next = head
            head?.prev = node
            node.prev = nil
            head = node
            
        }
        // 头节点
        return node.val
    }
    
    //
    func put(_ key: Int, _ value: Int) {
        // 加到头, 先看是否有该key
        
        if let node = map[key]{
            // 已经有该node了
            node.val = value
            if node.prev != nil {
                if node == tail {
                    // 如果node是尾节点
                    tail = node.prev
                }
                
                // node的前节点 下个指向 node 的后节点
                node.prev!.next = node.next
                
                // node的后节点 前指向 node的前节点
                node.next?.prev = node.prev
                node.next = head
                head?.prev = node
                node.prev = nil
                head = node
            }
            
        }else {
            // 新建node 加到head
            let putNode = LRUCacheNode.init(key, value)
            map[key] = putNode
            
            if head == nil {
                tail = putNode
            }
            count = count + 1
            
            //加到head
            putNode.next = head
            head?.prev = putNode
            head = putNode
            
            if count > capacity {
                
                // map清除
                map.removeValue(forKey: tail!.key)
                
                //清除尾部
                tail?.prev?.next = nil
                tail = tail?.prev
            }
        }
    }
}

class LRUCacheNode:Equatable {
    static func == (lhs: LRUCacheNode, rhs: LRUCacheNode) -> Bool {
        return lhs.val == rhs.val && lhs.key == rhs.key
    }
    
    var val:Int
    var key:Int
    var next:LRUCacheNode?
    var prev:LRUCacheNode?
    
    init(_ key: Int, _ val:Int) {
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }
}


class LRUCacheTest {
    func test() {
        let cache = LRUCache(2)
        cache.put(2, 1)
        cache.put(1, 1)
        cache.put(2, 3)
        cache.put(4, 1)
        print(cache.get(1))
        print(cache.get(2))
        
//        print(cache.get(1))
//        cache.put(3, 3)
//        print(cache.get(2))
//        cache.put(4, 4)
//        print(cache.get(1))
//        print(cache.get(3))
//        print(cache.get(4))
    }
}
