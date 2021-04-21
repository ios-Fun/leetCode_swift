//
//  Solution93.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/4/21.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution93 {
    
    var result: Array<String> = []
    
    func restoreIpAddresses(_ s: String) -> [String] {
        result = [];
        var list = Array<String>();
        backTrace(Array(s) , curIndex: 0, curList: &list);
        return result;
    }
    
    func backTrace(_ s: Array<Character>, curIndex: Int, curList: inout Array<String>) {
        if (curList.count == 4) {
            if curIndex == s.count {
                let item = curList.reduce("", {
                    if $0.isEmpty {
                        return $1
                    }else {
                        return $0+"."+$1
                    }
                })
                // print(curList)
                result.append(item)
                return
            }else {
                return
            }
        }
        
        
        let length = min(3, s.count - curIndex)
        for i in 0..<length {
            let char = s[curIndex + i]
            if i == 0 && char == "0" {
                // 如果首位是0
                curList.append(String(char));
                backTrace(s, curIndex: curIndex + 1, curList: &curList)
                curList.removeLast()
                break;
            }else {
                let itemStr = String(s[s.index(s.startIndex, offsetBy: curIndex)..<s.index(s.startIndex, offsetBy: curIndex+i + 1)])
                if (Int(itemStr)! > 255) {
                    continue
                }
                curList.append(String(itemStr));
                backTrace(s, curIndex: curIndex + i + 1, curList: &curList)
                curList.removeLast()
            }
        }
    }
    
    func test() {
        print(restoreIpAddresses("25525511135"))
        print(restoreIpAddresses("0000"))
        print(restoreIpAddresses("1111"))
        print(restoreIpAddresses("010010"))
        print(restoreIpAddresses("101023"))
        print(restoreIpAddresses("1"))
        print(restoreIpAddresses(""))
    }
    
}
