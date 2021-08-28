//
//  Solution551.swift
//  leetcode
//
//  Created by xiao on 2021/8/28.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution551 {
    func checkRecord(_ s: String) -> Bool {
        let chars = Array(s)
        var aCount = 0
        var lCount = 0
        for char in chars {
            if char == "A" {
                lCount = 0
                aCount += 1
                if aCount > 1 {
                    return false
                }
            }else if char == "L" {
                lCount += 1
                if lCount >= 3 {
                    return false
                }
            }else {
                lCount = 0
            }
        }
        return true
    }
    
    func test() {
        print(checkRecord("PPALLP"))
        
        print(checkRecord("PPALLL"))
    }
}
