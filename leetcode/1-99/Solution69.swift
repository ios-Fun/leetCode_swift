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
        var right = x
        var ans = -1
        while (left <= right) {
            
            let mid = (left + right) >> 1
            let square = mid * mid
            if square <= x {
                ans = mid
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
        return ans
    }
    
    // 精确到小数点后 n 位
    func mySqrt2(_ x: Int, _ n: Int) -> Double {
        let doubleX:Double = Double(x)
        var value:Double = 0
        var basic:Double = 10
        for _ in 0...n {
            basic *= 0.1
            var tempValue = value
            var left:Int = 0
            var right:Int = 9
            var mid = 0
            var ans = -1
            while (left <= right) {
                mid = (left + right) >> 1
                if (value + basic * Double(mid)) * (value + basic * Double(mid)) <= doubleX {
                    ans = mid
                    left = mid + 1
                }else {
                    right = mid - 1
                }
            }
            tempValue = tempValue + basic * Double(ans)
            value = tempValue
        }
        
        return value
    }
    
    
    func test() {
        
        print(mySqrt2(8, 4))
        
        print(mySqrt(100))
    }
}
