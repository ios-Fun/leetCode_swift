//
//  Solution66.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 内存消耗过高
class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitsNew = digits
        
        var isUp = false
        for (index, num) in digits.enumerated().reversed() {
            var numNew = num
            if index == digits.count - 1 {
                numNew = numNew + 1
            }
            if isUp {
                numNew = numNew + 1
            }
            if numNew == 10 {
                isUp = true
                digitsNew[index] = 0
            }else {
                isUp = false
                digitsNew[index] = numNew
                break
            }
        }
        if isUp {
            digitsNew.insert(1, at: 0)
        }
        return digitsNew
    }
    
    func test() {
        print(plusOne([4,3,2,1]))
        print(plusOne([9,9,9,9]))
    }
}
