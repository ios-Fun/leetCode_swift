//
//  Solution990.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution990 {
    
    func test() {
        print(equationsPossible(["c==d","d==c","f==b","b==c"]))
        print(equationsPossible(["c==c","f!=a","f==b","b==c"]))
        print(equationsPossible(["a==b","b!=a"]))
        print(equationsPossible(["b==a","a==b"]))
        print(equationsPossible(["a==b","b==c","a==c"]))
        print(equationsPossible(["a==b","b!=c","c==a"]))
        print(equationsPossible(["c==c","b==d","x!=z"]))
    }
    
    func equationsPossible(_ equations: [String]) -> Bool {
        var uf = UnionFind990()
        for i in 0..<equations.count {
            let s = equations[i]
            let char1 = String(s[s.index(s.startIndex, offsetBy: 0)])
            let char2 = String(s[s.index(s.startIndex, offsetBy: 3)])
            let equationStr = String(s[s.index(s.startIndex, offsetBy: 1) ..< s.index(s.startIndex, offsetBy: 3)])
            if char1 == char2  {
                if equationStr == "==" {
                    continue
                }else {
                    return false
                }
            }
            if !uf.add(char1, char2, flag: equationStr == "==") {
                return false
            }
        }
        return true
    }
}

struct UnionFind990 {
    var parents:[String:String] = Dictionary()
    var size = 0
    
    public mutating func add(_ char1: String, _ char2: String, flag: Bool) -> Bool{
        var flag1 = true
        if parents[char1] == nil {
            parents[char1] = char1
            flag1 = false
            size += 1
        }
        
        var flag2 = true
        if parents[char2] == nil {
            parents[char2] = char2
            flag2 = false
            size += 1
        }
        
        if isConnected(char1, char2) {
            // 已经连接了
            if !flag {
                return false
            }else {
                return true
            }
        }else {
            // 未连通的
            if flag1 && flag2 {
                if flag {
                    return false
                }else {
                    return true
                }
            }else {
                if flag {
                    self.union(char1, char2)
                }
                return true
            }
        }
    }
    
    
    // 查找
    public func find(_ char: String) -> String{
        
        if parents[char] == nil {
            return ""
        }
        
        var i = char
        while i != parents[i] {
            i = parents[i]!
        }
        return i
    }
    
    // 合并
    public mutating func union(_ char1: String, _ char2: String) {
        let root1 = find(char1)
        let root2 = find(char2)
        if root1 != root2 {
            parents[root2] = root1
            size -= 1
        }
    }
    
    public func isConnected(_ char1: String, _ char2: String) -> Bool{
        return find(char1) == find(char2)
    }
}
