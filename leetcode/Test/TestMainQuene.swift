//
//  TestMainQuene.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/4/9.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class TestMainQuene {
    func test() {
        
        // 在全局队列中执行
        DispatchQueue.global().async {
            for i in(0..<100) {
                sleep(1)
                DispatchQueue.main.async {
                    print("main:", i)
                }
                print("globel:", i)
            }
        }
        
        // 在main中执行
//        for i in(0..<100) {
//            // sleep(1)
//            DispatchQueue.main.async {
//                print("main:", i)
//            }
//            print("globel:", i)
//        }
        
    }
}
