//
//  Solution151.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution151 {
    func reverseWords(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        let chars = Array(s)
        var resultChars:[Character] = Array()
        
        var i = 0
        let length = s.count
        var isSpace = true //false -- 非空格， true -- 前一个为空格
        
        // 先去除空格
        while i < length {
            if chars[i] != " " {
                // 如果不是空格
                resultChars.append(chars[i])
                isSpace = false
            }else if !isSpace {
                // 前一个是非空格
                resultChars.append(chars[i])
                isSpace = true
            }else {
                // 前一个是空格
            }
            i += 1
        }
        if resultChars.last == " " {
            resultChars.removeLast()
        }
        
        // 先逆序整体的字符串
        var left = 0
        var right = resultChars.count - 1
        while left < right {
            resultChars.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        // 再逆序单个字符串
        var start = 0
        let count = resultChars.count
        var wordIndex = 0
        // print("result:", String(resultChars))
        if resultChars.count == 0 {
            return ""
        }
        while start + wordIndex < count{
            if resultChars[start + wordIndex] == " " {
                // 遇到空格了
                // 颠倒
                for i in 0..<wordIndex>>1 {
                    resultChars.swapAt(start + i, start + wordIndex - i - 1)
                }
                start = start + wordIndex + 1
                wordIndex = 0
            }else {
                wordIndex += 1
            }
        }
        // 最后一个颠倒
        for i in 0..<wordIndex>>1 {
            resultChars.swapAt(start + i, start + wordIndex - i - 1)
        }
        return String(resultChars)
    }
    
    func test() {
        print(reverseWords("     "))
        print(reverseWords("the sky is blue"))

        print(reverseWords("  hello world!  "))

        print(reverseWords("a good   example"))
    }
}
