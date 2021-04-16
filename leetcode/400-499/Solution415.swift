//
//  Solution415.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution415 {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let num1Chars = Array(num1)
        let num2Chars = Array(num2)
        var resultChars:[Int] = Array()
        var num1Index = num1Chars.count - 1
        var num2Index = num2Chars.count - 1
        var carry = 0
        while num1Index >= 0 || num2Index >= 0 {
            var sum = 0
            if num1Index < 0 {
                sum = carry + Int(String(num2Chars[num2Index]))!
                num2Index = num2Index - 1
            }else if num2Index < 0 {
                sum = carry + Int(String(num1Chars[num1Index]))!
                num1Index = num1Index - 1
            }else {
                sum = Int(String(num1Chars[num1Index]))! + Int(String(num2Chars[num2Index]))! + carry
                num1Index = num1Index - 1
                num2Index = num2Index - 1
            }
            if sum > 9 {
                carry = 1
                resultChars.append(sum - 10)
            }else {
                carry = 0
                resultChars.append(sum)
            }
        }
        if carry == 1 {
            resultChars.append(1)
        }
        resultChars = resultChars.reversed()
        return resultChars.map{String.init($0)}.reduce("", +)
    }
    
    func test() {
        print(addStrings("78733", "233423454"))
        print(addStrings("78733", "73323"))
        print(addStrings("23333", "23344"))
    }
}
