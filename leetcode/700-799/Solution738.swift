//
//  Solution738.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/8.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution738 {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        var N = N
        var index = 0
        var preValue = 0
        var count = 0
        var values = [Int]()
        while N > 0 {
            let value = N % 10
            if value > preValue {
                preValue = value - 1
                index = count
            }else {
                preValue = value
            }
            values.append(value)
            count += 1
            N = N / 10
        }
        // values = values.reversed()
        
        
        if index > 0  {
            values[index] -= 1
            for i in 0..<index {
                values[i] = 9
            }
        }
        //print("values: \(values)")
        var result = 0
        for num in values.reversed() {
            result = result * 10 + num
        }
        return result
    }
    
    func test() {
        print(monotoneIncreasingDigits(102))
        print(monotoneIncreasingDigits(9))
        print(monotoneIncreasingDigits(0))
        print(monotoneIncreasingDigits(10))
        print(monotoneIncreasingDigits(1234))
        print(monotoneIncreasingDigits(332))
        print(monotoneIncreasingDigits(9998))
    }
}


// 2
// 0
//

// 12341 -> 12339

//  1
// 4-1 = 3
// 12339

// 332
// 2
// 3-1 = 2
// 3-1=2

// 10
// 0
// 1-1=0
//

// 331332
// 2
// 2
// 2
// 1
// 2
// 2
