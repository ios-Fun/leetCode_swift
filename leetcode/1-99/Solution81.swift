//
//  Solution81.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 思路a: 1. 先二分查找找到分段的点，然后再根据target再哪个区间继续二分查找
// 思路b: 1. 整段区间都进行二分查找
class Solution81 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        
        var left = 0
        var right = nums.count - 1
        while(left <= right) {
            while(left<right && nums[left] == nums[left+1]) {
                left = left + 1
            }
            
            while(left<right && nums[right-1] == nums[right]) {
                right = right - 1
            }
            let mid = (left + right)/2
            if nums[mid] == target {
                 return true
            }
            
            if nums[mid] >= nums[left] {
                // 左边部分是有序的
                
                if target < nums[mid] && target >= nums[left] {
                    right = mid-1
                }else {
                    left = mid + 1
                }
            }else if nums[mid] < nums[left]{
                // 右边部分是有序的
                if nums[mid] < target && target <= nums[right] {
                    // target在右边
                    left = mid + 1
                }else {
                    // target在左边
                    right = mid - 1
                }
            }else if nums[mid] == nums[left] {
                
            }
        }
        
        return true
    }
    
    
    
    func test() {
        print(search([2,5,6,0,0,1,2], 0))
        
        print(search([2,5,6,0,0,1,1,1,2], 3))
    }
}
