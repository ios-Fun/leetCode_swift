//
//  Solution167.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. hash
// 2. 二分查找
// 3. 双指针(最优解)
class Solution167 {
    // 1. hash
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
//        if numbers.count < 2 {
//            return
//        }
        let res:[Int] = Array()
        var dic:[Int:Int] = Dictionary()
        for i in 0..<numbers.count {
            if dic[target - numbers[i]] == nil {
                dic[numbers[i]] = i + 1
            }else {
                return [dic[target - numbers[i]]!, i + 1]
            }
        }
        return res
    }
    
    func test() {
        print(twoSum([2, 7, 11, 15], 9))
    }
}
