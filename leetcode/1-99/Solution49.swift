//
//  Solution49.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 字符串 转 数组， 然后字典 存 数组
//
class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 0 {
            return [[]]
        }
        
        // 用字典来存储结果集
        var resultDic:[[Int]: [String]] = Dictionary()
        for s in strs {
            var numList:[Int] = Array.init(repeating: 0, count: 26)
            for char in s {
                let index = Int(char.asciiValue!) - 97
                // numList[index] = numList[index] + 1
                numList[index] += 1
            }
            if resultDic[numList] == nil {
                resultDic[numList] = [String]()
            }
            resultDic[numList]?.append(s)
        }
        
        return Array(resultDic.values)
    }
    
    func test() {
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
    }
    
}

// "ate", "eat", "tea"
// ["000000"]
