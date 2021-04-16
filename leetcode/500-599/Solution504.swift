//
//  Solution504.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution504 {
    func convertToBase7(_ num: Int) -> String {
        var num = num
        let isPlus = num >= 0
        if !isPlus {
            num = -num
        }
        var result:String = ""
        repeat {
            result.append(String(num % 7))
            num /= 7
        }while num > 0
        if !isPlus {
            result.append("-")
        }
        result = String(result.reversed())
        return result
    }
    
    func test() {
        print(convertToBase7(1))
        print(convertToBase7(-0))
        print(convertToBase7(0))
        print(convertToBase7(100))
        print(convertToBase7(-7))
    }
}
