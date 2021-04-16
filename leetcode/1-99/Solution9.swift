//
//  Solution9.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 反转后的值相等 -- 会溢出，不可取
// 2. 取首位和尾位比较， 如何取首位（获取最大的进位）
// 3. 反转一半的数字
// 4. 转换为字符串
class Solution9 {
    
    // 取首位和尾位比较
    func isPalindrome3(_ x: Int) -> Bool {
        var x = x
        // todo
        // 首尾比较
        if x < 0 {
            return false
        }
        
        var div = 1
        while x / div >= 10 {
            div *= 10
        }
        while x > 0 {
            let left = x / div
            let right = x % 10
            if left != right {
                return false
            }
            
            x = x % div
            x = x % 10
            div /= 100
        }
        
        return true
    }
    
    // 反转一半的数
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0 ){
            return false
        }
        var origin = x
        var reverse:Int = 0
        while (origin > reverse) {
            let remain = origin % 10
            origin /= 10
            reverse = reverse * 10 + remain
        }
        return origin == reverse || origin == reverse / 10
    }
    
    // 会溢出
    func isPalindrome2(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var origin = x
        var reverse:Int = 0
        
        while(origin != 0) {
            
            let remain = origin % 10
            origin /= 10
            reverse = reverse * 10 + remain
        }
        
        return reverse == x
    }
    
    func test() {
        print(isPalindrome(121))
        print(isPalindrome(-121))
        print(isPalindrome(10))
    }
}
