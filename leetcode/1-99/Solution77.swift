//
//  Solution77.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 回溯法
class Solution77 {
    
    var list:[[Int]] = Array()
    
    var n:Int = 0
    var k:Int = 0
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.n = n
        self.k = k
        var curList:[Int] = []
        backtrace(1, cur: &curList)
        return list
    }
    
    func backtrace(_ first: Int, cur: inout [Int]) {
        if cur.count == k {
            list.append(cur)
        }
        
        if first > n {
            return
        }
        
        for i in (first...n) {
            cur.append(i)
            backtrace(i+1, cur: &cur)
            cur.removeLast()
        }
    }
    
    func test() {
        print(combine(4, 2))
    }
}
