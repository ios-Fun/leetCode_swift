//
//  Solution69.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// x的平方根
// 1.
class Solution69 {
    // 
//    func mySqrt(_ x: Int) -> Int {
//        var r:Double = Double(x)
//        while Int(r * r) > x {
//            r = (r + Double(x)/r)/2
//        }
//        return Int(r)
//    }
    
    // 二分  / 2, 感觉次数过多
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x / 2 + 1
        
        while (left < right) {
            
            let mid = (left + right + 1) >> 1
            let square = mid * mid
            if square > x {
                right = mid - 1
            }else {
                left = mid
            }
        }
        return left
    }
    
    func test() {
        print(mySqrt(100))
    }
}
