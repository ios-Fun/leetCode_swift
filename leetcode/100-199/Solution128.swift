//
//  Solution128.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 并查集
// 2. hash
// 3. 动态规划

class Solution128 {
    
    // 1. 并查集
    func longestConsecutive(_ nums: [Int]) -> Int {
        var un = UnionFind.init(nums.count)
        var dic:[Int: Int] = Dictionary()   // key -- 值， value -- index
        for i in 0..<nums.count {
            dic[nums[i]] = i
        }
        for item in dic.enumerated() {
            
            // 比 当前值 大 1的值存在 ，就union
            if dic[nums[item.element.value] + 1] != nil {
                un.union(item.element.value, dic[nums[item.element.value] + 1]!)
            }
        }
        
        // 如何查找最大 -- 用字典存储 index: parent, value: count
        var result:[Int:Int] = Dictionary()
        for i in 0..<nums.count {
            // print(un.find(i))
            if (result[un.find(i)] != nil) {
                result[un.find(i)]! += 1
                // 这里可以直接设置最大count
            }else {
                result[un.find(i)] = 1
            }
        }
        var res = 0
        for item in result.enumerated() {
            res = max(res, item.element.value)
        }
        return res
    }
    
    func test() {
        print(longestConsecutive([100, 4, 200, 1, 3, 2]))
        
        print(longestConsecutive([1, 2, 0, 1]))
    }
}
