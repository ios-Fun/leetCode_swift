//
//  Solution692.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 先用字典
class Solution692 {
    
    var heapIndexs:[(value:String, count:Int)]!
    var k:Int!
    // var words:[String]!
    
    // 采用堆
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        self.k = k
        var wordsDic:[String: Int] = Dictionary()
        for item in words {
            if wordsDic[item] == nil {
                wordsDic[item] = 1
            }else {
                wordsDic[item] = wordsDic[item]! + 1
            }
        }
        
        heapIndexs = Array()
        var count = 0
        for (_, item) in wordsDic.enumerated() {
            if count < k {
                heapIndexs!.append((value: item.key, count: item.value))
                if count == k - 1 {
                    buildHeap()
                }
            }else {
                if item.value > heapIndexs.first!.count {
                    heapIndexs[0] = (value: item.key, count: item.value)
                    shiftDown(0)
                }
            }
            count += 1
        }
        heapIndexs = heapIndexs.sorted { (arg0, arg1) -> Bool in
            if arg0.count == arg1.count {
                return arg0.value < arg1.value
            }else {
                return arg0.count > arg1.count
            }
        }
        return heapIndexs.map{$0.value}
    }
    
    // 构建小顶堆
    func buildHeap() {
        for i in stride(from: k >> 1 - 1, to: -1, by: -1) {
            shiftDown(i)
        }
    }
    
    // 下滤
    func shiftDown(_ index: Int) {
        var curIndex = index
        while curIndex < k {
            let leftIndex = curIndex << 1 + 1
            let rightIndex = curIndex << 1 + 2
            var toIndex = curIndex
            if leftIndex < k && heapIndexs[toIndex].count > heapIndexs[leftIndex].count {
                toIndex = leftIndex
            }
            if rightIndex < k && heapIndexs[toIndex].count > heapIndexs[rightIndex].count {
                toIndex = rightIndex
            }
            if toIndex != curIndex {
                heapIndexs.swapAt(toIndex, curIndex)
                curIndex = toIndex
            }else {
                break
            }
        }
    }
    
    // 采用字典
    func topKFrequent2(_ words: [String], _ k: Int) -> [String] {
        
        var wordsDic:[String: Int] = Dictionary()
        for item in words {
            if wordsDic[item] == nil {
                wordsDic[item] = 1
            }else {
                wordsDic[item] = wordsDic[item]! + 1
            }
        }
        let list = wordsDic.sorted { (arg0, arg1) -> Bool in
            if arg0.value == arg1.value {
                return arg0.key < arg1.key
            }else {
                return arg0.value > arg1.value
            }
        }
        var result:[String] = Array()
        var count = 0
        
        for (_,item) in list.enumerated() {
            count += 1
            if count <= k {
                result.append(item.key)
            }
        }
        return result
    }
    
    func test() {
        print(topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 2))//
        
        print(topKFrequent(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4))
    }
}
