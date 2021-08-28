//
//  GetMaxLength.swift
//  leetcode
//
//  Created by wangyouzhuo on 2021/7/31.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

extension Int {
    public var hashValue: Int {
        return 0
    }
}

class GetMaxLength {
    // 采用for循环
    func maxLengthBetweenEqualCharacters(s: String) -> Int {
        
        let charArray = Array(s)
        var maxLength = -1
        for i in 0..<charArray.count {
            let item = charArray[i]
            if (charArray.count-1) - i - 1 < maxLength {
                break
            }
            for j in ((i+1)..<charArray.count).reversed() {
                if j - i - 1 < maxLength {
                    break
                }
                if charArray[j] == item {
                    maxLength = max(maxLength, j-i-1)
                    break
                }
            }
        }
        return maxLength
    }
    
    func test() {
        
//        print(maxLengthBetweenEqualCharacters(s: "cc"))
//        print(maxLengthBetweenEqualCharacters(s: "fwejfldskjf"))
//        print(maxLengthBetweenEqualCharacters(s: "dskj"))
    }
}
