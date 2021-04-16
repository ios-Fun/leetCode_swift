//
//  Solution677.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

struct MapSumNode {
    // 子节点
    var children =  [Character: MapSumNode]()
    let char:Character?
    var val: Int
    var wordVal:Int?
    init(_ ch: Character? = nil) {
        self.char = ch
        self.val = 0
    }
}

// 前缀树 todo
class MapSum {
    let root = MapSumNode()
    /** Initialize your data structure here. */
    init() {

    }
    
    func insert(_ key: String, _ val: Int) {
        var node = root
        node.val += val
        var path = [MapSumNode]()
        path.append(node)
        for char in key {
            if let next = node.children[char] {
                // 存在
                node = next
                node.val += val
                path.append(node)
            }else {
                var newNode = MapSumNode(char)
                newNode.val = val
                node.children[char] = newNode
                node = newNode
            }
        }
        if let wordVal = node.wordVal {
            for i in 0..<path.count {
                var node = path[i]
                node.val -= wordVal
            }
        }
        node.wordVal = val
    }
    
    func sum(_ prefix: String) -> Int {
        var node = root
        for char in prefix {
            if let next = node.children[char] {
                node = next
            }else {
                return 0
            }
        }
        return node.val
    }
}

class Solution677 {
    func test() {
        
    }
}
