//
//  Solution394.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/5.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 栈-做的有些复杂

// 递归
class Solution394 {
    
    // 递归
    func decodeString2(_ s: String) -> String {
        // todo
        return ""
    }
    
    // 采用栈
    func decodeString(_ s: String) -> String {
        
        let charArray:[Character] = Array(s)
        var numStack:[Int] = Array()
        var strStack:[String] = Array()
        var resultStr = ""
        
        // var beginStack = false
        var stackStr = ""
        var numStr = ""
        var count = 0
        
        for i in 0..<charArray.count {
            
            let value = charArray[i].asciiValue!
            if value >= 48 && value <= 57 {
                // 数字
                
                if stackStr.count > 0 {
                    strStack.append(stackStr)
                    stackStr = ""
                }
                numStr.append(charArray[i])
                continue
            }else if charArray[i] == "[" {
                // 入栈
                // beginStack = true
                numStack.append(Int(numStr) ?? 0)
                numStr = ""
                count = count + 1
                continue
            }else if charArray[i] == "]" {
                count = count - 1
                if stackStr.count > 0 {
                    strStack.append(stackStr)
                }
                stackStr = ""
                
                var tempStr = ""
                //while numStack.count > 0 {
                
                let num = numStack.last!
                let str = strStack.last ?? ""
                if num > 0 {
                    for _ in 0..<num {
                        tempStr.append(str)
                    }
                }
                numStack.removeLast()
                strStack.removeLast()
                
                if numStack.count > 0 {
                    var popStr = ""
                    if numStack.count == strStack.count {
                        popStr = strStack.last ?? ""
                        popStr.append(contentsOf: tempStr)
                        if strStack.count == 0 {
                            strStack.append(popStr)
                        }else {
                            strStack.removeLast()
                            strStack.append(popStr)
                        }
                    }else {
                        popStr = tempStr
                        strStack.append(popStr)
                    }
                }else {
                    // stackStr.append(contentsOf: tempStr)
                    resultStr.append(contentsOf: tempStr)
                }
                continue
            }
            
            if count > 0 {
                if numStack.count == strStack.count {
                    var popStr = strStack.last ?? ""
                    popStr.append(charArray[i])
                    strStack.removeLast()
                    strStack.append(popStr)
                }else {
                    stackStr.append(charArray[i])
                }
            }else {
                resultStr.append(charArray[i])
            }
        }
        return resultStr
    }
    
    func test() {
        
        print(decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef"))
        print(decodeString("3[a]2[b4[F]c]"))
        // aaabFFFFcbFFFFc
        
        print("result: ", decodeString("3[a2[c]]"))
        //accaccacc
        print(decodeString("3[a]2[bc]"))
        //aaabcbc
        print(decodeString("10[a]2[bc]"))
        //aaaaaaaaaabcbc
        print(decodeString("3[2[c]]"))
        print(decodeString("2[abc]3[cd]ef"))
        // abcabccdcdcdef
        print(decodeString("abc3[cd]xyz"))
        //abccdcdcdxyz
    }
}
// 3
// a
// a a a
// 2
// bc
// aaa bc bc

//3[2[]e]
// 3
// 3 2
// a

// 3
// a2
// 3 2
// a2 c

// 3
// acc

// acc acc acc

// 3[a]2[b4[F]c]

// 3
// a

// aaa

// 2
// b

// 2 4
// b F

// 2
// bFFFF

// 2
// bFFFFc

// bFFFFcbFFFFc

// aaabFFFFcbFFFFc
