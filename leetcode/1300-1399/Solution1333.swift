//
//  Solution1333.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1333 {
    func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
        let restaurantsSort = restaurants.sorted {a, b in
            if a[1] == b[1] {
                return a[0] > b[0]
            } else {
                return a[1] > b[1]
            }
        }
        var resultList:[Int] = []
        for restaurant in restaurantsSort {
            if veganFriendly == 1 && restaurant[2] == 0 {
                continue
            }
            if maxPrice < restaurant[3] {
                continue
            }
            if maxDistance < restaurant[4] {
                continue
            }
            resultList.append(restaurant[0])
        }
        return resultList
    }
    
    func test() {
        print(filterRestaurants([[1,4,1,40,10],[2,8,0,50,5],[3,8,1,30,4],[4,10,0,10,3],[5,1,1,15,1]], 1, 50, 10))
        
        print(filterRestaurants([[1,4,1,40,10],[2,8,0,50,5],[3,8,1,30,4],[4,10,0,10,3],[5,1,1,15,1]], 0, 50, 10))
        
        print(filterRestaurants([[1,4,1,40,10],[2,8,0,50,5],[3,8,1,30,4],[4,10,0,10,3],[5,1,1,15,1]], 0, 30, 3))
    }
}
