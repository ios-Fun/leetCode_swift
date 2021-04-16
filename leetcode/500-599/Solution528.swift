//
//  Solution528.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution528 {

    var count:Int!
    var valueList:[Int]!
    var total:Int = 0
    init(_ w: [Int]) {
        valueList = Array.init(repeating: 0, count: w.count)
        count = w.count
        for index in 0..<w.count {
            total += w[index]
            valueList[index] = total
        }
    }
    
    func pickIndex() -> Int {
        let randomIndex = Int.random(in: 0..<total)
        var left = 0
        var right = valueList.count - 1
        while left != right {
            let mid = (left + right) >> 1
            if randomIndex >= valueList[mid] {
                left = mid + 1
            }else {
                right = mid
            }
        }
        // let base = left == 0 ? 0 : valueList[left -1]
        return left
    }
}

class Solution528Test {
    func test() {
//        let solution1 = Solution528([1])
//        for _ in 0...100 {
//            print(solution1.pickIndex())
//        }
        
        let solution2 = Solution528([1,3])
        var count = 0
        for _ in 0...100 {
            let value = solution2.pickIndex()
            print(value)
            if value == 1 {
                count += 1
            }
        }
        print(count)
    }
}
