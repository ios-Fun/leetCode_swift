//
//  TestNum.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/6/20.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class TestNum {
    func test() {
        let a:Double = 5
        let b:Double = 61
        let c:Double = 61
        let d:Double = 12
        
        let w: Double = 75.9
        let wUnit = w/(a+b+c+d)
        print("a:", a * wUnit)
        print("b:", b * wUnit)
        print("c:", c * wUnit)
        print("d:", d * wUnit)
        
        let dian: Double = 63.2
        let a1: Double = 31
        let b1: Double = 31
        let c1: Double = 12
        let dianUnit = dian / (a1+b1+c1)
        print("a1:", a1 * dianUnit)
        print("bb:", b1 * dianUnit)
        print("cc:", c1 * dianUnit)
        
        print("bTotal:", b * wUnit + a1 * dianUnit)
        print("cTotal:", c * wUnit + b1 * dianUnit)
        print("dTotal:", d * wUnit + c1 * dianUnit)
    }
}
