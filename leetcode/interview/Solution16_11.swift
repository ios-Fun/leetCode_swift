//
//  Solution16_11.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution16_11 {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        var result:[Int] = Array()
        guard k > 0 else {
            return []
        }
        let leftBase = shorter * k
        if shorter == longer {
            return [leftBase]
        }
        let subValue = longer - shorter
        for i in 0...k {
            result.append(leftBase + subValue*i)
        }
        return result
    }
    
    func test() {
        print(divingBoard(1, 2, 3))
    }
}
