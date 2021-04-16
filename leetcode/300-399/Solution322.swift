//
//  Solution322.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 深度遍历，采用了递归
// 2. 动态规划
class Solution322 {
    
    // 动态规划
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        // todo
        return 0
    }
    
    var coins:[Int]!
    var minCount:Int = Int.max
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        self.coins = coins.sorted(by: { (a, b) -> Bool in
            return a > b
        })
        minCount = Int.max
        dst( amount, 0, 0)
        if minCount == Int.max {
            return -1
        }else {
            return minCount
        }
    }
    
    // 深度优先遍历
    
    func dst(_ target: Int, _ count: Int, _ index: Int) {
        if count >= minCount {
            return
        }
        if index >= coins.count {
            return
        }
        //for i in (index..<coins.count) {
            
        if target % coins[index] == 0 {
//            if minCount > (count + target / coins[index]) {
//                minCount = count + target / coins[index]
//            }
            minCount = min(minCount, count + target / coins[index])
            return
        }else if coins[index] < target {
            
            let value = target / coins[index]
            for i in (1...value).reversed() {
                if count + i > minCount {
                    break
                }
                dst(target - coins[index] * i, count + i, index + 1)
            }
            // dst(target - coins[i], count + 1)
        }
        dst(target, count, index + 1)
        //}
    }
    
    func test() {
        print(coinChange([5,306,188,467,494], 7047))
        // print(coinChange([284,260,393,494], 7066))
        // 17
        
//        print(coinChange([186,419,83,408], 6249))
//        // 20
//        print(coinChange([1, 2, 5], 99))
//        // 21
//        print(coinChange([1, 2, 5], 100))
//        // 20
//
//        print(coinChange([1, 2, 5], 11))
//        // 3
//        print(coinChange([2], 3))
//        // -1
//
//        print(coinChange([1], 0))
        //0
    }
}
