//
//  Solution208.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 单词查找树
class Trie {
    
    private let root: TrieNode?
    private var size:Int = 0
    
    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var cursor = root
        let chars = Array(word)
        
        for item in chars {
            if cursor!.next[item] == nil {
                cursor!.next[item] = TrieNode()
            }
            cursor = cursor!.next[item]
        }
        if !cursor!.isWord {
            cursor!.isWord = true
            size = size + 1
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var cursor = root
        let chars = Array(word)
        for item in chars {
            if cursor!.next[item] == nil {
                return false
            }
            cursor = cursor!.next[item]
        }
        return cursor?.isWord ?? false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var cursor = root
        let chars = Array(prefix)
        for item in chars {
            if cursor!.next[item] == nil {
                return false
            }
            cursor = cursor!.next[item]
        }
        return true
    }
    
    func test() {
        // self.insert("apple")
        print(self.search("apple"))
        print(self.search("app"))
        print(self.startsWith("app"))
        print(self.insert("app"))
        print(self.search("app"))
    }
}

class TrieNode {
    var isWord:Bool = false
    
    var next:[Character: TrieNode] = [Character: TrieNode]()
    
    init(){
        //next = [Character: TrieNode]()
    }
}
