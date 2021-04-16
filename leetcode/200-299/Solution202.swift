//
//  Solution202.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution202 {
    
    // 记忆化递归
    func isHappy(_ n: Int) -> Bool {
        // var flag = false
        var list:[Int] = Array()
        
        return isHappyNum(n, list: &list)
    }
    
    func isHappyNum(_ n: Int, list: inout [Int]) -> Bool {
        
        // 判断n是不是在list里面
        for item in list {
            if item == n {
                return false
            }
        }
        list.append(n)
        
        var n = n
        var sum = 0
        
        if n == 0 {
            return false
        }
        
        while (n >= 10) {
            let temp = n % 10
            sum =  sum + temp*temp
            n = n / 10
        }
        sum = sum + n * n
        if sum == 1 {
            return true
        }else {
            return isHappyNum(sum, list: &list)
        }
    }
    
    
//    func isDivTen(_ n: Int) -> Bool {
//        if n == 1 {
//            return true
//        }else if n < 10{
//            return false
//        }else {
//
//        }
//    }
    
    //  func isHappy
    
    func test() {
        // print(isHappy(19))
        print(isHappy(2))
        print(isHappy(7))
    }
}
