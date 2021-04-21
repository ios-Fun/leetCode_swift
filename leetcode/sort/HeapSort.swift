//
//  HeapSort.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class HeapSort {
    // 堆排序 -- 从小到大排序， 最大的元素在最上面，是要建立大顶堆
    func sort(_ nums:[Int]) -> [Int] {
        var numsTemp = nums
        heapSort(&numsTemp)
        return numsTemp
    }
    
    // 第一步：建堆
    func heapSort(_ nums: inout [Int]) {
        
        //1. 建立大顶堆 -- 一半的元素倒着遍历下滤, 时间复杂度 O(n)
        for i in stride(from: (nums.count >> 1 - 1), through: 0, by: -1)  {
            print("i:", i)
            shiftDown(arr: &nums, i: i, length: nums.count)
        }
        print(nums)
        
        // 堆排序， 时间复杂度 O(nlogn)
        for j in stride(from: nums.count - 1, through: 1, by: -1) {
            // 2-a 栈顶是最大值，与最后一个值交换
            nums.swapAt(0, j)
            
            // 2-b 然后继续调整顶点
            shiftDown(arr: &nums, i: 0, length: j)
        }
    }
    
    // 这里以从小到大为例， 需要建立的是大顶堆
    func shiftDown(arr: inout [Int],i: Int, length:Int) {
        var parentIndex = i
        
        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var first = parentIndex
            if leftChildIndex < length && arr[leftChildIndex] > arr[first] {
                first = leftChildIndex
            }
            if rightChildIndex < length && arr[rightChildIndex] > arr[first] {
                first = rightChildIndex
            }
            if first == parentIndex {
                break
            }
            // swap
            arr.swapAt(parentIndex, first)
            parentIndex = first
        }
        print("i:", i, arr)
    }
    
    
    // 调整大顶堆
    /*
    func adjustHeap(arr: inout [Int], i: Int, length:Int) {
        var i = i
        let temp = arr[i]
        var k = 2 * i + 1
        while k < length {
            // 从i节点的左子树（2i+1）开始
            if k + 1 < length && arr[k] < arr[k+1] {
                // 如果 右子树存在，并且比左子树大
                k = k + 1
            }
            if arr[k] > temp {
                // 如果子树节点 > 父节点
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
    */
    
    func test() {
        // print(sort([3, 2, 4]))
        print(sort([3, 2, 4, 23, 9, 7, 10, 13, 33, 55]))
    }
}
