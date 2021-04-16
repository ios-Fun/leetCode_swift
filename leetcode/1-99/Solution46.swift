//
//  Solution46.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 全排列

// 1. 递归（简单）
// 2. 非递归-- [0, 1, 2,3]一点点的递增
// 回溯算法？
//result = []
//def backtrack(路径, 选择列表):
//  if 满足结束条件:
//      result.add(路径)
//      return
//
//  for 选择 in 选择列表:
//      做选择
//      backtrack(路径, 选择列表)
//      撤销选择
class Solution46 {
    
    var resList:[[Int]] = Array()
    func permute(_ nums: [Int]) -> [[Int]] {
        resList = Array()
        n = nums.count
        var output:[Int] = nums
        backtrace(&output, 0)
        return resList
    }
    
    func backtrace(_ output: inout [Int], _ index: Int) {
        if index == n {
            return
        }
        
        for i in index..<n {
            output.swapAt(index, i)
            resList.append(output)
            backtrace(&output, i)
            output.swapAt(index, i)
        }
    }
    
    var result:[[Int]] = Array()
    var newnums:[Int]? = nil
    var n:Int!
    func permute2(_ nums: [Int]) -> [[Int]] {
        newnums = nums
        n = newnums!.count
        var list:[Int] = []
        var visited:[Int] = [Int](repeating: 0, count: n!)
        backTrace2( &visited, &list)
        return result
    }
    
    func backTrace2(_ visited: inout [Int], _ list: inout [Int]) {
        if list.count == n! {
            result.append(list)
            return
        }
        
        for i in(0..<n!) {
            if visited[i] == 1 {
                continue
            }
            list.append(newnums![i])
            visited[i] = 1
            backTrace2(&visited, &list)
            visited[i] = 0
            list.removeLast()
        }
    }
    
    func test() {
        print(permute2([1,2,3]))
    }
}

// 1 ，2 ，3
// 1， 3， 2

// 2， 1， 3
// 2， 3， 1

// 3， 1， 2
// 3， 2， 1
