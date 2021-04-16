//
//  Solution239.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution239 {
    // 最大队列
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // var heap =
        
        return []
    }
    
    func test() {
        print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
    }
}

// 1,3,-1,-3,5,3,6,7
// 1
// 1，3
// -1, 1, 3 ->3
// -3, -1，3 ->3
//

// 1 ： 1
// 3: 3
// -1: 3
// -3: 3
