//
//  Solution709.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/2.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution709 {
    func toLowerCase(_ str: String) -> String {
        var charsArray = Array(str)
        for i in 0..<charsArray.count {
            let char = charsArray[i]
            if Int(char.asciiValue!) >= 65 && Int(char.asciiValue!) <= 90 {
                charsArray[i] = Character(Unicode.Scalar(Int(char.asciiValue!) + 32)!)
            }
        }
        var result = ""
        for char in charsArray {
            result.append(char)
        }
        return result
    }
    
    func test() {
        print(toLowerCase("Helloz"))
        print(toLowerCase("hereZ"))
        print(toLowerCase("ALOVELY"))
    }
}
