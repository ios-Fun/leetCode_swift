//
//  Solution455.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 双指针
class Solution455 {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gSort = g.sorted()
        let sSort = s.sorted()
        var gIndex = 0
        var sIndex = 0
        var count = 0
        
        while gIndex < g.count && sIndex < s.count {
            if gSort[gIndex] <= sSort[sIndex] {
                gIndex = gIndex + 1
                sIndex = sIndex + 1
                count = count + 1
            }else {
                sIndex = sIndex + 1
            }
        }
        
        return count
    }
    
    func test() {
        print(findContentChildren([1,2,3], [1,1]))
        
        print(findContentChildren([1,2], [1,2,3]))
    }
}
