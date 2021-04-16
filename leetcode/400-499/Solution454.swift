//
//  Solution454.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 方法， 深度遍历？
// 全部排序之后，最后一个 hash 查找

class Solution454 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        var firstDic:[Int:Int] = Dictionary()   // A + B
        var secondDic:[Int:Int] = Dictionary()  // C + D
        for i in 0..<A.count {
            for j in 0..<A.count {
                let sum1 = A[i] + B[j]
                let sum2 = C[i] + D[j]
                
                if firstDic[sum1] == nil {
                    firstDic[sum1] = 1
                }else {
                    firstDic[sum1] = firstDic[sum1]! + 1
                }
                
                if secondDic[sum2] == nil {
                    secondDic[sum2] = 1
                }else {
                    secondDic[sum2] = secondDic[sum2]! + 1
                }
            }
        }
        var count = 0
        for (_, item) in firstDic.enumerated() {
            let target = 0 - item.key
            if secondDic[target] != nil {
                count = count + secondDic[target]! *  item.value
            }
        }
        return count
    }
    
    func test() {
        print(fourSumCount([0], [0], [0], [0]))
        print(fourSumCount([1,2], [-2, -1], [-1, 2], [0, 2]))
    }
}

// -1， 1

// -1， 1

// -2， 0

//  0， 2
