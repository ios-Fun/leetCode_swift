//
//  Solution1200.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1200 {
    
    func quickSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = arr[i]
        while i < j {
            while i < j {
                if arr[j] >= key {
                    j -= 1
                }else {
                    arr[i] = arr[j]
                    i += 1
                    break
                }
            }
            while i < j {
                if arr[i] <= key {
                    i += 1
                }else {
                    arr[j] = arr[i]
                    j -= 1
                    break
                }
            }
        }
        arr[i] = key
        quickSort(&arr, left, i-1)
        quickSort(&arr, i+1, right)
    }
    
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        // let arr = arr.sorted()
        var arr = arr
        quickSort(&arr, 0, arr.count-1)
        var minSub = arr[1] - arr[0]
        for i in 1..<arr.count {
            minSub = min(minSub, arr[i] - arr[i-1])
        }
        var result:[[Int]] = []
        for i in 1..<arr.count {
            if (arr[i] - arr[i-1]) == minSub {
                result.append([arr[i-1], arr[i]])
            }
        }
        return result
    }
    
    func test() {
//        print(minimumAbsDifference([4,2,1,3]))
//        print(minimumAbsDifference([1,3,6,10,15]))
        print(minimumAbsDifference([3,8,-10,23,19,-4,-14,27]))
    }
}
