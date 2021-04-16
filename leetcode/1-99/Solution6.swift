//
//  Solution6.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// N 字形排序
// 然后输出
// 思路1，如果有n行，就n个数组来表示
// 思路2，用一个二维数组「x,y ,value」来表示每个字符，然后遍历这个二维数组
// 3. 直接按行来读取
// todo
class Solution6 {
    
    // 定义 numRows个 string 数组
    // 然后遍历过程中王第 i 个数组 添加内容
    // 最后拼接这个数组为字符串 reduce 
    func convert2(_ s: String, _ numRows: Int) -> String {
        
        return ""
    }
    
    //3. 直接按行来读取
    func convert3(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var newStr = ""
        let characters:[Character] = Array(s)
        
        let n = s.count
        let cycleLen = 2 * numRows - 2
        
        for i in 0..<numRows {
            // 按行遍历
            var j = 0
            while j + i < n {
                // print("\(i): \(characters[j+i])")
                newStr.append(characters[j+i])
                
                
                // 如果不是第一行或最后一行，取对应值
                if i != 0 && i != numRows - 1 && j + cycleLen - i < n {
                    // print("\(i): \(characters[j + cycleLen - i])")
                    newStr.append(characters[j + cycleLen - i])
                }
                j += cycleLen
            }
        }
        
        return newStr
    }
    
    // 用二维数组来存储
    func convert(_ s: String, _ numRows: Int) -> String {
        let characters:[Character] = s.map{$0}
        
        if s.count == 0 {
            return s
        }
        
        if numRows == 1 {
            return s
        }
        var column = 0
        let mod = s.count % (numRows * 2 - 2)
        if mod == 0 {
            column = (s.count / (numRows * 2 - 2)) * (numRows - 1)
        }else
        if mod < numRows {
            column = (s.count / (numRows * 2 - 2)) * (numRows - 1) + 1
        }else {
            column = (s.count / (numRows * 2 - 2)) * (numRows - 1) + 1 + (mod - numRows)
        }
        
        var values:[[String]] = Array()
        for _ in (0..<numRows) {
            let chars = [String](repeating: "", count: column)
            values.append(chars)
        }
        
        var i = 0   // 行
        var j = 0   // 列
        var index = 0
        while (index < characters.count) {
            
            let mod = index % (numRows * 2 - 2)
            
            if mod < numRows {
                i = mod
            }else {
                i = numRows * 2 - 2 - mod
            }
            
            if mod < numRows {
                j = (index / (numRows * 2 - 2)) * (numRows - 1)
            }else {
                j = (index / (numRows * 2 - 2)) * (numRows - 1) + (mod - numRows + 1)
            }
            // print("index, i, j", index, i, j)
            values[i][j] = String(characters[index])
            
            index = index  + 1
        }
        
        var newStr = ""
        for i in (0..<values.count) {
            for j in (0..<values[0].count) {
                if values[i][j].count > 0 {
                    newStr = newStr + values[i][j]
                }
            }
        }
        
        return newStr
    }
    
    func test() {
        print(convert("LEETCODEISHIRING", 3))
        print(convert("LEETCODEISHIRING", 4))
        
        print(convert3("LEETCODEISHIRING", 3))
        print(convert3("LEETCODEISHIRING", 4))
    }
}
