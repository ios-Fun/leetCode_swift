//
//  Solution47.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 全排列2 （包含了重复数字）
// 1. 回溯法
class Solution47 {
    
    var result:[[Int]] = Array()
    var newnums:[Int]? = nil
    var n:Int!
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        newnums = nums.sorted()
        n = nums.count
        // todo
        return result
    }
    
    func backtrace(_ output: inout [Int], _ index: Int) {
        if index == n {
            return
        }
        
        for i in index..<n {
            output.swapAt(index, i)
            result.append(output)
            backtrace(&output, i)
            output.swapAt(index, i)
        }
    }
    
    
    func permuteUnique2(_ nums: [Int]) -> [[Int]] {
        newnums = nums.sorted()
        n = newnums!.count
        var list:[Int] = []
        var visited:[Int] = [Int](repeating: 0, count: n!)
        backTrace2(&visited, &list)
        return result
    }
    
    func backTrace2(_ visited: inout [Int], _ list: inout [Int]) {
        if list.count == n! {
            result.append(list)
            return
        }
        
        for i in(0..<n!) {
            
            if i > 0 && newnums![i] == newnums![i-1] && visited[i-1] == 0{
                continue
            }
            
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
        print(permuteUnique2([1,1,2]))
    }
}
