//
//  Solution31.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 下一个序列
// 思路--逆序遍历，比较大小， 先交换，后旋转
// 1，5，6，2 --> 2， 5, 6, 1 -> 1, 6, 5, 2
// 1，2，6，3 --> 1,3, 6,2 -> 1, 3, 2, 6
// 多了一层循环！！
class Solution31 {

    // todo
    func nextPermutation(_ nums: inout [Int]) {
        
        if nums.count <= 1 {
            return
        }
        
        // 是否交换过
        var flag =  false
        
        for i in (1..<nums.count).reversed() {
            // 从后往前查找，
            for j in (0..<i).reversed() {
                for k in ((j+1)..<nums.count).reversed() {
                    // print("i, j, k", i, j, k, nums[i], nums[j])
                    if nums[k] > nums[j] {
                        let temp = nums[k]
                        nums[k] = nums[j]
                        nums[j] = temp
                        flag = true
                        reverse(&nums, from: j+1, to: nums.count-1)
                        return
                    }
                }
                
            }
            
        }
        if !flag {
            reverse(&nums, from: 0, to: nums.count-1)
        }
    }
    
    func reverse(_ nums: inout [Int], from:Int, to:Int) {
        var left = from
        var right = to
        while(left<right) {
            let temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp
            left = left + 1
            right = right - 1
        }
    }
    
    func test() {
        //var listb = [100,99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
        //nextPermutation(&listb)
        
        var lista = [4,2,0,2,3,2,0]
        nextPermutation(&lista)
        var list0 = [2, 3, 1]
        nextPermutation(&list0)
        var list1 = [1, 2, 3]  // [1, 3, 2]
        var list2 = [3, 2, 1]
        // [1, 1, 5] -> [1, 5, 1]
        // [1, 3, 2] -> [2, 1, 3]
        
        var list3 = [1, 2, 6, 3]        //[1,2,6,2]
        var list4 = [1, 3, 2]
        // [1, 3, 2] -> [2, 3, 1]
        nextPermutation(&list1)
        nextPermutation(&list2)
        nextPermutation(&list3)
        nextPermutation(&list4)
        print("finish")
    }
}
