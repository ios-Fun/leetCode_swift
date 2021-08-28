//
//  Solution443.swift
//  leetcode
//
//  Created by xiao on 2021/8/26.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 压缩字符串
// 1. 定义一个新的结果
// 常数额外空间
// 双指针
class Solution443 {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count == 1 {
            return 1
        }
        
        var left = 0
        var right = 0
        var index = 0
        while right < chars.count {
            
            while right < chars.count && chars[left] == chars[right] {
                right += 1
            }
            if left != right - 1 {  // 多个相同字符的情况
                chars[index] = chars[left]
                index += 1
                let numsList = Array(String(right - left))
                for i in 0..<numsList.count {
                    chars[index] = numsList[i]
                    index += 1
                }
            } else {    // 只有一个字符
                chars[index] = chars[left]
                index += 1
            }
            left = right
            
        }
        return index
    }
    
    func test() {
        var chars1: [Character] = ["a","a","b","b","c","c","c"]
        print(compress(&chars1))
        
        var chars2: [Character] = ["a"]
        print(compress(&chars2))
        
        var chars3: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        print(compress(&chars3))
    }
}
