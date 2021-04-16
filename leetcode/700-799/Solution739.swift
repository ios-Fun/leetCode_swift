//
//  Solution739.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 遍历
// 2. 栈
class Solution739 {
    
    // 单调栈
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        
        var stackNums:[Int] = Array()
        var resultNums:[Int] = Array.init(repeating: 0, count: T.count)
        for i in 0..<T.count {
            // print("i:", i)
            if stackNums.count == 0 {
                stackNums.append(i)
            }else {
                // for j in (0..<resultArray.count).reversed() {
                while stackNums.count > 0 {
                    let last = stackNums.last!
                    // last 就是栈顶元素
                    if T[i] <= T[last] {
                        //
                        break
                    }else {
                        // 挨个比较
                        if T[i] > T[last] {
                            // resultNums.append(i - last)
                            resultNums[last] = i - last
                            stackNums.removeLast()
                        }
                    }
                }
                stackNums.append(i)
            }
            // print("stackNums:", stackNums)
        }
        
        return resultNums
    }
    
    func test() {
        print(dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))
        print(dailyTemperatures([]))
        print(dailyTemperatures([1]))
        print(dailyTemperatures([1, 1]))
    }
}

// [73, 74, 75, 71, 69, 72, 76, 73]

// 1， 1， 4， 2， 1， 1， 0，0


// 73, 1

// 74, 2

// 75, 2

// 71-4

// 69-5

// 72 -6  -> 输出71， 69

// 76-7  -> 输出 75， 72

// 73



// 数组

// 73

// 74

// 75

// 71, 75

// 69, 71, 75

// 72， 75

// 76

// 73， 76

