//
//  Solution1046.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1046 {
    // todo 待优化
    var heapNum:[Int]!
    var count:Int!
    func lastStoneWeight(_ stones: [Int]) -> Int {
        // 先建立大顶堆
        heapNum = stones
        count = stones.count
        buildHeap()
        while count > 1 {
            //
            //let topIndex = 0
            var secondIndex:Int = 1
            if count > 2 {
                if heapNum[2] > heapNum[1] {
                    secondIndex = 2
                }
            }
            if heapNum[0] == heapNum[secondIndex] {
                heapNum[0] = 0
                heapNum[secondIndex] = 0
                if count == 3 {
                    return secondIndex == 1 ? heapNum[2] : heapNum[1]
                }
                heapNum.swapAt(0, count-1)
                heapNum.swapAt(secondIndex, count-2)
                count -= 2
            }else {
                
                let sub = heapNum[0] >= heapNum[secondIndex] ? heapNum[0] - heapNum[secondIndex] : heapNum[secondIndex] - heapNum[0]
                if heapNum[0] >= heapNum[secondIndex] {
                    heapNum[0] = sub
                    heapNum[secondIndex] = 0
                    heapNum.swapAt(secondIndex, count-1)
                }else {
                    heapNum[0] = 0
                    heapNum[secondIndex] = sub
                    heapNum.swapAt(0, count-1)
                }
                count -= 1
            }
            
            shiftDown(secondIndex)
            shiftDown(0)
        }
        return heapNum.first!
    }
    
    // 先建立堆 -- 大顶堆
    func buildHeap() {
        for i in stride(from: count >> 1 - 1, to: -1, by: -1) {
            shiftDown(i)
        }
    }
    
    func shiftDown(_ index: Int) {
        var curIndex = index
        while (curIndex < count) {
            let leftIndex = curIndex << 1 + 1
            let rightIndex = curIndex << 1 + 2
            var toIndex = curIndex
            if leftIndex < count && heapNum[curIndex] < heapNum[leftIndex] {
                toIndex = leftIndex
            }
            if rightIndex < count && heapNum[toIndex] < heapNum[rightIndex] {
                toIndex = rightIndex
            }
            if toIndex != curIndex {
                heapNum.swapAt(toIndex, curIndex)
                curIndex = toIndex
            }else {
                break
            }
        }
    }
    
    func test() {
        print(lastStoneWeight([6,2,2,7]))
        print(lastStoneWeight([2,7,4,1,7,1]))
        print(lastStoneWeight([2,7,4,1,8,1]))

        print(lastStoneWeight([1,3]))

        print(lastStoneWeight([1]))
    }
}
