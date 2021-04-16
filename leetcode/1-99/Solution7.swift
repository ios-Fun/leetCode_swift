//
//  Solution7.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//  如果传参就是Int32呢？
class Solution7 {
    
    // 参数就是Int32
    func reverse2(_ x: Int32) -> Int32 {
        var origin = x
        var isPlus = true
        if x < 0 {
            isPlus = false
        }
        var reverse:Int32 = 0
        
        while(origin != 0) {
            
            let remain = origin % 10
            origin /= 10
            
            if isPlus {
                if reverse > Int32.max / 10  || (reverse == Int32.max / 10 && remain > Int32.max % 10){
                    return 0
                }
            }else {
                if reverse < Int32.max / 10  || (reverse == Int32.min / 10 && remain < Int32.min % 10){
                    return 0
                }
            }
            reverse = reverse * 10 + remain
        }
        return reverse
        
    }
    
    // Int32
    func reverse(_ x: Int) -> Int {
//        let max = 0x7fffffff
//        let min = 0x80000000
        var origin = x
        var reverse:Int = 0
        
        while(origin != 0) {
            
            let remain = origin % 10
            origin /= 10
            reverse = reverse * 10 + remain
        }
        if reverse > Int32.max {
            return 0
        }
        if reverse < Int32.min {
            return 0
        }
        return reverse
    }
    
    func test() {
        print(reverse(123))
        print(reverse(-123))
        print(reverse(120))
        
        print(reverse(1534236469))
        print(reverse2(1534236469))

    }
}
