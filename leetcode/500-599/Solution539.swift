//
//  Solution539.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/13.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 先排序，然后在求差的最小
class Solution539 {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var timeList:[[Int]] = []
        var difMinitesMin = -1
        for timeStr in timePoints {
            timeList.append(parseTime(timeStr))
        }
        timeList = timeList.sorted{a, b in
            if a[0] == b[0] {
                return a[1] < b[1]
            } else {
                return a[0] < b[0]
            }
        }
        let first = timeList.first!
        timeList.append([first[0]+24, first[1]])
        
        for i in 1..<timeList.count {
            let beforeTime = timeList[i-1]
            let nowTime = timeList[i]
            let difMinites = (nowTime[0] - beforeTime[0]) * 60 + ((nowTime[1] - beforeTime[1]))
            if difMinitesMin == -1 {
                difMinitesMin = difMinites
            }else {
                difMinitesMin = min(difMinitesMin, difMinites)
            }
        }
        return difMinitesMin
    }
    
    func parseTime(_ timeStr: String) -> [Int] {
        let list = timeStr.split(separator: ":")
        return [Int(list.first!) ?? 0, Int(list.last!) ?? 0]
    }
    
    func test() {
        print(findMinDifference(["23:59","00:00"]))
        
        print(findMinDifference(["00:00","23:59","00:00"]))
    }
}
