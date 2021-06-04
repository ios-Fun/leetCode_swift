//
//  Solution1353.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/5/25.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1353 {
    
    func parentIndex(ofIndex i:Int) -> Int {
        return (i-1) >> 1
    }
    
    // 尾元素 上滤
    func shiftUp(_ events: inout [Int]) {
        var childIndex = events.count - 1
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        while parentIndex > 0 && events[parentIndex] > events[childIndex]{
            events.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
    }
    
    func shiftDown(_ heap: inout [Int]) {
        // 堆顶下滤
        var index = 0
        while index < heap.count {
            let leftIndex = index << 1 + 1
            let rightIndex = index << 1 + 2
            var toIndex = index
            if leftIndex < heap.count {
                if heap[leftIndex] < heap[toIndex] {
                    toIndex = leftIndex
                }
            }
            if rightIndex < heap.count {
                if heap[rightIndex] < heap[toIndex] {
                    toIndex = rightIndex
                }
            }
            if toIndex != index {
                heap.swapAt(index, toIndex)
                index = toIndex
            }else {
                break
            }
        }
    }
    
    func maxEvents(_ events: [[Int]]) -> Int {
        // 先排序
        let sortEvents = events.sorted { a, b in
            if a[0] != b[0] {
                return a[0] < b[0]
            }else {
                return a[1] < b[1]
            }
        }
        // 小顶堆
        var heap:[Int] = []
        
        let n = sortEvents.count
        
        var res = 0
        var index = 0
        
        var day = sortEvents[0][0]
        
        while  (index < n || !heap.isEmpty) {
            if heap.isEmpty {
                heap.append(sortEvents[index][1])
                index += 1
                continue
            }
            while index < n {
                // 如果开始日期 <= day
                if sortEvents[index][0] <= day {
                    // 结束日期加入堆
                    heap.append(sortEvents[index][1])
                    // 上滤
                    shiftUp(&heap)
                    
                    index += 1
                }else {
                    break
                }
            }
            
            if heap.first! >= day {
                day += 1
                res += 1
            }
            
            heap[0] = heap.last!
            heap.removeLast()
            // 下滤
            shiftDown(&heap)
            
        }
        return res
    }
    
    func test() {
        print(maxEvents([[1,2],[1,2],[3,3],[1,5],[1,5]]))
//        print(maxEvents([[1,2],[2,3],[3,4]]))
//        print(maxEvents([[1,2],[2,3],[3,4],[1,2]]))
//        print(maxEvents([[1,4],[4,4],[2,2],[3,4],[1,1]]))
//
//        print(maxEvents([[1,100000]]))
//
//        print(maxEvents([[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]]))
    }
}
