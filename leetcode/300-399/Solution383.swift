//
//  Solution383.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution383 {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magazineList:[Int] = Array.init(repeating: 0, count: 26)
        for char in magazine {
            let toIntValue = Int(char.asciiValue!) - 97
            magazineList[toIntValue] += 1
        }
        for char in ransomNote {
            let toIntValue = Int(char.asciiValue!) - 97
            if magazineList[toIntValue] == 0 {
                return false
            }else {
                magazineList[toIntValue] -= 1
            }
        }
        return true
    }
    
    func test() {
        print(canConstruct("a", "b"))
        print(canConstruct("aa", "ab"))
        print(canConstruct("aa", "aab"))
    }
}
