//
//  Solution520.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/2.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution520 {
    func detectCapitalUse(_ word: String) -> Bool {
        var first: Bool = true  // 默认大写
        var second: Bool?
        let charsArray:[Character] = Array(word)
        for i in 0..<charsArray.count {
            if i == 0 {
                first = isBigLetter(charsArray[i])
            }else if i == 1 {
                second = isBigLetter(charsArray[i])
                if !first && second! == true{
                    return false
                }
            }else {
                if isBigLetter(charsArray[i]) {
                    // 大写
                    if first {
                        if second! == true {
                            continue
                        }else {
                            return false
                        }
                    }else {
                        return false
                    }
                }else {
                    // 小写
                    if first && second! == true {
                        return false
                    }
                }
            }
        }
        return true
    }

    func isBigLetter(_ c: Character) -> Bool {
        if Int(c.asciiValue!) <= 90 {
            return true
        }
        return false
    }
    
    func test() {
        print(detectCapitalUse("USA"))
        print(detectCapitalUse("FlaG"))
        print(detectCapitalUse("Google"))
        print(detectCapitalUse("leetcode"))
    }
}
