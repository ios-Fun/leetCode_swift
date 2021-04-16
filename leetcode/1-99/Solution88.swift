//
//  Solution88.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution88 {
    
    // 倒过来填充
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m - 1
        var index2 = n - 1
        var totalIndex = m + n - 1
        
        while index1 >= 0 && index2 >= 0 {
            if nums1[index1] < nums2[index2] {
                nums1[totalIndex] = nums2[index2]
                index2 -= 1
                totalIndex -= 1
            }else {
                nums1[totalIndex] = nums1[index1]
                index1 -= 1
                totalIndex -= 1
            }
        }
    }
    
    // 方式不好
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = 0
        var index1Count = 0
        var index2 = 0
        
        while(index1Count <= m && index2 < n) {
            if nums1[index1] < nums2[index2] {
                if index1Count < m{
                    index1 = index1 + 1
                    index1Count = index1Count + 1
                }else {
                    nums1.insert(nums2[index2], at: index1)
                    index1 = index1 + 1
                    index2 = index2 + 1
                    if nums1.count > m+n {
                        nums1.removeLast()
                    }
                }
            }else {
                nums1.insert(nums2[index2], at: index1)
                index1 = index1 + 1
                index2 = index2 + 1
                if nums1.count > m+n {
                    nums1.removeLast()
                }
            }
        }
    }
    
    func test() {
        var nums = [1,2, 3, 0, 0 ,0]
        merge2(&nums,3, [2,5,6], 3)
        
        
//        var nums1 = [4, 5,6]
//        merge2(&nums1,3, [1, 2, 3], 3)
        print("a")
    }
}
