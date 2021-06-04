//
//  Solution8.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// / 10 后比较， 同 7 

class Solution8 {
    
    // 除10后比较
    func myAtoi2(_ str: String) -> Int32 {
        let charList = Array(str)
        var sign:Bool? = nil     // 默认空，表示正
        var num:Int32 = 0
        var hasValue = false
        if charList.count == 0 {
            return 0
        }
        
        for charItem in charList {
            if charItem == " " && !hasValue {
                continue
            }
            hasValue = true
            if charItem == "+" && sign == nil {
                sign = true
                continue
            }
            if charItem == "-" && sign == nil {
                sign = false
                continue
            }
            // 判断 在 0-9 之间
            let intValue = characterToInt(charItem)
            if intValue >= 0 && intValue < 10 {
                if sign == nil {
                    sign = true
                }
                
                if sign! {
                    // 正
                    if num > Int32.max / 10 || (num == Int32.max / 10 && intValue > Int32.max % 10) {
                        return Int32.max
                    }
                    num = num * 10 + Int32(intValue)
                }else {
                    // 负数
                    if num < Int32.min / 10 || (num == Int32.min / 10 && intValue > -(Int32.min % 10)) {
                        return Int32.min
                    }
                    
                    if num == 0 {
                        num = -Int32(intValue)
                    }else {
                        num = num * 10 - Int32(intValue)
                    }
                }
            }else {
                break
            }
        }
        return num
    }
    
    // 做法不对
    func myAtoi(_ str: String) -> Int {
        let max = 0x7fffffff
        let min = 0x80000000
        let charList = Array(str)
        var sign:Bool? = nil     // 默认空，表示正
        var num:Int = 0
        var hasValue = false
        if charList.count == 0 {
            return 0
        }
        
        for charItem in charList {
            if charItem == " " && !hasValue {
                continue
            }
            hasValue = true
            if charItem == "+" && sign == nil {
                sign = true
                continue
            }
            if charItem == "-" && sign == nil {
                sign = false
                continue
            }
            // 判断 在 0-9 之间
            let intValue = characterToInt(charItem)
            if intValue >= 0 && intValue < 10 {
                if sign == nil {
                    sign = true
                }
                num = num * 10 + intValue
                if sign == nil || sign! == true{
                    if num > max {
                        return max
                    }
                    
                }else {
                    if num > min {
                        return -min
                    }
                }
            }else {
                break
            }
        }
        
        if sign == nil || sign! == true{
            if num > max {
                num = max
            }
            return num
        }else {
            if num > min {
                num = min
            }
            return -num
        }
    }
    
    //
    private func characterToInt(_ char: Character) -> Int {
        let string = String(char)
        let index = string.unicodeScalars.startIndex
        let scalar = string.unicodeScalars[index]
        return Int(scalar.value) - 48
    }
    
    func test() {
        print(myAtoi("0-1"))
        print(myAtoi("42"))
        print(myAtoi("-0"))
        print(myAtoi("   -42"))
        
        print(myAtoi("4193 with words"))
        print(myAtoi("words and 987"))
        print(myAtoi("-91283472332"))
        print(myAtoi("-2147483648"))
        print(myAtoi("-2147483647"))
        print(myAtoi("2147483648"))
        print(myAtoi("20000000000000000000"))
        
        print(myAtoi2("0-1"))
        print(myAtoi2("42"))
        print(myAtoi2("-0"))
        print(myAtoi2("   -42"))
        print(myAtoi2("4193 with words"))
        print(myAtoi2("words and 987"))
        print(myAtoi2("-91283472332"))
        print(myAtoi2("-2147483648"))
        print(myAtoi2("-2147483647"))
        print(myAtoi2("2147483648"))
        print(myAtoi2("20000000000000000000"))
        

       
    }

}
