//
//  Solution451.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 按次数排序
// 1. 用数组存储次数， 字典存储
// 2. 然后排序？ -- 快速排序
// 3. 然后输出字符串

//
class Solution451 {
    
    // 采用堆排序
    func frequencySort2(_ s: String) -> String {
        // todo
        return ""
    }
    
    // 采用字典排序
    func frequencySort(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        let chars = Array(s)
        var dic:[Character: Int] = Dictionary()
        for i in 0..<chars.count {
            if dic[chars[i]] == nil{
                dic[chars[i]] = 1
            }else {
                dic[chars[i]] = dic[chars[i]]! + 1
            }
        }
        let list = dic.sorted(by: {$0.1 > $1.1})
        
        var resultStr = ""
        for i in 0..<list.count {
            // print(list[i])
            let letter = list[i].key
            let count = list[i].value
            for _ in 0..<count {
                resultStr.append(letter)
            }
        }
        return resultStr
    }
    
    func test() {
        print(frequencySort("tree"))
        print(frequencySort("cccaaa"))
        print(frequencySort("Aabb"))
    }
}


