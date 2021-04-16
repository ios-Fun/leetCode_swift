//
//  Solution231.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1) == 0)
    }
    
    func test() {
        print(isPowerOfTwo(1))
        print(isPowerOfTwo(16))
        print(isPowerOfTwo(218))
    }
}
