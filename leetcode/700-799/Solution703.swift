//
//  Solution703.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class KthLargest {
    
    var heapNums:[Int]!
    var k:Int!
    init(_ k: Int, _ nums: [Int]) {
        heapNums = Array()
        self.k = k
        for i in 0..<nums.count {
            //
            if i < k {
                heapNums.append(nums[i])
                if i == k - 1 {
                    buildHeap()
                }
            }else {
                if nums[i] > heapNums.first! {
                    heapNums[0] = nums[i]
                    shiftDown(0)
                }
            }
        }
    }
    
    
    func add(_ val: Int) -> Int {
        if heapNums.count < k {
            heapNums.append(val)
            if heapNums.count == k {
                buildHeap()
                return heapNums.first!
            }
        }
        
        if val > heapNums.first! {
            heapNums[0] = val
            shiftDown(0)
        }
        return heapNums.first!
    }
    
    // 建立堆 -- 第 K 大 -- 小顶推
    func buildHeap() {
        for i in stride(from: heapNums.count >> 1 - 1 , to: -1, by: -1) {
            shiftDown(i)
        }
    }
    
    // 下滤
    func shiftDown(_ index: Int) {
        var curIndex = index
        
        while curIndex < heapNums.count {
            let leftIndex = curIndex << 1 + 1
            let rightIndex = curIndex << 1 + 2
            
            var toIndex = curIndex
            if leftIndex < heapNums.count && heapNums[curIndex] > heapNums[leftIndex] {
                toIndex = leftIndex
            }
            if rightIndex < heapNums.count && heapNums[toIndex] > heapNums[rightIndex] {
                toIndex = rightIndex
            }
            if toIndex != curIndex {
                heapNums.swapAt(toIndex, curIndex)
                curIndex = toIndex
            }else {
                break
            }
        }
    }
}

class Solution703 {
    func test() {
//        let kthLargest = KthLargest.init(2, [0])
//        print(kthLargest.add(-3))
//        print(kthLargest.add(-2))
//        print(kthLargest.add(-4))
//        print(kthLargest.add(0))
//        print(kthLargest.add(4))
        
        let kthLargest = KthLargest.init(2, [0])
        print(kthLargest.add(-1))
        print(kthLargest.add(1))
        print(kthLargest.add(-2))
        print(kthLargest.add(-4))
        print(kthLargest.add(3))
    }
}
