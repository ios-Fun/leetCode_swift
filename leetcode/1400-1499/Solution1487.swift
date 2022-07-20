//
//  Solution1487.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/8.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 哈希表
class Solution1487 {
    func getFolderNames(_ names: [String]) -> [String] {
        return  []
    }
    
    func test() {
        print(getFolderNames(["pes","fifa","gta","pes(2019)"]))
        
        print(getFolderNames(["gta","gta(1)","gta","avalon"]))
        
        print(getFolderNames(["onepiece","onepiece(1)","onepiece(2)","onepiece(3)","onepiece"]))
        
        print(getFolderNames(["wano","wano","wano","wano"]))
        
        print(getFolderNames(["kaido","kaido(1)","kaido","kaido(1)"]))
    }
}

// pes [0]
// fifa, [0]
// gta, [0]

// gta
// gta(1)
// gta(2)
// avalon

// onepiece
// onepiece(1)
// onepiece(2)
// onepiece(3)

// wano
// wano(1)
// wano(2)

