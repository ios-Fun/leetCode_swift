//
//  Solution1418.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/8.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 红黑树，有序
// 2. 哈希表，无序
// 3. 二维数组
class Solution1418 {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        return []
    }
    
    func test() {
        print(displayTable([["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]]))
        
        print(displayTable([["James","12","Fried Chicken"],["Ratesh","12","Fried Chicken"],["Amadeus","12","Fried Chicken"],["Adam","1","Canadian Waffles"],["Brianna","1","Canadian Waffles"]]))
        
        print(displayTable([["Laura","2","Bean Burrito"],["Jhon","2","Beef Burrito"],["Melissa","2","Soda"]]))
    }
}
