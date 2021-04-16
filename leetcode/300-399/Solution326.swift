//
//  Solution326.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 
class Solution326 {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        return 1162261467 % n == 0
    }
    
    func test() {
        print(isPowerOfThree(27))
        
    }
}

//  1--1
// 11--3
// 1001--9
// 11011
// 1010001
