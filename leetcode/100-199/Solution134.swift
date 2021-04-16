//
//  Solution134.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1.暴力法 + 剪枝
// 2.贪心
class Solution134 {
    
    // 暴力法
    func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
        // todo
        return 0
    }
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        
        var restOil = 0      //跑完全程剩下的油
        var minOil = 0         //油在全程中最小值
        var minIndex = -1
        
        for idx in stride(from: 0, to: gas.count, by: 1) {
            restOil += gas[idx] - cost[idx]
            if restOil <= minOil {
                minOil = restOil        //取极小值
                minIndex = idx
            }
        }
        
        if restOil < 0 {
            return -1
        }else {
            return minIndex + 1
        }
        
        /*
        var index = 0
        
        if (gas.count == 0 || cost.count == 0) {
            return -1
        }
        
        if (gas.count != cost.count) {
            return -1
        }
        
        while index < gas.count {
            if (canComplete(gas, cost, index)) {
                return index
            }else {
                index = index + 1
            }
        }
        
        return -1
        */
    }
    
    /*
    func canComplete(_ gas: [Int], _ cost: [Int], _ index:Int) ->Bool {
        //var isComplete = false
        var totalGas = 0
        for idx in stride(from: index, to: gas.count, by: 1) {
            totalGas = totalGas + gas[idx]
            if (totalGas < cost[idx]) {
                return false
            }else {
                totalGas = totalGas - cost[idx]
            }
        }
        
        if index > 0 {
            for idx in stride(from: 0, to: index, by: 1) {
                totalGas = totalGas + gas[idx]
                if (totalGas < cost[idx]) {
                    return false
                }else {
                    totalGas = totalGas - cost[idx]
                }
            }
        }
        return true
    }
    */
    
}
