//
//  Solution349.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution349 {
    // 排序 -- 双指针
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        // nlogN
        let sortNums1 = nums1.sorted()
        let sortNums2 = nums2.sorted()
        
        var result:[Int] = Array()
        var indexA = 0
        var indexB = 0
        while indexA < sortNums1.count && indexB < sortNums2.count {
            if sortNums1[indexA] == sortNums2[indexB] {
                // 两者相等
                if result.count == 0 || result.last! != sortNums1[indexA] {
                    result.append(sortNums1[indexA])
                }
                indexA += 1
                indexB += 1
            }else if sortNums1[indexA] > sortNums2[indexB] {
                indexB += 1
            }else {
                indexA += 1
            }
        }
        return result
    }
    
    func test() {
        print(intersection([1,2,2,1], [2,2]))
        print(intersection([4,9,5], [9,4,9,8,4]))
    }
}
