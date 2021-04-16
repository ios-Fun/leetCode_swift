//
//  Solution1306.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1306 {
    var set:Set<Int>!
    var arr: [Int]!
    var start:Int!
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        self.set = Set<Int>()
        self.arr = arr
        self.start = start
        
        return dfs(start)
    }
    func dfs(_ curIndex: Int) -> Bool{
        if arr[curIndex] == 0 {
            return true
        }
        if set.contains(curIndex) {
            return false
        }else {
            set.insert(curIndex)
            var backFlag = false
            if curIndex - arr[curIndex] >= 0 {
                backFlag = dfs(curIndex - arr[curIndex])
            }
            var afterFlag = false
            if curIndex + arr[curIndex] < arr.count {
                afterFlag = dfs(curIndex + arr[curIndex])
            }
            return backFlag || afterFlag
        }
        // return false
    }
    
    func test() {
        print(canReach([4,2,3,0,3,1,2], 5))
        print(canReach([4,2,3,0,3,1,2], 0))
        print(canReach([3,0,2,1,2], 2))
    }
}
