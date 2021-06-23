//
//  Solution162.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution162 {
    // O logN
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if nums[mid] > nums[mid + 1] {
                // 左边 > 右边
                // 左边存在波谷
                right = mid
            }else {
                // 左边 < 右边
                left = mid + 1
            }
        }
        return left
    }
    
    func test() {
        print(findPeakElement([1,2,3,1]))
        
        print(findPeakElement([1,2,1,3,5,6,4]))
    }
}
