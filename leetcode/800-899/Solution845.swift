//
//  Solution845.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution845 {
    // todo 待优化
    func longestMountain(_ arr: [Int]) -> Int {
        if arr.count < 3 {
            return 0
        }
        var upStartIndex = 0
        var upCurIndex = -1
        var curDownIndex = 0
        var maxCount = 0
        for i in 1..<arr.count {
            if i == 6 {
                // print(i)
            }
            if arr[i] > arr[i-1] {
                // 上升
                if upCurIndex == -1 {
                    upStartIndex = i-1
                    upCurIndex = i
                }else if upCurIndex == i-1 {
                    upCurIndex = i
                }else {
                    upStartIndex = i-1
                    upCurIndex = i
                }
            }else if arr[i] < arr[i-1] {
                if i == 1 {
                    continue
                }
                if upCurIndex == i-1 || curDownIndex == i-1{
                    curDownIndex = i
                    maxCount = max(maxCount, curDownIndex - upStartIndex + 1)
                }
            }
        }
        
        return maxCount
    }
    
    func test() {
        print(longestMountain([2,1,4,7,3,2,5]))
        print(longestMountain([2,1,4,7,3,2,5,4,3,2,1,3]))
        print(longestMountain([2,2,2]))
    }
}
