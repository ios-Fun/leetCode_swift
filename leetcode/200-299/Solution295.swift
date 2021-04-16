//
//  Solution295.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 1. 两个堆 -- 底层是数组，需要连续内存，不适合大量的数据
// 2. 红黑树 -- 代码比较麻烦，性能最优，适合大量数据
// 3. 跳表 -- 维护一个有序的链表， 查找是二分查找，空间占用比红黑树多，适合大量数据
class MedianFinder {
    enum TYPE:Int {
        case small = 0
        case big
    }
    // Pr
    var smallHeap:[Int] = Array()   // 数组小的大顶堆（一半数据）
    var bigHeap:[Int] = Array()     // 数组大的小顶堆 (另外一半数据)
    /** initialize your data structure here. */
    init() {
        smallHeap = Array()
        bigHeap = Array()
    }
    
    func addNum(_ num: Int) {
        if let bigTop = smallHeap.first, num > bigTop {
            // 加入到 数组大的堆
            addNum(.big, num)
        }else {
            // 加入到 数据小的堆
            addNum(.small, num)
        }
        
        // 两者个数调整
        if bigHeap.count > smallHeap.count + 1, let bigTop = removeTop(.big) {
            addNum(.small, bigTop)
        }else if smallHeap.count > bigHeap.count + 1, let smallTop = removeTop(.small) {
            addNum(.big, smallTop)
        }
    }
    
    // 删除堆顶元素，并返回
    func removeTop(_ type: TYPE) -> Int? {
        var top:Int?
        
        if type == .big {
            top = bigHeap.first!
            // swap
            bigHeap.swapAt(0, bigHeap.count-1)
            bigHeap.removeLast()
            bigHeapShiftDown(0)
        }else {
            top = smallHeap.first!
            smallHeap.swapAt(0, smallHeap.count-1)
            smallHeap.removeLast()
            smallHeapShiftDown(0)
        }
        return top
    }
    
    // 添加元素
    func addNum(_ type: TYPE, _ num :Int) {
        
        if type  == .big {
            bigHeap.append(num)
            bigHeapShiftUp(bigHeap.count-1)
        }else {
            smallHeap.append(num)
            smallHeapShiftUp(smallHeap.count-1)
        }
    }
    
    // bigHeap 下滤
    func bigHeapShiftDown( _ index: Int) {
        let count = bigHeap.count
        var index = index
        while index < count {
            let left = index.leftChild
            let right = index.rightChild
            var toIndex = index
            if left < count && bigHeap[index] > bigHeap[left] {
                toIndex = left
            }
            if right < count && bigHeap[toIndex] > bigHeap[right] {
                toIndex = right
            }
            if toIndex != index {
                // swap
                bigHeap.swapAt(toIndex, index)
                index = toIndex
                
            }else {
                break
            }
        }
    }
    
    // bigHeap 上滤
    func bigHeapShiftUp(_ index: Int) {
        var index = index
        while index != 0 {
            let parent = index.parent
            if bigHeap[parent] > bigHeap[index] {
                // swap
                bigHeap.swapAt(parent, index)
                index = parent
            }else {
                break
            }
        }
    }
    
    
    // smallHeap 上滤
    func smallHeapShiftUp(_ index: Int) {
        var index = index
        while index != 0 {
            let parent = index.parent
            if smallHeap[parent] < smallHeap[index] {
                // swap
                smallHeap.swapAt(parent, index)
                index = parent
            }else {
                break
            }
        }
    }
    // smallHeap 下滤
    func smallHeapShiftDown(_ index: Int) {
        let count = smallHeap.count
        var index = index
        while index < count {
            let left = index.leftChild
            let right = index.rightChild
            var toIndex = index
            if left < count && smallHeap[index] < smallHeap[left] {
                toIndex = left
            }
            if right < count && smallHeap[toIndex] < smallHeap[right] {
                toIndex = right
            }
            if toIndex != index {
                // swap
                smallHeap.swapAt(toIndex, index)
                index = toIndex
            }else {
                break
            }
        }
    }
    
    func findMedian() -> Double {
        if bigHeap.count >= smallHeap.count + 1 {
            return Double(bigHeap.first!)
        }else if smallHeap.count >= bigHeap.count + 1 {
            return Double(smallHeap.first!)
        }else {
            if smallHeap.count == 0 {
                return 0.0
            }else {
                return Double(bigHeap.first! + smallHeap.first!) / 2.0
            }
        }
    }
}

extension Int {
    var leftChild: Int {
        return self << 1 + 1
    }
    
    var rightChild :Int {
        return self << 1 + 2
    }
    
    var parent: Int {
        return (self - 1) >> 1
    }
}

class Solution295 {
    func test() {
        let finder = MedianFinder()
        print(finder.findMedian())
        finder.addNum(40)
        print(finder.findMedian())
        finder.addNum(12)
        print(finder.findMedian())
        finder.addNum(16)
        print(finder.findMedian())
        finder.addNum(14)
        print(finder.findMedian())
        
//        print(finder.findMedian())
//        finder.addNum(1)
//        print(finder.findMedian())
//        finder.addNum(2)
//        print(finder.findMedian())
//        finder.addNum(3)
//        print(finder.findMedian())
//        finder.addNum(4)
//        print(finder.findMedian())
//        finder.addNum(5)
//        print(finder.findMedian())
//        finder.addNum(6)
//        print(finder.findMedian())
//        finder.addNum(7)
//        print(finder.findMedian())
//        finder.addNum(8)
//        print(finder.findMedian())
//        finder.addNum(9)
//        print(finder.findMedian())
//        finder.addNum(10)
//        print(finder.findMedian())
    }
}

// 两个堆
// a: 1
// b: 1

// a: 1
// b: 2 , 丢弃 1

// 3
// a: 2, 1
// b: 2, 3

// 1
// a: 1, 1
// b: 2, 3

// 4
// a: 2, 1
// b: 3, 4

