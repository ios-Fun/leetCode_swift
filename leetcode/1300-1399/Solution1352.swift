//
//  Solution1352.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/12.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class ProductOfNumbers {
    var list:[Int]!
    var zeroIndex = -1
    // var count = 0
    init() {
        list = []
        zeroIndex = -1
        // count = 0
    }
    
    func add(_ num: Int) {
        if num == 0 {
            list.append(num)
            zeroIndex = list.count - 1
        }else if list.count == 0 || zeroIndex == list.count - 1 {
            list.append(num)
        } else {
            list.append(num * list.last!)
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        if zeroIndex >= list.count - k {
            return 0
        }
        if list.count - k - 1 == zeroIndex {
            return list.last!
        } else {
            return list.last! / list[list.count - k - 1]
        }
        
    }
}


class Solution1352 {
    func test() {
        let p = ProductOfNumbers()
//        p.add(0)
//        p.add(0)
//        p.add(9)
//        print(p.getProduct(3))
//        p.add(8)
//        p.add(3)
//        p.add(8)
//        print(p.getProduct(5))
//        print(p.getProduct(4))
//        print(p.getProduct(6))
//        p.add(8)
//        p.add(8)
        
        
        p.add(3)
        p.add(0)
        p.add(2)
        p.add(5)
        p.add(4)
        print(p.getProduct(2))
        print(p.getProduct(3))
        print(p.getProduct(4))
        p.add(8)
        print(p.getProduct(2))
        
//        let p = ProductOfNumbers()
//        p.add(1)
//        print(p.getProduct(1))
//        print(p.getProduct(1))
//        print(p.getProduct(1))
//        p.add(7)
//        p.add(6)
//        p.add(7)
    }
}
