//
//  Solution670.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/19.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// todo 倒过来找最大的数
class Solution670 {
    func maximumSwap(_ num: Int) -> Int {
        var numList = Array(String(num))
        var numSortCount:[Character: Int] = [:]
        // = Set(numList).sorted()
        for numItem in numList {
            if numSortCount[numItem] == nil {
                numSortCount[numItem] = 1
            } else {
                numSortCount[numItem] = numSortCount[numItem]! + 1
            }
        }
        let numSort = numSortCount.keys.sorted(by: {$0 > $1})
        var numSortIndex = 0
        
        var toSwapNum = numList[0]
        var toSwapCount = 0
        var toSwapIndex = 0
        var curIndex = 0
        for (index, numItem) in numList.enumerated() {
            if numItem == numSort[numSortIndex] {
                toSwapCount += 1
                if index < numList.count - 1 && numList[index] != numList[index+1] {
                    if toSwapCount == numSortCount[numItem] {
                        numSortIndex += 1
                        toSwapCount = 0
                    }
                }
                continue
            } else {
                toSwapNum = numSort[numSortIndex]
                curIndex = index
                break
            }
        }
        
        for (index,numItem) in numList.enumerated().reversed() {
            if numItem == toSwapNum {
                toSwapIndex = index
                break
            }
        }
        
        numList.swapAt(curIndex, toSwapIndex)
        let result = numList.map{String.init($0)}.reduce("", +)
        return Int(result) ?? 0
    }
    
    func test() {
         print(maximumSwap(2736))

        print(maximumSwap(9973))

        print(maximumSwap(98368))
        // 98863
    }
}


// 27367
// 72367
// 77362

// 217367
// 712367
// 717362

// 247367
// 742367
// 747362

