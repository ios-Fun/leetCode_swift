//
//  Solution211.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class WordDictionary {
    private let root: TrieNode?
    private var size:Int = 0
    
    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
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
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        let chars = Array(word)
        return find(root!, chars, 0)
    }
    
    func find(_ node: TrieNode, _ chars: [Character], _ index:Int) -> Bool{
        if index == chars.count {
            return node.isWord
        }
        if chars[index] == "." {
            for nextNode in node.next.values {
                if find(nextNode, chars, index + 1) {
                    return true
                }
            }
        }else {
            let charItem = chars[index]
            if node.next[charItem] == nil {
                return false
            }else {
                if find(node.next[charItem]!, chars, index+1) {
                    return true
                }
            }
        }
       return false
    }
    
    func test() {
        // self.insert("apple")
        self.addWord("bad")
        self.addWord("dad")
        self.addWord("mad")
        print(self.search("pad"))
        print(self.search("bad"))
        print(self.search(".ad"))
        print(self.search("b.."))
        print(self.search("..."))
        print(self.search(".."))
    }
}
