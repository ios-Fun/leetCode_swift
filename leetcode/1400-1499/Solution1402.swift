//
//  Solution1402.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/8.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
import UIKit

class Solution1402 {
    
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let satisfactionSort = satisfaction.sorted {a,b in
            return a > b
        }
        var preSum = 0
        var ans = 0
        for item in satisfactionSort {
            if (preSum + item ) > 0 {
                preSum += item
                ans += preSum
            } else {
                break
            }
        }
        return ans
    }
    
//    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
//        let satisfactionSort = satisfaction.sorted {a,b in
//            return a > b
//        }
//        var preSum = 0
//        var ans = 0
//        for item in satisfactionSort {
//            if (preSum + item ) > 0 {
//                preSum += item
//                ans += preSum
//            } else {
//                break
//            }
//        }
//        return ans
//    }
    
    func test() {
        print(maxSatisfaction([-1,-8,0,5,-9]))
        
//        print(maxSatisfaction([4,3,2]))
//
//        print(maxSatisfaction([-1,-4,-5]))
    }
}
