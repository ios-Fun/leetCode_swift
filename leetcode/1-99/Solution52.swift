//
//  Solution52.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 八皇后--采用位运算
// 回溯

class Solution52 {

    var count = 0
    var res:[Int]!
    var n:Int!
    func totalNQueens(_ n: Int) -> Int {
        self.n = n
        res = Array.init(repeating: -1, count: n)
        count = 0
        check(0)
        return count
    }
    
    func check(_ k: Int) {
        if k == n {
            count += 1
            return
        }
        for i in 0..<n{
            res[k] = i
            if !judge(k) {
                check(k+1)
            }
        }
    }
    
    // true 表示有冲突
    func judge(_ k: Int) -> Bool{
        // 比较 k 前面的与 k 位置的 是否冲突
        for i in 0..<k {
            if res[k] == res[i] || abs(k-i) == abs(res[k]-res[i]) {
                return true
            }
        }
        return false
    }
    
    func test() {
        print(totalNQueens(8))
    }
}
