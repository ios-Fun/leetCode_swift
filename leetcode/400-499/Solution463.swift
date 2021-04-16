//
//  Solution463.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution463 {
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let n = grid.count
        
        if n == 0 {
            return 0
        }
        
        let m = grid[0].count
        if m == 0 {
            return 0
        }
        var numCount = 0
        var adjectCount = 0
        for i in (0..<n) {
            for j in (0..<m) {
                if grid[i][j] == 1 {
                    numCount = numCount + 1
                    
                    if m > 1 {
                        // left
                        if j > 0 && grid[i][j-1] == 1 {
                            adjectCount = adjectCount + 1
                        }
                        // right
                        if j < m - 1 && grid[i][j+1] == 1 {
                            adjectCount = adjectCount + 1
                        }
                    }
                    if n > 1 {
                        // up
                        if i > 0 && grid[i-1][j] == 1 {
                            adjectCount = adjectCount + 1
                        }
                        if i < n - 1 && grid[i + 1][j] == 1 {
                            adjectCount = adjectCount + 1
                        }
                    }
                    
                }
            }
        }
        
        return 4 * numCount - adjectCount
    }
    
    func test() {
        print(islandPerimeter([[0,1,0,0],
                         [1,1,1,0],
                         [0,1,0,0],
                         [1,1,0,0]]))
    }
}
