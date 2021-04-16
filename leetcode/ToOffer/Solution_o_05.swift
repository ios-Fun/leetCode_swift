//
//  Solution_o_05.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_05 {
    func replaceSpace(_ s: String) -> String {
        let chars = Array(s)
        let result = chars.map{String.init($0)}.reduce("", {
            if $1 == " " {
                return $0+"%20"
            }else {
                return $0+$1
            }
        })
        return result
    }
    
    func replaceSpace2(_ s: String) -> String {
        var result = ""
        for letter in s {
            if letter == " " {
                result += "%20"
            }else {
                result += String(letter)
            }
        }
        return result
    }
    
    func test() {
        print(replaceSpace("We are happy."))
    }
}
