//
//  Solution_o_64.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_64 {
    var result = 0
    func sumNums(_ n: Int) -> Int {
        
        result += n
        n > 0 && sumNums(n - 1) > 0
        return result
    }
    
    func test() {
        print(sumNums(3))
        print(sumNums(9))
    }
}
