//
//  Solution973.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 执行用时过高，可以用hash来存储计算结果值
class Solution973 {
    var points:[[Int]]!
    var K: Int!
    var heapIndex:[Int]!
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        self.points = points
        self.K = K
        heapIndex = Array.init(repeating: 0, count: K)
        for i in 0..<K {
            heapIndex[i] = i
        }
        buildHeap()
        
        for i in K..<points.count {
            if getDistance(i) < getDistance(heapIndex.first!) {
                heapIndex[0] = i
                shiftDown(0)
            }
        }
        var result:[[Int]] = Array()
        for value in heapIndex {
            result.append(points[value])
        }
        return result
    }
    
    // 建立堆
    func buildHeap() {
        for i in stride(from: K >> 1 - 1, to: -1, by: -1) {
            shiftDown(i)
        }
    }
    
    // 大顶堆
    func shiftDown(_ index : Int) {
        var curIndex = index
        while curIndex < K {
            let leftIndex = curIndex << 1 + 1
            let rightIndex = curIndex << 1 + 2
            var toIndex = curIndex
            if leftIndex < K && getDistance(heapIndex[curIndex]) < getDistance(heapIndex[leftIndex]) {
                toIndex = leftIndex
            }
            if rightIndex < K && getDistance(heapIndex[toIndex]) < getDistance(heapIndex[rightIndex]) {
                toIndex = rightIndex
            }
            if toIndex != curIndex {
                heapIndex.swapAt(toIndex, curIndex)
                curIndex = toIndex
            }else {
                break
            }
        }
    }
    
    func getDistance(_ index: Int) -> Int {
        return points[index][0] * points[index][0] + points[index][1] * points[index][1]
    }
    
    func test() {
//        print(kClosest([[1,3],[-2,2]], 1))
//        print(kClosest([[3,3],[5,-1],[-2,4]], 2))
        
        print(kClosest([[68,97],[34,-84],[60,100],[2,31],[-27,-38],[-73,-74],[-55,-39],[62,91],[62,92],[-57,-67]],
                       5))
    }
}
