//
//  Solution441.swift
//  leetcode
//
//  Created by xiao on 2021/8/26.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 排列硬币
// 1. 数学方法， 但是会超过Int范围
// 2. 二分查找
// k * （k + 1) = 2n
class Solution441 {
    func arrangeCoins(_ n: Int) -> Int {
        var left = 0
        var right:Int = Int(sqrt(Double(2*n)))
        while left <= right {
            let mid = (left + right) >> 1
            let num =  mid * (mid + 1)
            if num == 2 * n {
                return mid
            }else if num < 2 * n{
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
        return right
    }
    
    func test() {
        print(arrangeCoins(5))
        print(arrangeCoins(8))
        print(arrangeCoins(0))
        print(arrangeCoins(1))
    }
}

// 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
// 1 +n
