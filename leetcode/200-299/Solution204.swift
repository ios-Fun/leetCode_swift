//
//  Solution204.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 用空间换时间
class Solution204 {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        
        var count = 0
        var numsList = [Int](repeating: 1, count: n)
        numsList[0] = 0
        numsList[1] = 0
        for i in (2...Int(sqrt(Double(n-1)))+1) {
            
            if numsList[i] == 0 {
                continue
            }
            
//            for j in ((i+1)..<n) {
//
//                if numsList[j] == 0 {
//                    continue
//                }
//                if j % i  == 0  && j / i != 1{
//                    numsList[j] = 0
//                }
//            }
            var j = 2 * i
            while (j < n) {
                numsList[j] = 0
                j = j + i
            }
        }
        
//        for value in numsList {
//            if value == 1 {
//                count = count + 1
//            }
//        }
        
        // count = numsList.filter{$0==1}.count
        
//        func add(accumulator: Int, current: Int) -> Int {
//            if current == 1 {
//                return accumulator + 1
//            }else {
//                return accumulator
//            }
//        }
//        count = numsList.reduce(0, add)
        count = numsList.reduce(0, {
            if $1 == 1 {
                return $0 + 1
            }else {
                return $0
            }
        })
        return count
    }
    
    func test() {
        print(countPrimes(2))
        print(countPrimes(3))
        print(countPrimes(10))
        print(countPrimes(1500000))
    }
}
