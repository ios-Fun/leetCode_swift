//
//  Solution1391.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 并查集
class Solution1391 {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let m  = grid.count
        let n =  grid.first!.count
        let count = m * n
        var uf = UnionFind(count)
        for i in 0..<m {
            for j in 0..<n {
                let item = grid[i][j]
                if item == 1 {
                    if j < n - 1 {
                        if grid[i][j+1] == 1 || grid[i][j+1] == 3 || grid[i][j+1] == 5 {
                            uf.union(i * n + j, i * n + j + 1)
                        }
                    }
                }else if item == 2 {
                    // 上下
                    if i < m - 1{
                        if grid[i+1][j] == 2 || grid[i+1][j] == 5 || grid[i+1][j] == 6 {
                            uf.union(i * n + j, (i+1) * n + j)
                        }
                    }
                }else if item == 3 {
                    // 左下
                    if i < m - 1 {
                        if grid[i+1][j] == 2 || grid[i+1][j] == 5 || grid[i+1][j] == 6 {
                            uf.union(i * n + j, (i+1) * n + j)
                        }
                    }
                }else if item == 4 {
                    // 右下
                    if i < m - 1 {
                        // 下
                        if grid[i+1][j] == 2 || grid[i+1][j] == 5 || grid[i+1][j] == 6 {
                            uf.union(i * n + j, (i+1) * n + j)
                        }
                    }
                    // 右
                    if j < n - 1 {
                        if grid[i][j+1] == 1 || grid[i][j+1] == 3 || grid[i][j+1] == 5 {
                            uf.union(i * n + j, i * n + j + 1)
                        }
                    }
                }else if item == 5 {
                    // 左上
                }else if item == 6 {
                    // 右上
                    if j < n - 1 {
                        if grid[i][j+1] == 1 || grid[i][j+1] == 3 || grid[i][j+1] == 5 {
                            uf.union(i * n + j, i * n + j + 1)
                        }
                    }
                }

            }
        }
        return uf.isConnected(0, m*n-1)
    }
    
    
    func test() {
        print(hasValidPath([[2,4,3],[6,5,2]]))
        
        print(hasValidPath([[1,2,1],[1,2,1]]))

        print(hasValidPath([[1,1,2]]))



        print(hasValidPath([[1,1,1,1,1,1,3]]))

        print(hasValidPath([[2],[2],[2],[2],[2],[2],[6]]))
    }
}
