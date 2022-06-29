//
//  Solution537.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/12.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution537 {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let num1Value = parseNum(num1)
        let num2Value = parseNum(num2)
        let aValue = num1Value.a * num2Value.a - num1Value.b * num2Value.b
        let bValue = num1Value.a * num2Value.b + num1Value.b * num2Value.a
        return "\(aValue)+\(bValue)i"
    }
    
    func parseNum(_ num: String) -> (a: Int, b: Int) {
        let numList = num.split(separator: "+")
        let num1 = Int(numList[0]) ?? 0
        let num2 = Int(numList[1].split(separator: "i").first!) ?? 0
        
        return (num1, num2)
    }
    
    func test() {
        print(complexNumberMultiply("1+1i", "1+1i"))
        print(complexNumberMultiply("1+-1i", "1+-1i"))
    }
}
