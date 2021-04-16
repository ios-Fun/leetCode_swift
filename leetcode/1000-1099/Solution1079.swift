//
//  Solution1079.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1079 {
    var charArray:[Character]!
    func numTilePossibilities(_ tiles: String) -> Int {

        self.charArray = Array(tiles)
        
        
        return 0
    }
    
    func dfs() {
        
    }
    
    func test() {
        print(numTilePossibilities("AAB"))
        print(numTilePossibilities("AAABBC"))
    }
}

// A AA AAB
// AB ABA
// B BA BAA
