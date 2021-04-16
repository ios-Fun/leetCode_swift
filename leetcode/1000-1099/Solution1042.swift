//
//  Solution1042.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/7.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 邻接矩阵

// 邻接表
class Solution1042 {
    
    // bfs
    func gardenNoAdj2(_ N: Int, _ paths: [[Int]]) -> [Int] {
        // todo
        return []
    }
    
    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        
        if paths.count == 0 {
            return Array.init(repeating: 1, count: N)
        }
        
        let path:[Int] = Array()
        var G:[[Int]] = Array.init(repeating: path, count: N)
        
        for i in 0..<paths.count {
            G[paths[i][0]-1].append(paths[i][1])
            G[paths[i][1]-1].append(paths[i][0])
        }
        
        var colorsArray = Array.init(repeating: 0, count: N)
        // 1-染色1
        // colorsArray[0] = 1
        for i in 0..<G.count {
            // 四种颜色
            let colors:[Int] = [1,2,3,4]
            // colorsArray[]
            for j in 0..<4 {
                colorsArray[i] = colors[j]
                var flag = true
                for item in G[i] {
                    if colorsArray[i] == colorsArray[item-1]{
                        flag = false
                        break
                    }
                }
                if flag {
                    break
                }
            }
        }
        return colorsArray
    }
    
    func test() {
        print(gardenNoAdj(3, [[1,2],[2,3],[3,1]]))
        
        print(gardenNoAdj(4, [[1,2],[3,4]]))

        print(gardenNoAdj(4, [[1,2],[2,3],[3,4],[4,1],[1,3],[2,4]]))
    }
}

// 1 -> 2,3
// 2 -> 1,3
// 3 -> 1,2

