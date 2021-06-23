//
//  Solution_o_13.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_13 {
    var m:Int!
    var n:Int!
    var k:Int!
    var list:[[Bool]]!
    var visit:[[Bool]]!
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        self.m = m
        self.n = n
        self.k = k
        let nList:[Bool] = Array.init(repeating: false, count: n)
        self.list = Array.init(repeating: nList, count: m)
        self.visit = Array.init(repeating: nList, count: m)
        
        // list[0][0] = true
        dfs(0, 0)
        var count = 0
        for i in 0..<m {
            for j in 0..<n {
                if list[i][j] {
                    count += 1
                }
            }
        }
        return count
    }
    
    func isValid( _ mIndex: Int, _ nIndex: Int, _ k: Int) -> Bool {
        var mIndex = mIndex
        var nIndex = nIndex
        var sum = 0
        while mIndex > 0 {
            sum += mIndex % 10
            mIndex = mIndex / 10
        }
        while nIndex > 0 {
            sum += nIndex % 10
            nIndex = nIndex / 10
        }
        return sum <= k
    }
    
    // 深度优先
    func dfs(_ mIndex: Int, _ nIndex: Int) {
        // 如果未访问过
        if !visit[mIndex][nIndex] {
            visit[mIndex][nIndex] = true
            let valid = isValid(mIndex, nIndex, k)
            list[mIndex][nIndex] = valid
            
            if valid {
                // 上下左右
                if mIndex > 0{
                    dfs(mIndex - 1, nIndex)
                }
                if mIndex < m - 1{
                    dfs(mIndex + 1, nIndex)
                }
                if nIndex > 0 {
                    dfs(mIndex, nIndex - 1)
                }
                if nIndex < n - 1 {
                    dfs(mIndex, nIndex + 1)
                }
            }
            
        }
    }
    
    func test() {
        
        print(movingCount(16, 8, 4))
        print(movingCount(2, 3, 1))
        
        print(movingCount(3, 1, 0))
    }
}

//0-0  0-1   0-2
//1-0  1-1   1-2
