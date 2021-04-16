//
//  Solution33.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 搜索旋转排序数组
// O(log n)
// 思路： 使用二分查找， 比 target小的，count += 1
class Solution33 {
    
    var sTarget:Int!
    var sNum:[Int]!
    
    func search3(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 { return -1 }
        if nums.count == 1 { return nums[0] == target ? 0 : -1 }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }
            // 左侧有序
            if nums[0] <= nums[mid] {
                if (target >= nums[0]) && (target < nums[mid]) {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                // 右侧有序
                if (target > nums[mid]) && target <= nums[nums.count - 1] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count == 0 {
            return -1
        }
        sTarget = target
        sNum = nums
        return binary(0, sNum.count-1)
        // return 0
    }
    
    func binary(_ left:Int, _ right: Int) -> Int {
        
        if left > right {
            return -1
        }
        
        if left == right {
            if sTarget == sNum[left]
            {
                return left
            }else {
                return -1
            }
        }
        let mid = (left + right)/2
        
        // 中间的刚好是目标值
        if sTarget == sNum[mid] {
            return mid
        }
        
        if sNum[left] <= sNum[mid] {
            if sTarget >= sNum[left] && sTarget < sNum[mid] {
                // target 在左边
                return binary(left, mid-1)
            }else {
                // target 在右边
                return binary(mid+1, right)
            }
        }else {
            
            
            if sNum[mid] < sNum[right] {
                // 右边有序
                if sTarget > sNum[mid] && sTarget <= sNum[right] {
                    // target，在右边
                    return binary(mid+1, right)
                }else {
                    // target 在左边
                    return binary(left, mid-1)
                }
            }else {
                // 右边无序
                // left >= mid >= right

//                if sTarget > sNum[mid] {
//                    return binary(left, mid-1)
//                }else {
//                    return binary(mid+1, right)
//                }
                return binary(mid+1, right)
            }
        }
    }
    
    func test() {
        print(search([4,5,6,7,0,1,2], 0))
        print(search([4,5,6,7,0,1,2], 3))
        print(search([], 3))
        print(search([3], 3))
        print(search([1], 3))
        print(search([1,3], 0))
        print(search([3,1], 1))
//        print(search([3,1,0], 0))
//        print(search([3,1,0], 1))
    }
}

// 0,1,3
