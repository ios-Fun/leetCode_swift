//
//  QuickSort.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 快速排序时间复杂度，平时时间复杂度O(NlogN），最坏时间负责度O(N*N)
// 对比堆排序有点，大部分情况下都是局部元素比较，能很好的利用cache，读的速度比堆排序快
// 普通快速排序，处理有序的时候，会退化到O (n2),这个时候可以采用随机快速排序
class QuickSort {
    // 快速排序
    func sort(_ nums:[Int]) -> [Int] {
        var a = nums
        quickSort(&a, low: 0, high: a.count-1)
        return a
    }
    
    /*
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if low >= high { // 递归结束条件
            return
        }
        var i = low
        var j = high
        let key = nums[i]
        while i < j {
            // 从右边开始比较，比key大的数位置不变
            while i < j && nums[j] >= key {
                j -= 1
            }
            // 只要出现一个比key小的数，将这个数放入左边i的位置
            nums[i] = nums[j]
            // 从左边开始比较，比key小的数位置不变
            while i < j && nums[i] <= key {
                i += 1
            }
            // 只要出现一个比key大的数，将这个数放入右边j的位置
            nums[j] = nums[i]
        }
        nums[i] = key // 将key放入i的位置，则左侧数都比key小，右侧数都比key大
        quickSort(&nums, low: low, high: i - 1) // 左递归
        quickSort(&nums, low: i + 1, high: high) // 右递归
    }
    */
    
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if low >= high {
            return
        }
        var left = low
        var right = high
        // 先保存
        let key = nums[left]
        while left < right {
            // 先右边递减 , 找比key 小的值
            while left < right {
                if nums[right] > key {
                    right -= 1
                }else {
                    // 将 小 的值放在 left 位置
                    nums[left] = nums[right]
                    break
                }
            }
            
            // 再左边递增， 找比 key 大的值
            while left < right {
                if nums[left] < key {
                    left += 1
                }else {
                    // 将 大 的值放在right位置
                    nums[right] = nums[left]
                    break
                }
            }
        }
        // 这里 left = right
        nums[left] = key
        quickSort(&nums, low: low, high: left-1)
        quickSort(&nums, low: left+1, high: high)
    }
    
    // 随机快排 -- 随机一个index与最后一个交换
    func quicksortRandom(_ nums: inout [Int], low: Int, high: Int) {
        
    }
    
    func test() {
        print(sort([23, 2, 4, 1, 9, 7]))
    }
}
