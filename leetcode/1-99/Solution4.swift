//
//  Solution4.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 挺难的
// 1. 数组合并后，获取中间
// 2. 一点点的从小到大 step增加
// 3. 直接二分, 第K小的数字
class Solution4 {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let size = nums1.count + nums2.count
        let left = (size + 1)/2
        let right = (size + 2)/2
         
        return (Double(getKth(nums1, 0, nums1.count-1, nums2, 0, nums2.count-1, left)) + Double(getKth(nums1, 0, nums1.count-1,nums2, 0, nums2.count-1, right))) / 2
    }
    
    // 获取第K小的数值
    private func getKth(_ nums1: [Int], _ start1: Int, _ end1: Int, _ nums2: [Int], _ start2: Int, _ end2: Int, _ kIndex: Int) -> Int{
        let len1 = end1 - start1 + 1
        let len2 = end2 - start2 + 1
        if len1 > len2 {
            return getKth(nums2, start2, end2, nums1, start1, end1, kIndex)
        }
        if len1 == 0 {
            return nums2[start2 + kIndex - 1]
        }
        if kIndex == 1 {
            return min(nums1[start1], nums2[start2])
        }
        let i = start1 + min(len1, kIndex/2) - 1
        let j = start2 + min(len2, kIndex/2) - 1
        if nums1[i] > nums2[j] {
            return getKth(nums1, start1, end1, nums2, j+1, end2, kIndex - (j - start2 + 1))
        }else {
            return getKth(nums1, i+1, end1, nums2, start2, end2, kIndex - (i - start1 + 1))
        }
    }
    
    func test() {
        print(findMedianSortedArrays([1, 3], [2]))
        print(findMedianSortedArrays([1, 2], [3, 4]))
    }
}
