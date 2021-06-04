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
      
        let fee = 73.9
        let a1:Double = 5
        let a2:Double = 30
        let a3:Double = 30
        let totalDay = a1 + a2 + a3
        let itemDay = fee / totalDay
        let a1_fee = a1 * itemDay
        let a2_fee = a2 * itemDay
        let a3_fee = a3 * itemDay
        print(a1_fee, a2_fee, a3_fee)
        
//        for i in 1...100 {
//            let num = (i-1) % 9 / 3
//            if num == 0 {
//               queue0.async {
//                   if i == 1 {
//                       self.printTheadAndNum(num: i)
//                       self.smaphore0.signal()
//                   } else {
//                       self.smaphore0.wait()
//                       self.printTheadAndNum(num: i)
//                       if i % 3 == 0 {
//                           self.smaphore1.signal()
//                       }
//                       self.smaphore0.signal()
//                   }
//               }
//           } else if num == 1 {
//               queue1.async {
//                   self.smaphore1.wait()
//
//                   self.printTheadAndNum(num: i)
//                   if i % 3 == 0 {
//                       self.smaphore2.signal()
//
//                   }
//                   self.smaphore1.signal()
//               }
//           } else if num == 2 {
//               queue2.async {
//
//                   self.smaphore2.wait()
//
//                   self.printTheadAndNum(num: i)
//                   if i % 3 == 0 {
//                       self.smaphore0.signal()
//                   }
//
//                   self.smaphore2.signal()
//               }
//
//        }
        
        
//        var index = 0
//
//        let queue=OperationQueue()
//        var lastOpration: BlockOperation? = nil
//        for i in 0...34 {
//            let operation = BlockOperation(block: {
//                for j in 0...2 {
//                    index += 1
//                    print(i, j,  index)
//                }
//            })
//            if i != 0 {
//                operation.addDependency(lastOpration!)
//            }
//            queue.addOperation(operation)
//
//            lastOpration = operation
//        }
        
    }
        // 在全局队列中执行
//        DispatchQueue.global().async {
//            for i in(0..<100) {
//                sleep(1)
//                DispatchQueue.main.async {
//                    print("main:", i)
//                }
//                print("globel:", i)
//            }
//        }
        
        // 在main中执行
//        for i in(0..<100) {
//            // sleep(1)
//            DispatchQueue.main.async {
//                print("main:", i)
//            }
//            print("globel:", i)
//        }
        
//     }
}
