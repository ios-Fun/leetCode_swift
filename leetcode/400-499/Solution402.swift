//
//  Solution402.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/7.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 移掉 K 位数字
// 单调栈
// todo 逻辑做的复杂了，待优化
class Solution402 {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if num.count <= k {
            return "0"
        }
        let chars = Array(num)
        var curList:[Int] = []
        var removeList:[Int] = []
        // var count = 0
        for  (index, value) in chars.enumerated() {
            // print()
            let intValue = Int(value.asciiValue!) - 48
            if removeList.count == k {
                // print("removeList:\(removeList)")
                break
            }
            if curList.count == 0 {
                curList.append(index)
                continue
            }
            if intValue >= Int(chars[curList.last!].asciiValue!) - 48 {
                curList.append(index)
            } else {
                // for (index, value) in curList.enumerated().reversed() {
                for _ in curList.reversed() {
                    if intValue < Int(chars[curList.last!].asciiValue!) - 48 {
                        removeList.append(curList.last!)
                        if removeList.count == k {
                            break
                        }
                        curList.removeLast()
                    } else {
                        curList.append(index)
                        break
                    }
                }
                if curList.count == 0 {
                    curList.append(index)
                }
            }
        }
        
        if removeList.count < k {
            for _ in 0..<(k-removeList.count) {
                removeList.append(curList.last!)
                curList.removeLast()
            }
        }
        removeList = removeList.sorted()
        
        // print(removeList)
        var resultStr = ""
        if removeList.count == 0 {
            return num
        }
        var removeListIndex = 0
        // var isFirstZero = true
        for (index, _) in chars.enumerated() {
            if removeListIndex == removeList.count {
                if chars[index] == "0" && resultStr.count == 0 {
                    continue
                }
                resultStr.append(chars[index])
                continue
            }
            if index == removeList[removeListIndex] {
                removeListIndex += 1
                continue
            } else {
                if chars[index] == "0" && resultStr.count == 0 {
                    continue
                }
                resultStr.append(chars[index])
            }
        }
        return resultStr.count == 0 ? "0" : resultStr
    }
    
    func test() {
        print(removeKdigits("4321", 2))
        print(removeKdigits("1173", 2))
        print(removeKdigits("10001", 4))
        print(removeKdigits("1111111", 3))
        print(removeKdigits("112", 1))
        print(removeKdigits("9", 1))
        print(removeKdigits("1432219", 3))

        print(removeKdigits("10200", 1))

        print(removeKdigits("10", 1))
    }
}
