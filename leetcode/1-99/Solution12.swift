//
//  Solution12.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution12 {

    //贪心算法 todo
    // 使用字典
    func intToRoman2(_ num: Int) -> String {
        // 一个数值数组
        // 一个单位数组
        
        
        return ""
    }
    
    // 使用字典做些优化
    func intToRoman(_ num: Int) -> String {
        if num == 0 {
            return ""
        }
        if num >= 1000 {
            return "M" + intToRoman(num - 1000)
        }else if num >= 900 {
            return "CM" + intToRoman(num - 900)
        }else if num >= 500 {
            return "D" + intToRoman(num - 500)
        }else if num >= 400 {
            return "CD" + intToRoman(num - 400)
        }else if num >= 100 {
            return "C" + intToRoman(num - 100)
        }else if num >= 90 {
            return "XC" + intToRoman(num - 90)
        }else if num >= 50 {
            return "L" + intToRoman(num - 50)
        }else if num >= 40 {
            return "XL" + intToRoman(num - 40)
        }else if num >= 10 {
            return "X" + intToRoman(num - 10)
        }else if num == 9 {
            return "IX"
        }else if num >= 5 {
            return "V" + intToRoman(num - 5)
        }else if num == 4 {
            return "IV"
        }else if num >= 1 {
            return "I" + intToRoman(num - 1)
        }else {
            return ""
        }
    }
    
    func test() {
        
        print(intToRoman(708))
        // DCCVIII
        print(intToRoman(60))
        // LX
        
        print(intToRoman(308))
        // CCCVIII
        
        print(intToRoman(2994))
        // MMCMXCIV
        
        print(intToRoman(35))
        // XXXV
        
        print(intToRoman(20))
        //XX
        
        print(intToRoman(510))
        // DX
        
        print(intToRoman(108))
        // CVIII
        
        print(intToRoman(3))
        // III
        
        print(intToRoman(4))
        // IV
        print(intToRoman(9))
        // IX
        print(intToRoman(58))
        // LVIII
        print(intToRoman(1994))
        // MCMXCIV
    }
}

// 字符          数值
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
