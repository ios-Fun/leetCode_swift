//
//  Solution784.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/3.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution784 {

    func letterCasePermutation2(_ S: String) -> [String] {
        guard !S.isEmpty else {
            return []
        }
        var res: [String] = []
        func _dfs(_ res: inout [String], _ path: String, _ start: Int) {
            if S.count == path.count {
                res.append(path)
            } else {
                var path = path
                for i in start..<S.count {
                    let c = String(S[S.index(S.startIndex, offsetBy: i)..<S.index(S.startIndex, offsetBy: i + 1)])
                    if c >= "a" && c <= "z" {
                        path += c.uppercased()
                        _dfs(&res, path, i + 1)
                        path.removeLast()
                    } else if c >= "A" && c <= "Z" {
                        path += c.lowercased()
                        _dfs(&res, path, i + 1)
                        path.removeLast()
                    }
                    path += c
                    _dfs(&res, path, i + 1)
                    path.removeLast()
                }
            }
        }
        _dfs(&res, "", 0)
        return res
    }
    
    var S :String!
    var resultString:[String]!
    var charS:[Character]!
    func letterCasePermutation(_ S: String) -> [String] {
        if S.isEmpty {
            return []
        }
        self.S = S
        self.resultString = Array()
        self.charS = Array(S)
        dfs([], 0)
        return resultString
    }

    func dfs(_ path: [Character], _ start: Int) {
        if S.count == path.count {
            var result = ""
            for item in path {
                result.append(item)
            }
            resultString.append(result)
            
        }else {
            var path = path
            for i in start..<S.count {
                var c = Int(charS[i].asciiValue!)
                if (c >= 65 && c <= 90) || (c >= 97 && c <= 122) {
                    if c >= 65 && c <= 90 {
                        c += 32
                    }else {
                        c -= 32
                    }
                    path.append(Character(Unicode.Scalar(c)!))
                    dfs(path, i + 1)
                    path.removeLast()
                }
                path.append(charS[i])
                dfs(path, i + 1)
                path.removeLast()
            }
        }
    }
    
    func test() {
        print(letterCasePermutation("a1b2"))
        print(letterCasePermutation("3z4"))
        print(letterCasePermutation("12345"))
    }
}
