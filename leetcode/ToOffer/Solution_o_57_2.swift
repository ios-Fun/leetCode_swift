//
//  Solution_o_57_2.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_57_2 {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        var result:[[Int]] = Array()
        var left = 1
        var right = 2
        var sum = 3
        if target < 3 {
            return []
        }
        while left < right && right <= (target >> 1 + 1) {
            if target == sum {
                var list:[Int] = Array()
                for i in left...right {
                    list.append(i)
                }
                result.append(list)
                
                right += 1
                sum += right
                continue
            }
            
            if sum > target {
                // left + 1
                sum -= left
                left += 1
                continue
            }
            if sum < target {
                // right + 1
                right += 1
                sum += right
                continue
            }
        }
        
        return result
    }
    
    func test() {
        print(findContinuousSequence(9))
        
        //print(findContinuousSequence(15))
    }
}
