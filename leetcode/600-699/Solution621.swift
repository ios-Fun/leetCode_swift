//
//  Solution621.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 使用优先级队列

class Solution621 {
    
    func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
        // todo
        return 0
    }
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if tasks.isEmpty {
            return 0
        }
        
        if n == 0 {
            return tasks.count
        }
        
        // 优先级队列
        // var numsList:[(char:Character, count: Int)] = Array()
        
        var numsDic:[Character: Int] = Dictionary()
        for item in tasks {
            if numsDic[item] == nil {
                numsDic[item] = 1
            }else {
                numsDic[item] = numsDic[item]! + 1
            }
        }
        // let keysList = numsDic.sorted(by: {$0.1 > $1.1})
        
        var maxNum = Int.min
        var count = 0
        for key in numsDic.keys {
            let num = numsDic[key]
            if num! > maxNum {
                maxNum = num!
                count = 1
            }else if num == maxNum {
                count = count + 1
            }
        }
        
        return max((maxNum-1)*(n+1)+count, tasks.count)
        
        /*
        var tasksList:[Character] = Array()
        var tasksSet = Set<Character>()
        var count = 0
        while keysList.count != 0 {
            
            var flag = false
            //for (_, item) in numsDic.enumerated() {
            for index in (0..<keysList.count).reversed() {
                if !tasksSet.contains(keysList[index].key){
                    // 不包含key
                    if tasksList.count == n {
                        let first = tasksList.removeFirst()
                        tasksSet.remove(first)
                    }
                    
                    tasksList.append(keysList[index].key)
                    tasksSet.insert(keysList[index].key)
                    
                    count = count + 1
                    // print("count:", count, tasksList)
                    
                    if keysList[index].value > 1 {
                        // numsDic[keysList[index].key] = keysList[index].value - 1
                        keysList[index].value = keysList[index].value - 1
                    }else {
                        // numsDic.removeValue(forKey: keysList[index].key)
                        keysList.remove(at: index)
                    }
                    
                    flag = true
                    break
                }
            }
            if !flag {
                if tasksList.count == n {
                    let first = tasksList.removeFirst()
                    tasksSet.remove(first)
                }
                tasksList.append(" ")
                tasksSet.insert(" ")
                count = count + 1
                //print("count:", count, tasksList)
            }
            if keysList.count > 0 {
                keysList = keysList.sorted(by: {$0.1 < $1.1})
            }
        }
        return count
        */
    }
    
    func test() {
        
        print(leastInterval(["A","A","B","B","C","C","D","D","E","E","F","F","G","G","H","H","I","I","J","J","K","K","L","L","M","M","N","N","O","O","P","P","Q","Q","R","R","S","S","T","T","U","U","V","V","W","W","X","X","Y","Y","Z","Z"],2))
        
        print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"],2))
        // 15
         print(leastInterval(["A","A","A","B","B","B"],2))
        // 8
        print(leastInterval(["A","A","A","B","B","B"],0))
        //6
        print(leastInterval(["A","A","A","B","B","B"],1))
        //6
    }
}

// A3B3

// A
// A B
// B nil
// nil A
// A B
// B nil
// nil A
// A B

// F
// F C
// C G
// G A
// A E
// E B
// B A
// A D
// D ""
// "" A
// A ""

// A A B B C C D D

// A
// A B
// B C
// C D
// D A
// A B
// B C
// C D

// A
// A B
// B A
// A B
// B C
// C D
// D " "
// " " C
// C D
