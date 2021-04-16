//
//  Solution342.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution342 {
    func isPowerOfFour(_ num: Int) -> Bool {
        
        // > 0， 只有一位1
        return num > 0 && (num & (num - 1) == 0) && num & 0xaaaaaaaa == 0
    }
    
    func test() {
        print(isPowerOfFour(16))
    }
}

// 001  1
// 100  4
// 10000 16
