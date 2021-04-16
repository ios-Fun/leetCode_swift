//
//  Solution135.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution135 {
    // 分发糖果
    // 每个孩子至少分配到 1 个糖果
    // 相邻的孩子中，评分高的孩子必须获得更多的糖果
    // [1,0,2] --> 2、1、2 共 5
    // [1,2,2] --> 1、2、1 共 4
    // 两遍扫描
    func candy(_ ratings: [Int]) -> Int {
        
        if ratings.count <= 1 {
            return ratings.count
        }
        
        var sum = ratings.count
        
        //临时数组
        var temp: [Int] = [Int](repeating: 0, count: ratings.count)
        
        for idx in 0...(ratings.count-2) {
            print("up", idx)
            if ratings[idx + 1] > ratings[idx] {
                temp[idx + 1] = temp[idx] + 1
            }
        }
        
        for idx in (1...ratings.count-1).reversed() {
            print("down", idx)
            if ratings[idx - 1] > ratings[idx] && temp[idx - 1] <= temp[idx]{
                temp[idx - 1] = temp[idx] + 1
            }
            sum = sum + temp[idx]
        }
        sum = sum + temp[0]
        
        return sum
    }
}
