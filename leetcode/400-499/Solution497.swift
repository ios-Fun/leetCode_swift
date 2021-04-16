//
//  Solution497.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution497 {

    var rects:[[Int]]!
    var total:Int = 0
    var numList:[Int]!
    init(_ rects: [[Int]]) {
        self.rects = rects
        numList = Array()
        // 总的点个数
        for rect in rects {
            total += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            numList.append(total)
        }
        
    }
    
    func pick() -> [Int] {
        let randomIndex = Int.random(in: 0..<total)
        // 二分查找
        var left = 0
        var right = numList.count - 1
        while left != right {
            let mid = (left + right) >> 1
            if randomIndex >= numList[mid]{
                left = mid + 1
            }else {
                right = mid
            }
        }
        
        // let value = randomIndex - numList[left]
        let rect = rects[left]
        let width = rect[2]-rect[0] + 1
        // let height = rect[3]-rect[1] + 1
        let base = left == 0 ? 0 : numList[left-1]
        let m = (randomIndex - base) % width + rect[0]
        let n = (randomIndex - base) / width + rect[1]
        if m == 1 && n > 0 {
            print("aa")
        }
        return [m, n]
    }
        
}

class Solution497Test {
    func test() {
//        let random1 = Solution497([[1,1,5,5]])
//        for _ in 0..<100 {
//            print(random1.pick())
//        }
        
        let random2 = Solution497([[-2,-2,-1,-1],[1,0,3,0]])
        for _ in 0..<100 {
            print(random2.pick())
        }
        
    }
}

// A B
// B C

// A: 1/2
// B: 1/2

