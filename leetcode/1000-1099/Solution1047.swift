//
//  Solution1047.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1047 {
    func removeDuplicates(_ S: String) -> String {
        let chars = Array(S)
        var stackChars:[Character] = Array()
        for item in chars {
            if stackChars.count > 0 && stackChars.last! == item {
                stackChars.removeLast()
            }else {
                stackChars.append(item)
            }
        }
        var result  = ""
        for item in stackChars {
            result.append(item)
        }
        return result
    }
    
    func test() {
        print(removeDuplicates("abbaca"))
    }
}
