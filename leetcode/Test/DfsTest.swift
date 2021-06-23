//
//  DfsTest.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/22.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class DfsTest {
    
    var result:[String] = []
    func getAllText(str: String) -> [String] {
        if str.isEmpty {
            return []
        }
        dfs(0,"", Array(str))
        return result
    }
    
    func dfs(_ index: Int, _ curStr: String, _ chars: [Character]) {
        if index == chars.count {
            result.append(curStr)
            return
        }
        let char = chars[index]
        if char >= "A" && char <= "Z" {
            dfs(index + 1, curStr.appending(String(char)), chars)
            dfs(index + 1, curStr.appending(String(Character(Unicode.Scalar(Int(char.asciiValue!)+32)!))), chars)
//            var a = "a"
//            a.uppercased()
        }else if char >= "a" && char <= "z"{
            dfs(index + 1, curStr.appending(String(char)), chars)
            dfs(index + 1, curStr.appending(String(Character(Unicode.Scalar(Int(char.asciiValue!)-32)!))), chars)
        }else {
            dfs(index + 1, curStr.appending(String(char)), chars)
        }
    }
    
    
    func test() {
        print(getAllText(str: "a1b1c"))
    }
}
