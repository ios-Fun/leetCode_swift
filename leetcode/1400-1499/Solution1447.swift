//
//  Solution1447.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// dfs
// dp?
class Solution1447 {
    
    
    func simplifiedFractions(_ n: Int) -> [String] {
        if n  == 1   {
            return  []
        }
        var resultList:[String] =  []
        for i in 2...n {
            for j in 1..<i {
                if j == 1 || ( j != 1 && !hasCommon(j, i)) {
                    resultList.append("\(j)/\(i)")
                }
            }
        }
        
        return resultList
    }
    
    func hasCommon(_ j:Int, _ i:Int) -> Bool {
        // var flag = true
        for m in 2...j {
            if j % m == 0 &&  i % m == 0 {
                return true
            }
        }
        return false
    }
    
    func test() {
        print(simplifiedFractions(1))
        print(simplifiedFractions(2))
        print(simplifiedFractions(3))
        print(simplifiedFractions(4))
        print(simplifiedFractions(6))
        // ["1/2","1/3","2/3","1/4","3/4","1/5","2/5","3/5","4/5","1/6","4/6","5/6"]
        
    }
}

//
