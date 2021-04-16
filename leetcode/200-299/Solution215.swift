//
//  Solution215.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 堆排序
// 1. 建立小顶堆，然后获取堆顶元素
class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

        // 先获取前K个数字
        var headNums:[Int] = Array.init(repeating: Int.min, count: k)
        
        // 建立K个数的小顶堆 -- 堆顶是这K个数的最小值，其他的都比堆顶大
        for i in (0..<nums.count) {
            if nums[i] > headNums[0] {
                headNums[0] = nums[i]
                adjustHeap(arr: &headNums)
            }
        }
        
        return headNums[0]
    }
    
    // 调整小顶堆
    func adjustHeap(arr: inout [Int]) {
        var i = 0
        let temp = arr[i]
        var k = 2 * i + 1
        let length = arr.count
        while k < length {
            // 从i节点的左子树（2i+1）开始
            if k + 1 < length && arr[k] > arr[k+1] {
                // 如果 右子树存在，并且比左子树小
                k = k + 1
            }
            if arr[k] < temp {
                // 如果子树节点 < 父节点
                arr[i] = arr[k]
                i = k
                // break
            }else {
                break
            }
            k = k * 2 + 1
        }
        arr[i] = temp
    }
    
    func test() {
        print(findKthLargest([3,2,1,5,6,4] , 2))
        
        print(findKthLargest([3,2,3,1,2,4,5,5,6] , 4))
    }
}
