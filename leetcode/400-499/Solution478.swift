//
//  Solution478.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution478 {
    var radius: Double!
    var x_center:Double!
    var y_center:Double!
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.x_center = x_center
        self.y_center = y_center
    }
    
    func randPoint() -> [Double] {
        var x:Double = getRandomX()
        var y:Double = getRandomY()
        
        let value = pow(radius, 2)
        
        while(true) {
            if (pow(x-x_center, 2) + pow(y-y_center, 2)) <= value {
                return [x, y]
            }else {
                x = getRandomX()
                y = getRandomY()
            }
        }
    }
    
    func getRandomX() -> Double{
        return self.x_center + radius * Double.random(in: -1...1)
    }
    
    func getRandomY() -> Double {
        return self.y_center + radius * Double.random(in: -1...1)
    }
}

class Solution478_test {
    func test() {
        let random = Solution478(1, 0, 0)
        print(random.randPoint())
        print(random.randPoint())
        print(random.randPoint())
    }
}
