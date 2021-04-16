//
//  Solution75.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 核心： 左右双标记
// 速度慢！！
class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        var low = 0    // 左边为0的数量
        var high = nums.count - 1   // 右边为2的位置
        var i = 0   // index
        while (i <= high) {
            if nums[i] == 0 {
                // 与nums[low]交换
                
                if i == low {
                    i = i + 1
                    low = low + 1
                }else {
                    let temp = nums[i]
                    nums[i] = nums[low]
                    nums[low] = temp
                    low = low + 1
                }
            }else if (nums[i] == 1) {
                i = i + 1
            }else {
                // = 2
                // 与 nums[high]交换
                if i == high {
                    i = i + 1
                    high = high - 1
                }else {
                    let temp = nums[i]
                    nums[i] = nums[high]
                    nums[high] = temp
                    high = high - 1
                }
            }
        }
        //print(nums)
    }
    
    func test() {
        var list1 = [2,0,2,1,1,0]
        sortColors(&list1)
        
        var list2 = [0,0, 2, 0 ,1, 0, 2]
        sortColors(&list2)
        
        var list3 = [2, 0, 1]
        sortColors(&list3)
    }
}
