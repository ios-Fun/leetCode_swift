//
//  Solution659.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/5.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution659 {
    func isPossible(_ nums: [Int]) -> Bool {
        
        // 列表集合
        var result:[[Int]] = Array()
        var array:[Int] = Array()
        array.append(nums.first!)
        result.append(array)

        for i in 1..<nums.count {
            let num = nums[i]
            var isAppend = false
            for i in (0..<result.count).reversed() {
                var list = result[i]
                if list.last == num - 1 {
                    list.append(num)
                    isAppend = true
                    result[i] = list
                    break
                }
            }
            if !isAppend {
                var array:[Int] = Array()
                array.append(num)
                result.append(array)
            }
        }
        
        for list in result {
            if list.count < 3 {
                return false
            }
        }
        return true
    }
    
//    func isPossible(_ nums: [Int]) -> Bool {
//        return false
//    }
    
    
    var flag = false
    var nums: [Int]!
    // 采用dsf
    func isPossible1(_ nums: [Int]) -> Bool {
        flag = false
        self.nums = nums
        dsf(0, -1, 0, listCount: 0)
        return flag
    }
    
    func dsf(_ index: Int, _ lastNum: Int, _ count: Int, listCount: Int) {
        if flag {
            return
        }
        if index >= nums.count {
            if count >= 3 && listCount > 0{
                flag = true
            }
            return
        }
        if count == 0 {
            dsf(index + 1, nums[index], 1, listCount: listCount)
        } else if count < 3 {
            if nums[index] == lastNum + 1 {
                dsf(index + 1, nums[index], count + 1, listCount: listCount)
            }
        } else {
            if nums[index] == lastNum + 1 {
                dsf(index + 1, nums[index], count + 1, listCount: listCount)
                dsf(index + 1, -1 , 0, listCount: listCount + 1)
            } else {
                dsf(index + 1, nums[index] , 1, listCount: listCount + 1)
            }
        }
    }
    
    func test() {
        print(isPossible([1,2,3,3,4,5]))
         print(isPossible([1,2,3,3,4,4,5,5]))
        print(isPossible([1,2,3,4,4,5]))
    }
}
