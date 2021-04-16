//
//  ThreadTest.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class ThreadTest {
    
    func test() {
        
        //        DispatchQueue.main.async {
        //            DispatchQueue.main.async {
        //                sleep(2)
        //                print("1"+"\(Thread.current)")
        //            }
        //            print("2" + "\(Thread.current)")
        //            DispatchQueue.main.async {
        //                print("3" + "\(Thread.current)")
        //            }
        //        }
        //        sleep(1)
                // 睡1s
                // 2. main
                // 睡2s
                // 1. main
                // 3. main
                
        //        DispatchQueue.global().async {
        //            DispatchQueue.global().async {
        //                sleep(2)
        //                print("1"+"\(Thread.current)")
        //            }
        //            print("2" + "\(Thread.current)")
        //            DispatchQueue.global().async {
        //                print("3" + "\(Thread.current)")
        //            }
        //        }
        //        print("1-a" + "\(Thread.current)")
        //        sleep(1)
        //        print("1-b" + "\(Thread.current)")
                
                //let queen = OperationQueue()
                
                // 输出2
                // 输出3
                // 过2秒，输出1
                
                // maxConcurrentOperationCount = 1
                // 输出2
                // 过2秒，输出1
                // 输出3
                
                
                // DispatchQueue.global().async 有可能与后面的异步执行
                // 总是在后面执行,要在下一个runloop才能执行
        //        DispatchQueue.global().async {
        //            for index in (0...100) {
        //                print("\(index)--aa")
        //                DispatchQueue.global().async {
        //                    //var i = 10
        //                    //print("\(index)--\(i)")
        //                    print("\(index)--bb")
        //                    // DispatchQueue.global()
        //                    DispatchQueue.main.async {
        //                        print("\(index)--cc")
        //                    }
        //
        //                    //i = 20
        //                }
        //                print("\(index)--dd")
        //            }
        //        }
                
                // 多个并行队列异步会复用线程
                // N个串行队列异步会有N个线程
                for index in (0...60) {
        //            DispatchQueue.global().sync {
        //                print("\(index)--", Thread.current)
        //            }
                    let queue1 = DispatchQueue.init(label: "queue\(index)", qos: .default, attributes: .concurrent)
                    queue1.async {
                        print("\(index)--", Thread.current)
                    }
        //            let queue1 = DispatchQueue.init(label: "queue1")
        //            queue1.async {
        //                DispatchQueue.main.sync {
        //                    print("\(index)--", Thread.current)
        //                }
        //            }
                }
                
        
        /*
               let queue1 = DispatchQueue.init(label: "queue1")
               let queue2 = DispatchQueue.init(label: "queue2")
               let queue3 = DispatchQueue.init(label: "queue3")
               let queue4 = DispatchQueue.init(label: "queue4")
               let queue5 = DispatchQueue.init(label: "queue5")
               let queue6 = DispatchQueue.init(label: "queue6")
               let queue7 = DispatchQueue.init(label: "queue7")
               let queue8 = DispatchQueue.init(label: "queue8")
               
               // 总需求： 一开始有100个下载图片请求，后续不断有新的下载图片请求任务加入
               // 方案1： 最多三个任务同时执行，不用关心底层具体多少个线程
               // 方案2： 最多三个线程同时执行
               
               // 1. 需要指定在 queue1 ， queue2， queue3上执行， 如何动态分配到其中一个执行
               
               // 最多同时三个图片下载
               // 1. 信号量
               // 2. OprationQueue的maxOperaionCount
               for i in (0...100) {
                   DispatchQueue.global().async {
                       // 下载图片
                   }
               }
               
               for i in (0...10) {
                   queue1.async {
                       self.test(index: 1, count: i)
                   }
               }
               for i in (0...10) {
                   queue2.async {
                       self.test(index: 2, count: i)
                   }
               }
               for i in (0...10) {
                   queue3.async {
                       self.test(index: 3, count: i)
                   }
               }
               for i in (0...10) {
                   queue8.async {
                       self.test(index: 8, count: i)
                   }
               }
               for i in (0...10) {
                   queue4.async {
                       self.test(index: 4, count: i)
                   }
               }
               for i in (0...10) {
                   queue5.async {
                       self.test(index: 5, count: i)
                   }
               }
               for i in (0...10) {
                   queue6.async {
                       self.test(index: 6, count: i)
                   }
               }
               for i in (0...10) {
                   queue7.async {
                       self.test(index: 7, count: i)
                   }
               }
               let queue9 = DispatchQueue.init(label: "queue9")
               for i in (0...10) {
                   
                   queue9.async {
                       self.test(index: 9, count: i)
                   }
               }
               let queue10 = DispatchQueue.init(label: "queue10")
               for i in (0...10) {
                   
                   queue10.async {
                       self.test(index: 10, count: i)
                   }
               }
               let queue11 = DispatchQueue.init(label: "queue11")
               for i in (0...10) {
                   
                   queue11.async {
                       self.test(index: 11, count: i)
                   }
               }
               let queue12 = DispatchQueue.init(label: "queue12")
               for i in (0...10) {
                   
                   queue12.async {
                       self.test(index: 12, count: i)
                   }
               }
               let queue13 = DispatchQueue.init(label: "queue13")
               for i in (0...10) {
                   
                   queue13.async {
                       self.test(index: 13, count: i)
                   }
               }
               
               let queue14 = DispatchQueue.init(label: "queue14")
               for i in (0...10) {
                   queue14.async {
                       self.test(index: 14, count: i)
                   }
               }
               let queue15 = DispatchQueue.init(label: "queue15")
               for i in (0...10) {
                   queue15.async {
                       self.test(index: 15, count: i)
                   }
               }
               let queue16 = DispatchQueue.init(label: "queue16")
               for i in (0...10) {
                   queue16.async {
                       self.test(index: 16, count: i)
                   }
               }
               let queue17 = DispatchQueue.init(label: "queue17")
               for i in (0...10) {
                   queue17.async {
                       self.test(index: 17, count: i)
                   }
               }
               let queue18 = DispatchQueue.init(label: "queue18")
               for i in (0...10) {
                   queue18.async {
                       self.test(index: 18, count: i)
                   }
               }
               */
    }
}

// 锁

// 自旋锁
// 互斥锁
// 递归锁
// 读写锁
// 信号量
