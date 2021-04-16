//
//  Solution378.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution378 {
    // 1. 二分查找 -- 最优
    // 2. 归并排序
    // 3. 堆
    
    // 1. 二分查找
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        // todo
        return 0
    }
    
//    func findIndex(_ matrix: [[Int]], _ k: Int, _ fromIndex: Int, _ toIndex: Int) -> {
//
//    }
    
    var heap:[Int]!
    // 堆
    func kthSmallest3(_ matrix: [[Int]], _ k: Int) -> Int {
        // 方法2
        // a. 先采用 k 个 元素 建立 大顶堆
        // b. 取元素 i 与 堆顶 比较，如果 比堆顶大返回， 比堆顶小，则替换堆顶并下滤
        // c. 遍历完二维数组后，取堆顶元素即是第K小元素
        // 时间复杂度 O(logK * n), 空间负载度O(logK * K)
        
        // a
        heap = Array.init(repeating: 0, count: k)
        
        let m = matrix.count
        let n = matrix[0].count
        var index:Int = 0
        for i in 0..<m {
            for j in 0..<n {
                if index < k - 1 {
                    heap[index] = matrix[i][j]
                }else if index == k - 1 {
                    // build heap
                    heap[index] = matrix[i][j]
                    buildHeap()
                }else {
                    if matrix[i][j] < heap.first! {
                        heap[0] = matrix[i][j]
                        // shift down
                        shiftDown(0)
                    }
                }
                
                index += 1
            }
        }
        
        return heap.first!
    }
    
    // 建立堆
    func buildHeap() {
        for i in stride(from: (heap.count >> 1 - 1), to: -1, by: -1) {
            print("i:\(i)")
            shiftDown(i)
        }
    }
    
    func shiftDown(_ index: Int) {
        let count = heap.count
        var curIndex = index
        while curIndex < count {
            let leftIndex = curIndex * 2 + 1
            let rightIndex = curIndex * 2 + 2
            var maxIndex = curIndex
            if leftIndex < count && heap[curIndex] < heap[leftIndex] {
                //
                // heap.swapAt(curIndex, leftIndex)
                maxIndex = leftIndex
                
            }
            if rightIndex < count && heap[maxIndex] < heap[rightIndex] {
                maxIndex = rightIndex
            }
            if maxIndex != curIndex{
                heap.swapAt(curIndex, maxIndex)
                curIndex = maxIndex
            }else {
                break
            }
        }
    }
    
    func test() {
//        print(kthSmallest([
//           [ 1,  5,  9],
//           [10, 11, 13],
//           [12, 13, 15]
//        ], 8))
        
        print(kthSmallest3([
           [ 1,  2],
           [3, 3]
        ], 3))
        
//        print(kthSmallest([
//           [ 1,  2],
//           [1, 3]
//        ], 2))
        
//        print(kthSmallest([
//           [ 1,  2],
//           [1, 3]
//        ], 1))
        
//        print(kthSmallest3([
//           [ 1,  2],
//           [1, 3]
//        ], 1))
    }
}
