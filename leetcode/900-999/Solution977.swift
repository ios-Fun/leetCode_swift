//
//  Solution977.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


class Solution977 {
    
    // 先最大的
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result:[Int] = Array.init(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        var index = nums.count - 1
        while left <= right {
            if abs(nums[left]) < abs(nums[right]) {
                result[index] = nums[right] * nums[right]
                right -= 1
                index -= 1
            }else {
                result[index] = nums[left] * nums[left]
                left += 1
                index -= 1
            }
        }
        return result
    }
    
    //  思路不对，找了最小的
    func sortedSquares2(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return [nums[0] * nums[0]]
        }
        
        var minIndex = 0
        if nums.last! <= 0 {
            minIndex = nums.count - 1
        }else if nums.first! >= 0 {
            minIndex = 0
        }else {
            var left = 0
            var right = nums.count - 1
            // var mid = 0
            while left < right {
                if nums[left] == nums[right] {
                    minIndex = left
                    break
                }
                let mid = left + (right - left) >> 1
                let midUp = min(mid+1, nums.count - 1)
                let midDown = max(mid-1,0)
                if abs(nums[mid]) <= abs(nums[midUp]) && abs(nums[mid]) <= abs(nums[midDown]) {
                    left = mid
                    minIndex = mid
                    break
                }
                if abs(nums[mid]) <= abs(nums[midUp]) &&  abs(nums[mid]) > abs(nums[midDown]) {
                    right = mid - 1
                }else {
                    left = mid + 1
                }
            }
            minIndex = left
        }
        var leftIndex = minIndex-1
        var rightIndex = minIndex+1
        var result:[Int] = Array()
        result.append(nums[minIndex] * nums[minIndex])
        while leftIndex >= 0 || rightIndex < nums.count {
            var isLeft = false
            
            if leftIndex >= 0 {
                if rightIndex >= nums.count {
                    isLeft = true
                }else {
                    if abs(nums[leftIndex]) <= abs(nums[rightIndex]) {
                        isLeft = true
                    }
                }
            }
            if isLeft {
                result.append(nums[leftIndex] * nums[leftIndex])
                leftIndex -= 1
            }else {
                result.append(nums[rightIndex] * nums[rightIndex])
                rightIndex += 1
            }
        }
        return result
    }
    
    func test() {
        print(sortedSquares([-10,-3,-2,-2,-2,1,3,3,4,8]))
        
        print(sortedSquares([-3,-3,-2,1]))
        print(sortedSquares([-5,-3,-2,-1]))

        print(sortedSquares([1, 1]))
        print(sortedSquares([1, 2]))
        print(sortedSquares([-3, 1, 2]))
        print(sortedSquares([-4,-1,0,3,10]))
        print(sortedSquares([-7,-3,2,3,11]))
    }
}
