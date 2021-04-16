//
//  Solution264.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 执行用时太慢，待优化
class Solution264 {
    
    // 小顶堆
    func nthUglyNumber2(_ n: Int) -> Int {
     
        // todo
        return 0
    }
    
    // 动态规划 - 三指针
    func nthUglyNumber(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var twoList:[Int] = Array()
        var threeList:[Int] = Array()
        var fiveList:[Int] = Array()
        
        //var resultNum: Int = 1
        var minNum :Int  = 1
        var minIndex = 1
        for _ in (1..<n) {
            twoList.append(minNum * 2)
            threeList.append(minNum * 3)
            fiveList.append(minNum * 5)
            
            if twoList[0] == minNum {
                twoList.removeFirst()
            }
            if threeList[0] == minNum {
                threeList.removeFirst()
            }
            if fiveList[0] == minNum {
                fiveList.removeFirst()
            }
            
            if twoList.count > 0 {
                minNum = twoList[0]
                minIndex = 1
            }
            
            if threeList.count > 0 && threeList[0] < minNum {
                minIndex = 2
                minNum = threeList[0]
            }
            if fiveList.count > 0 && fiveList[0] < minNum {
                minIndex = 3
                minNum = fiveList[0]
            }
            if minIndex == 1 {
                twoList.removeFirst()
            }else if minIndex == 2 {
                threeList.removeFirst()
            }else {
                fiveList.removeFirst()
            }
            // print("\(minNum)")
        }
        return minNum
    }

    func test() {
        print(nthUglyNumber(10))
        print(nthUglyNumber(11))
    }
}
