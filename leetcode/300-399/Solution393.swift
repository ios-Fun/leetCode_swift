//
//  Solution393.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution393 {
    // 位运算
    func validUtf8_2(_ data: [Int]) -> Bool {
        // todo
        return false
    }
    
    func validUtf8(_ data: [Int]) -> Bool {
        if data.count == 0 {
            return false
        }
        var index = 0
        while index < data.count {
            let item = data[index]
            var validCount = 0
            if item <= 0x7f {
                index = index + 1
                continue
            }else if item >= 0xc0 && item <= 0xdf {
                validCount = 1
            }else if item >= 0xe0 && item <= 0xef {
                validCount = 2
            }else if item >= 0xf0 && item <= 0xf7 {
                validCount = 3
            }else {
                return false
            }
            if validCount > 0 {
                if (index + validCount) < data.count {
                    for i in 1...validCount {
                        if data[index + i] >= 0x80 && data[index + i] <= 0xbf {
                            continue
                        }else {
                            return false
                        }
                    }
                    index = index + validCount + 1
                }else {
                    return false
                }
            }
        }
        return true
    }
    
    func test() {
        print(validUtf8([115,100,102,231,154,132,13,10]))
        print(validUtf8([255]))
        print(validUtf8([197, 130, 1]))
        print(validUtf8([235, 140, 4]))
    }
}

// 111 1111   7F
// 111 1111 1111 7FF

// 01110011
// 01100100  100
// 01100110  102
// 11100111
// 10011010  154
// 10000100  132
// 13
// 10
