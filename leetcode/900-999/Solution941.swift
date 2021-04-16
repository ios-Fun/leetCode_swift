//
//  Solution941.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution941 {
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 {
            return false
        }
        var upIndex = 0
        var downIndex = 0
        for i in 1..<arr.count {
            if arr[i] > arr[i-1] && upIndex == i-1 && downIndex == 0{
                upIndex = i
            }else if (arr[i] < arr[i-1] && i > 1) {
                if upIndex == i-1  {
                    downIndex = i
                }else if downIndex == i-1{
                    downIndex = i
                }else {
                    return false
                }
            }else {
                return false
            }
        }
        if downIndex == arr.count - 1 {
            return true
        }else {
            return false
        }
    }
    
    func test() {
        print(validMountainArray([2,1]))
        print(validMountainArray([3,5,5]))
        print(validMountainArray([0,3,2,1]))
        print(validMountainArray([0,1,2,3,4,5,6,7,8,9]))
        print(validMountainArray([9,8, 7,6,5,4,3,2,1,0]))
        print(validMountainArray([0,1,2,3,4,5,6,7,8,9,9]))
        print(validMountainArray([0,1,2,3,4,5,6,7,8,9,8]))
    }
}
