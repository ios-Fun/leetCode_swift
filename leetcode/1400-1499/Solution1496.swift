//
//  Solution1496.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/7.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
// 采用hash
class Solution1496 {
    func isPathCrossing(_ path: String) -> Bool {
        var x = 0
        var y = 0
        let chars = Array(path)
        var itemSet: Set<[Int]> = [[0,0]]
        for char in chars {
            if char == "N" {
                y += 1
            } else if char == "S" {
                y -= 1
            } else if char == "E" {
                x += 1
            } else if char == "W" {
                x -= 1
            }
            if itemSet.contains([x, y]) {
                return true
            } else {
                itemSet.insert([x, y])
            }
        }
        return false
    }
    
    func test() {
        print(isPathCrossing("NES"))
        print(isPathCrossing("NESWW"))
    }
}

// 0-0
// 1-0
// 1-1
// 0-1
// 0-0

