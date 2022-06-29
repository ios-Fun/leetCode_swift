//
//  Solution412.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution412 {
    func fizzBuzz(_ n: Int) -> [String] {
        var result:[String] = Array.init(repeating: "", count: n)
        for i in 1...n {
            // result[i-1] = "\(i)"
            if i % 15 == 0 {
                result[i-1] = "FizzBuzz"
            } else if i % 3 == 0 {
                result[i-1] = "Fizz"
            } else if i % 5 == 0 {
                result[i-1] = "Buzz"
            } else {
                result[i-1] = "\(i)"
            }
        }
        return result
    }
    
    func test() {
        print(fizzBuzz(1))
        print(fizzBuzz(3))
        print(fizzBuzz(5))
        print(fizzBuzz(15))
    }
}
