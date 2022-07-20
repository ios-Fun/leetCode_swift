//
//  ViewController.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Solution297().test()
    
//    let label = UILabel()
//    var count = 10
//    func finishTask() {
//        print("剩下任务数量：", count)
//        count -= 1
//        label.text = String(format: "剩下任务: %d", count)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let label = UILabel()
//        label.textColor = .black
//        label.text = "初始10个任务"
//        label.frame = CGRect.init(x: 30, y: 100, width: 200, height: 50)
//        self.view.addSubview(label)
//        let semaphore = DispatchSemaphore(value: 3);
//
//        var count = 10;
//        // let mutex = NSLock.init()
//        for i in 0...100 {
//            semaphore.wait()
//            DispatchQueue.global().async {
//                print("task start", i)
//                // sleep(UInt32(Int.random(in: Range(1...5))))
//                print("task end", i)
//                // mutex.lock()
//                count -= 1
//
//                DispatchQueue.main.async {
//                    self.finishTask()
//                }
//                // mutex.unlock()
//            }
//            semaphore.signal()
//        }
        
        // Do any additional setup after loading the view.
//        var dic:[Int:String] = Dictionary()
//
//        for i in 0...1000 {
//            dic[i] = "\(i)"
//            print("capacity:", dic.capacity, dic.count)
//        }
//
//        for key in dic.keys {
//            print("key: %p", key)
//        }
        
        
        
        Solution165().test()
        
//        let button1 = UIButton.init(frame: CGRect.init(x: 30, y: 100, width: 200, height: 50))
//        // button1.setBackgroundImage(UIColor.yellow, for: .normal)
//        button1.backgroundColor = UIColor.yellow
//        button1.setTitle("btn1", for: .normal)
//        button1.setTitleColor(UIColor.black, for: .normal)
//        self.view.addSubview(button1)
//        button1.addTarget(self, action: #selector(btn1Action), for: .touchUpInside)
//
//        // let button2 = UIButton.init(frame: CGRect.init(x: 40, y: 105, width: 100, height: 30))
//
//        let button2 = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30))
//        button2.backgroundColor = UIColor.blue
//        button2.setTitle("btn2", for: .normal)
//        button2.setTitleColor(UIColor.white, for: .normal)
//        button1.addSubview(button2)
//        button2.addTarget(self, action: #selector(btn2Action), for: .touchUpInside)
        
//        label.textColor = .black
//        label.text = "-"
//        label.frame = CGRect.init(x: 30, y: 100, width: 200, height: 50)
//        self.view.addSubview(label)
//
//        DispatchQueue.global().async {
//            sleep(10);
//            self.label.text = "+"
//        }
        
//
//        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
//        count = 0
//
//        let queue1 = DispatchQueue.init(label: "queue1")
//        for index in (0...30) {
//            queue1.async {
//                if index == 2 {
//                    print("create signal start")
//                    self.semaphoreSignal = DispatchSemaphore.init(value: 0)
//                    self.semaphoreSignal?.wait()
//                    print("create signal end")
//                }
//                sleep(1)
//                print("\(index)--", Thread.current)
//            }
//        }
        
    }
    
    @objc func btn1Action(sender: UIButton) {
        print("btn1Action")
    }
    
    @objc func btn2Action(sender: UIButton) {
        print("btn2Action")
    }
    
    
    // 查找一个距离最近的view
    func findnearView(_ curView: UIView, _ toView: UIView) -> (findView: UIView?, distance:Double){
        
        // 遍历
        for _ in toView.subviews {
            
        }
        
        return (nil, 0)
    }
    
    // 两个view的距离
    func distance(_ rect1: CGRect, _ rect2: CGRect) -> Double {
        
        return 0
    }
    
//    @objc func timerEvent() {
//        count = count + 1
//        // semaphoreSignal.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
//            self.delayExecution()
//        }
//    }
//    
//    @objc func delayExecution() {
//        print("semaphoreSignal signal")
//        semaphoreSignal?.signal()
//        self.label.text = String(self.count)
//    }
}

