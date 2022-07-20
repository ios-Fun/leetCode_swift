//
//  Solution1405.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/8.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1405 {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var a = a
        var b = b
        var c = c
        var preIndex = -1
        
        var resultStr: String = ""
        while(true) {
            let returnValue = getIndex(a, b, c, preIndex)
            let index = returnValue.index
            let isTwo = returnValue.isTwo
            if index == -1 {
                break
            } else {
                preIndex = index
                if index == 1 {
                    // a
                    resultStr.append(isTwo ? "aa" :  "a")
                    a = isTwo ? a - 2: a - 1
                } else if index == 2 {
                    resultStr.append(isTwo ? "bb" :  "b")
                    b = isTwo ? b-2: b - 1
                } else {
                    resultStr.append(isTwo ? "cc" :  "c")
                    c = isTwo ? c-2: c - 1
                }
            }
        }
        return resultStr
    }
    
    func getIndex(_ a: Int, _ b: Int, _ c: Int, _ preIndex: Int) -> ( index:Int, isTwo: Bool) {
        var index = -1
        var maxValue = -1
        var isTwo = true
        if 1 != preIndex && a > 0 {
            index = 1
            maxValue = a
        }
        if 2 != preIndex && b > 0 {
            if b > maxValue  {
                index = 2
                maxValue = b
            }
        }
        if 3 != preIndex  && c > 0 {
            if c > maxValue  {
                index = 3
                maxValue = c
            }
        }
        if index != -1 && preIndex != -1 {
            var preValue = 0
            if preIndex == 1 {
                preValue = a
            } else if preIndex == 2 {
                preValue  = b
            } else  {
                preValue = c
            }
            var curValue  = 0
            if  index == 1 {
                curValue = a
            }else if index == 2 {
                curValue  = b
            } else  {
                curValue = c
            }
            if curValue < preValue  {
                isTwo = false
            }
            if curValue < 2 {
                isTwo = false
            }
        }
        return (index, isTwo)
    }
    
    func test() {
        print(longestDiverseString(0, 8, 11))
         print(longestDiverseString(1, 1, 7))
        print(longestDiverseString(2, 2, 1))
        print(longestDiverseString(7, 1, 0))
    }
}

//  8 ,9
//  7, 9
//  7, 7

