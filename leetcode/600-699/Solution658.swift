//
//  Solution658.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/18.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution658 {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var result:[Int] = []
        let index = binary(arr, x)
        var left = index
        var right = index + 1
        var count = 0
        while count < k {
            if left < 0 {
                result.append(arr[right])
                right += 1
            } else if right >= arr.count {
                result.append(arr[left])
                left -= 1
            } else {
                if arr[left] == x {
                    result.append(arr[left])
                    left -= 1
                    count += 1
                    continue
                }
                if arr[right] == x {
                    result.append(arr[right])
                    right += 1
                } else {
                    if x - arr[left] <= arr[right] - x {
                        result.append(arr[left])
                        left -= 1
                    } else {
                        result.append(arr[right])
                        right += 1
                    }
                }
            }
            count += 1
        }
        return result.sorted()
    }
    
    // 查找x，如果没有x，就最近的
    func binary(_ arr: [Int], _ x: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left < right {
            if arr[right] < x {
                return right
            }
            if arr[left] > x {
                return left - 1
            }
            if right == left + 1 {
                if arr[right] <= x {
                    return right
                } else {
                    return left
                }
            }
            let mid = (left + right) >> 1
            if arr[mid] == x {
                return mid
            }
            
            if arr[mid] > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
    
    func test() {
        print(findClosestElements([3, 5, 8, 10], 2, 15))
        
        print(findClosestElements([0,0,1,2,3,3,4,7,7,8], 3, 5))


         print(findClosestElements([1,2], 1, 1))
         print(findClosestElements([1,2,3,4,5], 4, 3))

         print(findClosestElements([1,2,3,4,5], 4, -1))
          print(findClosestElements([1,2,3,4,5], 4, 5))
        
        // print(binary([0,0,1,2,3,3,4,7,7,8], 5))
        
        // print(binary([1,2], 1))
        // print(binary([1,2,3,4,5], 5))
        // print(binary([3, 5, 8, 10], 15))
//
//        print(binary([1,2,3,4,5], 1))
//
//        print(binary([1,2,3,4,5], 0))
//
//        print(binary([1,2,3,5, 8], 6))
//
//        print(binary([1,2,3,5, 8], 9))
        
        // print(findClosestElements([1,2,3,4,5], 4, 3))
    }
}
