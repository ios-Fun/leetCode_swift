//
//  Solution1366.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/13.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
// 1. 双向链表？
// 2. 优先级队列？
// 3. 26*26的数组--总觉得有些取巧
// 4. 哈希表
class Solution1366 {
    func rankTeams(_ votes: [String]) -> String {
        var list:[[(item: Character, count: Int)]] = []
        var votesChars:[[Character]] = []
        for vote in votes {
            votesChars.append(Array(vote))
        }
        
        return  ""
    }
    
    func test() {
        print(rankTeams(["ABC","ACB","ABC","ACB","ACB"]))
        
        print(rankTeams(["WXYZ","XYZW"]))
        
        print(rankTeams(["ZMNAGUEDSJYLBOPHRQICWFXTVK"]))
        
        print(rankTeams(["BCA","CAB","CBA","ABC","ACB","BAC"]))
        
        print(rankTeams(["M","M","M","M"]))
    }
}

// 多轮次的优先级
// 第一轮
// A->B->C

// X -> W -> Y -> Z
//

// WX
