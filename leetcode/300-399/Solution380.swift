//
//  Solution380.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 字典 + 数组

// 增加时 在数组最后增加
// 删除：替换删除最后一个元素
// 随机: random 长度


class Solution380 {

    var dic:[Int:Int]?
    var list:[Int]?
    
    /** Initialize your data structure here. */
    init() {
        dic = Dictionary()
        list = Array()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if dic![val] == nil {
            // hash中不存在val
            list!.append(val)
            dic![val] = list!.count - 1
            return true
        }else {
            return false
        }
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        let index = dic![val]
        if index != nil {
            if index != list!.count - 1 && list!.count > 1{
                // 要删除的元素不是最后一位
                // swap
                let lastValue = list!.last
                
                // 数组替换
                list![index!] = lastValue!
                
                // 字典替换
                dic![lastValue!] = index
            }
            list!.removeLast()
            dic!.removeValue(forKey: val)
            return true
        }else {
            return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        guard list != nil, list!.count > 0 else{
            return 0
        }
        let index = Int.random(in: Range(0...list!.count-1))
        return list![index]
    }
    
}
