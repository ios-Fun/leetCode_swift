//
//  Solution384.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution384 {

    var nums:[Int]?
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        
        return self.nums!
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        // nums?.shuffle()
        
        var numsTemp = nums
        let count = nums!.count
        if count < 2 {
            return numsTemp!
        }
        for i in 0..<count {
            let index = Int.random(in: Range(i...count-1))
            numsTemp!.swapAt(i, index)
        }
        return numsTemp!
    }
    
}
