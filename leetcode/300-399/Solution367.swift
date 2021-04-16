//
//  Solution367.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution367 {
    // 二分的方法
    func isPerfectSquare(_ num: Int) -> Bool {
        var right = num >> 1
        if right == 0 {
            right = 1
        }
        var left = 1
        while (left <= right) {
            if left * left > num {
                return false
            }
            if left * left == num {
                return true
            }
            let value = right * right
            if value == num {
                return true
            }else if value > num {
                // right * right > num
                if value / 4 < num {
                    if right >> 1 + 1 > left + 1 {
                        left = right >> 1 + 1
                    }else {
                        left = left + 1
                    }
                }else {
                    right = right >> 1
                }
            }else {
                // right * right < num
                return false
            }
        }
        return false
    }
    
    func test() {
        // print(isPerfectSquare(10000000002333))
//        print(isPerfectSquare(16))
//        print(isPerfectSquare(14))
////        print(isPerfectSquare(15))
        for i in 1...100 {
            // print("i:\(i)")
            print("i:\(i)",isPerfectSquare(i))
        }
    }
}
