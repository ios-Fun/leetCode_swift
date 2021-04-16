//
//  Solution682.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution682 {
    func calPoints(_ ops: [String]) -> Int {
        var result:[Int] = Array()
        for item in ops {
            if item == "C" {
                result.removeLast()
            }else if item == "D" {
                result.append(result.last! * 2)
            }else if item == "+" {
                let value = result[result.count - 2] + result[result.count - 1]
                result.append(value)
            }else {
                result.append(Int(item) ?? 0)
            }
        }
        return result.reduce(0, +)
    }
    
    func test() {
        print(calPoints(["5","2","C","D","+"]))
        
        print(calPoints(["5","-2","4","C","D","9","+","+"]))
        
        print(calPoints(["1"]))
    }
}
