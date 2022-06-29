//
//  Solution468.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/12.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution468 {
    func validIPAddress(_ queryIP: String) -> String {
        var splitList = queryIP.split(separator: ".")
        
        var ipv4Flag = false
        var ipv6Flag = false
        if splitList.count == 4 {
            let count = Array(queryIP).reduce (0, {
                if $1 == "." {
                    return $0 + 1
                }
                return $0
            })
            if count == 3 {
                ipv4Flag = true
            }
        } else {
            splitList = queryIP.split(separator: ":")
            if splitList.count == 8 {
                let count = Array(queryIP).reduce (0, {
                    if $1 == ":" {
                        return $0 + 1
                    }
                    return $0
                })
                if count == 7 {
                    ipv6Flag = true
                }
                
            }
        }
        if ipv4Flag {
            // 检查每个元素是否在0-255之间
            for item in splitList {
                if item.count > 1 && item.starts(with: "0") {
                    ipv4Flag = false
                    break
                }
                let itemValue = Int(item) ?? -1
                if itemValue < 0 || itemValue > 255 {
                    ipv4Flag = false
                    break
                }
            }
        } else {
            // 检查 1-4位，每一位时0-F之间
            for item in splitList {
                if item.count < 1 || item.count > 4 {
                    ipv6Flag = false
                    break
                }
                let chars = Array(item)
                for charItem in chars {
                    if !((charItem >= "0" && charItem <= "9") || (charItem >= "A" && charItem <= "F") || (charItem >= "a" && charItem <= "f")) {
                        ipv6Flag = false
                        break
                    }
                }
                if !ipv6Flag {
                    break
                }
            }
        }
        if ipv4Flag {
            return "IPv4"
        } else if ipv6Flag {
            return "IPv6"
        }
        return "Neither"
    }
    
    func test() {
        
        print(validIPAddress("01.01.01.01"))
        print(validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334:"))
        print(validIPAddress("172.16.254.1"))
       print(validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"))
        print(validIPAddress("256.256.256.256"))
    }
}
