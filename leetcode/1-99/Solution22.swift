//
//  Solution22.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 括号生成
// 1. 回溯
// 2. 动态规划
// 3. dfs + 剪枝

class Solution22 {
    
    // 动态规划 -- 思路难
    func generateParenthesis2(_ n: Int) -> [String] {
        //let list:[String] = Array.init(repeating: "", count: <#T##Int#>)
        var dp:[[String]] = Array.init(repeating: [], count: n)

        return [""]
    }
    
    // 回溯
    func generateParenthesis1(_ n: Int) -> [String] {
        self.n = n
        strList = Array()
        var chars:[String] = Array()
        backtrace(0, 0, &chars)
        return strList
    }
    
    
    func backtrace(_ left: Int, _ right: Int, _ chars: inout [String]) {
        if chars.count == 2 * n {
            // 添加
            let str = chars.reduce("",+)
            strList.append(str)
            return
        }
        if left < n {
            chars.append("(")
            backtrace(left+1, right, &chars)
            chars.removeLast()
        }
        if right < left {
            chars.append(")")
            backtrace(left, right + 1, &chars)
            chars.removeLast()
        }
    }
    
    // dsf + 剪枝
    func generateParenthesis3(_ n: Int) -> [String] {
        self.n = n
        strList = Array()
        
        dsf(0, 0, "")
        return strList
    }
    
    func dsf(_ left: Int, _ right: Int, _ resultStr: String) {
        // 剪枝
        if left > n || right > n || right > left {
            return
        }
        if left == n && right == n {
            strList.append(resultStr)
            return
        }
        dsf(left+1, right, resultStr + "(")
        dsf(left, right + 1, resultStr + ")")
    }
    
    
    var strList:[String] = []
    
    var n:Int = 0
    // dsf
    func generateParenthesis(_ n: Int) -> [String] {
        
        let curStr = ""
        generate(0,0, curStr)
        return strList
    }
    
    func generate(_ left: Int, _ right: Int, _ resultStr: String) {
        if (left > n || right > n) {
            return
        }
        if left == n && right == n {
            print(resultStr)
            strList.append(resultStr)
        }
        if left >= right {
            // 左括号的数量 >= 右括号的数量
            generate(left+1, right, resultStr+"(")
            generate(left, right+1, resultStr+")")
        }
    }
    
    func test(){
        print(generateParenthesis1(3))
        
        //print(generateParenthesis(4))
    }
}

// n= 1

// ()

// n == 2

// (())
// ()()

// n == 3


