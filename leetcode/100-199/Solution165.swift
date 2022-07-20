//
//  Solution165.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/17.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution165 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let list1 = version1.split(separator: ".").map {Int($0) ?? 0}
        let list2 = version2.split(separator: ".").map {Int($0) ?? 0}
        
        for i in 0..<max(list1.count, list2.count) {
            let version1 = i < list1.count ? list1[i] : 0
            let version2 = i < list2.count ? list2[i] : 0
            if version1 < version2 {
                return -1
            }else if version1 > version2 {
                return 1
            }
        }
        return 0
    }
    
    func test() {
        print(compareVersion("1.01", "1.001"))

        print(compareVersion("1.0", "1.0.0"))
        
        print(compareVersion("0.1", "1.1"))
        
        print(compareVersion("1.2", "1.1"))
    }
}
