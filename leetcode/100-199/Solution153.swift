//
//  Solution153.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/3.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二分法
class Solution153 {
    
    var sNum:[Int]!
    
    func findMin(_ nums: [Int]) -> Int {
        // if nums
        sNum = nums
        //let minNum = nums[0]
        return binary(0, nums.count - 1)
        //return minNum
    }
    
    // 二分查找最小值
    func binary(_ left:Int, _ right: Int) -> Int {
        if left == right {
            return sNum[left]
        }
        
        if right == left + 1 {
            return sNum[left] < sNum[right] ? sNum[left] : sNum[right]
        }
        
        // right - left 溢出怎么办？
        let mid = left + (right - left) >> 1
        if sNum[mid] <= sNum[left] && sNum[mid] <= sNum[mid-1] && sNum[mid] <= sNum[mid+1] && sNum[mid] <= sNum[right] {
            return sNum[mid]
        }
        
        let leftMin = sNum[left] < sNum[mid-1] ? sNum[left] : sNum[mid-1]
        let rightMin = sNum[mid+1] < sNum[right] ? sNum[mid+1] : sNum[right]
        if leftMin < rightMin {
            return binary(left, mid-1)
        }else {
            return binary(mid+1, right)
        }
    }
    
    func test() {
        print(findMin([3,4,5,1,2]))
        print(findMin([4,5,6,7,0,1,2]))
        print(findMin([1,2]))
    }
}
