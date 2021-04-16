//
//  Solution263.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution263 {
    func isUgly(_ num: Int) -> Bool {
        
        if num <= 0 {
            return false
        }
        if num == 1 {
            return true
        }
        return ugly(num)
        // return false
    }
    
    func ugly(_ num: Int) -> Bool {
        if num == 5 || num == 3 || num == 2 {
            return true
        }
        if num % 5 == 0 {
            return ugly(num / 5)
        }
        if num % 3 == 0 {
            return ugly(num / 3)
        }
        if num % 2 == 0 {
            return ugly(num / 2)
        }
        return false
    }
    
    func test() {
        print(isUgly(6))
        print(isUgly(8))
        print(isUgly(14))
    }
}
