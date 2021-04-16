//
//  Solution17_13.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution17_13 {
    func respace(_ dictionary: [String], _ sentence: String) -> Int {
        return 0
    }
    
    func test() {
        print(respace(["looked","just","like","her","brother"], "jesslookedjustliketimherbrother"))
    }
}

// 动态规划
// 0 j - 1
// 1 e - 1 je
// 02 -jes 12-es 2-s
// 03 - jess 13-ess 23 --ss 33 -s
// 04 - jessl
// 05 - jesslo
// 06 - jessloo
// 07 - jesslook
// 08 - jesslooke
// 09 - jess looked
// 10 -
// 13 - jess looked just
