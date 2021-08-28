//
//  Solution541.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 执行时间过长
class Solution541 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        // var resultStr = ""
        var chars = Array(s)
        var left = 0
        while left < s.count {
            let right = min(left + k - 1, s.count-1)
            // [left, right]
            for i in 0...(right - left) >> 1 {
                chars.swapAt(left + i, right - i)
            }
            left = left + 2 * k
        }
        return chars.map{String.init($0)}.reduce("", +)
    }
    
    func test() {
        print(reverseStr("abcdefg", 2))
        print(reverseStr("abcdefg", 1))
        
        print(reverseStr("abcd", 2))
    }
}
