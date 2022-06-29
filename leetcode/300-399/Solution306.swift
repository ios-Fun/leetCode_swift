//
//  Solution306.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/15.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 采用回溯
// 过大的整数导致的溢出，采用大数相加
class Solution306 {
    var isValid = false
    var numsArray:[Character] = []
    func isAdditiveNumber(_ num: String) -> Bool {
        isValid = false
        self.numsArray = Array(num)
        dfs(0, [], "")
        return isValid
    }
    
    func dfs(_ index: Int, _ curList:[String], _ curStr: String) {
        if isValid {
            return
        }
        if index >= numsArray.count {
            if curList.count >= 2 {
                if addNum(curList[curList.count - 1], curList[curList.count - 2]) == curStr {
                    isValid = true
                    return
                }
            }
            return
        }
        var newList = curList
        var newStr = curStr
        if curStr.count == 0 && numsArray[index] == "0" {
            // 当前数字为0，只能选选择了
            if curList.count >= 2 {
                if curList[curList.count - 1] == curList[curList.count - 2] {
                    dfs(index+1, curList, String(numsArray[index]))
                }
            } else {
                // 不足两个数字，把 0 加进去
                newList.append("0")
                dfs(index+1, newList, "")
            }
        } else {
            newStr.append(numsArray[index])
            if curList.count >= 2 {
                // 1. 选择加入列表
                if addNum(curList[curList.count - 1], curList[curList.count - 2]) == newStr {
                    newList.append(newStr)
                    dfs(index+1, newList, "")
                }
                // 2. 不选择
                dfs(index+1, curList, newStr)
            } else {
                // 不足2个数字
                // 1. 选择当前字符
                newList.append(newStr)
                dfs(index+1, newList, "")
                // 2. 不选择
                dfs(index+1, curList, newStr)
            }
        }
    }
    
    // 两个字符串数字相加
    func addNum(_ str1: String, _ str2: String) -> String {
        let str1List = Array(str1)
        let str2List = Array(str2)
        let str1Length = str1List.count
        let str2Length = str2List.count
        let length = max(str1Length, str2Length)
        var resultList:[Int] = []
        var hasPlus = false
        for i in 0..<length {
            let str1Item = i >= str1Length ? 0 : (str1List[str1Length - 1 - i].asciiValue! - Character("0").asciiValue!)
            let str2Item = i >= str2Length ? 0 : (str2List[str2Length - 1 - i].asciiValue! - Character("0").asciiValue!)
            let itemValue =  str1Item + str2Item + (hasPlus ? 1 : 0)
            if itemValue >= 10 {
                hasPlus = true
                resultList.append(Int(itemValue)-10)
                // resultList.insert(, at: 0)
            } else {
                hasPlus = false
                // resultList.insert(Int(itemValue), at: 0)
                resultList.append(Int(itemValue))
            }
        }
        if hasPlus {
            resultList.append(1)
        }
        resultList.reverse()
        var result = ""
        for item in resultList {
            result.append("\(item)")
        }
        return result
    }
    
    
    func test() {
//        print(addNum("123", "456"))
//        print(addNum("789", "456"))
        // print(addNum("1980", "1982"))
         print(isAdditiveNumber("112358"))
         print(isAdditiveNumber("199100199"))
        print(isAdditiveNumber("000"))
        print(isAdditiveNumber("211738"))
         print(isAdditiveNumber("198019823962"))
        
    }
    
}
