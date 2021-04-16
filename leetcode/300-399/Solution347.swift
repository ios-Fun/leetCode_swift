//
//  Solution347.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 小顶堆 + 哈希
// todo 优化
class Solution347 {
    // 二叉堆，存放个数和数值
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count <= k {
            return nums
        }
        
        // var numList:[[Int]] = Array()
        var numList:[[Int]] = Array.init(repeating: [0,0], count: k)
        var dic:[Int:Int] = Dictionary()
        
        for i in (0..<nums.count) {
            var count = 1
            if dic[nums[i]] != nil {
                count = dic[nums[i]]! + 1
            }
            dic[nums[i]] = count
        }
        
        
        
        for (_,item) in dic.enumerated() {

            if item.value > numList[0][1] {
                // 加入小顶堆
                numList[0][0] = item.key
                numList[0][1] = item.value
                modifyHeap(&numList)
            }
            
        }
        var topKList:[Int] = Array()
        for i in (0..<numList.count) {
            if numList[i][1] != 0 {
                topKList.append(numList[i][0])
            }
        }
        
        return topKList
    }
    
    // 调整小顶堆
    func modifyHeap(_ numList: inout [[Int]]) {
        var k: Int = 1
        let count = numList.count
        var tempIndex = 0
        while k < count {
            if k+1 < count && numList[k][1] > numList[k+1][1] {
                k = k + 1
            }
            if numList[k][1] >= numList[tempIndex][1] {
                break
            }else {
                // tempIndex = k
                // 子节点比父节点的小
                
                let temp = numList[tempIndex]
                numList[tempIndex] = numList[k]
                numList[k] = temp
                
                tempIndex = k
            }
            k = 2 * k + 1
        }
    }
    
    func test() {
        for i in 0..<10 {
            print(topKFrequent([6,0,1,4,9,7,-3,1,-4,-8,4,-7,-3,3,2,-3,9,5,-4,0], 6))
            
            // 1
            // 7
        }
        
        
        print(topKFrequent([1,1,1,2,2,3], 2))
        print(topKFrequent([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 10))

        print(topKFrequent([1,1,1,2,2,3], 2))

        print(topKFrequent([1], 1))
    }
}

// 1, 1, 1, 2, 2, 3

// 1-3

// 2-2, 1-3

//   1
// 3    2
//1  1 1
