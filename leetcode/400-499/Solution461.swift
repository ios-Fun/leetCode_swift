//
//  Solution461.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution461 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        let a = x ^ y
        var mask = 1
        var count = 0
        for _ in (0..<31) {
            if a & mask != 0 {
                count = count + 1
            }
            mask = mask << 1
        }
        return count
    }
    
    func test() {
        print(hammingDistance(1, 4))
    }
}


