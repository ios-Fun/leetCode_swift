//
//  Solution279.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/6.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 动态规划？
// 2. 深度遍历？
class Solution279 {
    func numSquares(_ n: Int) -> Int {
        
        return 1
    }
    
    let MAX_HWM = 0x800000;

    private func roundUpToNextPowerOfTwo(_ n: Int) -> Int {
      // Port of the Node pow2
      guard n < MAX_HWM else { return MAX_HWM }

      // Get the next highest power of 2
//      var ln = n - 1
//      var p  = 1
//      while p < 32 {
//        ln |= ln >> p
//        p <<= 1
//      }
//      ln += 1
        
        var ln = n
        ln = ln - 1
        ln = ln | (ln >> 1)
        ln = ln | (ln >> 2)
        ln = ln | (ln >> 4)
        ln = ln | (ln >> 8)
        ln = ln | (ln >> 16)
        ln = ln + 1
      return ln
    }
    
    func test() {
//        print(numSquares(12))
//        print(numSquares(13))
        
        print(roundUpToNextPowerOfTwo(1000))
        print(roundUpToNextPowerOfTwo(600))
    }
}


// a, b
// a = a + b
// b = a - b
// a = a - b

//1.
// a = a | b
// b = a | b ^ b = a
// a = a | b ^ a = b

// 2
// a = a ^ b
// b = a ^ b ^ b = a ^ 0 = a
// a = a ^ b ^ a = b ^ 0 = b

// & and
// 0 & 0 = 0
// 0 & 1 = 0
// 1 & 1 = 1

// | or
// 0 | 0 = 0
// 1 | 0 = 1
// 1 | 1 = 1

// ^ xor
// 0 ^ 0 = 0
// 1 ^ 0 = 1
// 0 ^ 1 = 1
// 1 ^ 1 = 0


