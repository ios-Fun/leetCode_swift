//
//  Solution386.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 优先级队列？

// 2. 递归

// 3. dfs

class Solution386 {
    
    // 递归
    var n:Int!
    func lexicalOrder(_ n: Int) -> [Int] {
        self.n = n
        return getList(0)
    }
    
    func getList(_ cur: Int) -> [Int] {
        if cur > n {
            return []
        }
        var list = [Int]()
        
        if cur != 0 {
            list.append(cur)
        }
        
        for i in 0...9 {
            if cur == 0 && i == 0{
                continue
            }
            let temp = cur * 10
            list.append(contentsOf: getList(temp + i))
        }
        return list
    }
    
    func test() {
        print(lexicalOrder(13))
        print(lexicalOrder(27))
    }
}
