//
//  Solution401.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/7.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// dfs
class Solution401 {
    
    var resultList:[String] = []
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        // let numCount = 10   // 总共10个灯
        resultList = []
        if turnedOn == 0 {
            return  ["0:00"]
        }
        if turnedOn == 10 {
            return []
        }
        dfs(curList:[], count: turnedOn)
        return resultList
    }
    
    func dfs(curList: [Int], count: Int) {
        if count == 0 {
            let result = formatTime(curList: curList)
            if result.count > 0 {
                resultList.append(result)
            }
            return
        }
        var begin = 0
        if curList.count > 0 {
            begin = curList.last! + 1
        }
        if begin >= 10 {
            return
        }
        for i in begin...10 {
            var curList = curList
            curList.append(i)
            dfs(curList: curList, count: count - 1)
        }
    }
    
    func formatTime(curList: [Int]) -> String {
        var hour = 0
        var minute = 0
        for value in curList {
            if value >= 7 {
                hour += powInt(value: value - 7)
            } else {
                minute += powInt(value: value)
            }
        }
        if hour > 11 || minute > 59 {
            return ""
        } else {
            if minute < 10   {
                return "\(hour):0\(minute)"
            } else {
                return "\(hour):\(minute)"
            }
        }
    }
    
    func powInt(value: Int) -> Int {
        let result = [1, 2, 4, 8,  16, 32, 64, 128]
        return result[value]
    }
    
    func test() {
        // ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]
        print(readBinaryWatch(0))
        print(readBinaryWatch(1))
        print(readBinaryWatch(2))
        print(readBinaryWatch(9))
    }
}
