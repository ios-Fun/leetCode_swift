//
//  Solution207.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 环形多叉树 -- 用时过长
class Solution207 {
    
    
    // 广度优先遍历 bfs
    func canFinish2(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var numCourses = numCourses
        var in_degress:[Int] = Array.init(repeating: 0, count: numCourses)
        
        var adjestList:[[Int]] = Array.init(repeating: [], count: numCourses)
        for item in prerequisites {
            in_degress[item[0]] += 1
            adjestList[item[1]].append(item[0])
        }
        
        // 采用队列
        var queue:[Int] = Array()
        for i in 0..<numCourses {
            if in_degress[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let pop = queue.first!
            queue.removeFirst()
            numCourses -= 1
            for item in adjestList[pop] {
                in_degress[item] -= 1
                if in_degress[item] == 0 {
                    queue.append(item)
                }
            }
        }
        
        return true
    }
    
    
    
    var numCourses: Int!
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // 先创建节点 NSSet?
        self.numCourses = numCourses
        var dic:[Int: GraphNode] = Dictionary()
        
        for item in prerequisites {
            //set.insert(GraphNode.init(value: item[0]))
            //set.insert(GraphNode.init(value: item[1]))
            dic[item[0]] = GraphNode.init(value: item[0])
            dic[item[1]] = GraphNode.init(value: item[1])
            
        }
        // set.c
        
        // 然后遍历设置neibers
        for item in prerequisites {
            let keyNode = dic[item[0]]
            keyNode?.nexts.append(dic[item[1]]!)
        }
        
        // 最后遍历？
        // 如何检测有环
        
        for item in prerequisites {
            // var level  = 0
            if dst(dic[item[0]]!, 0) {
                return false
            }
        }
        
        return true
    }
    
    // 深度优先遍历
    func dst(_ node: GraphNode, _ level: Int) -> Bool{
        // print("node:\(node.value) ,level: \(level)")
        let level = level + 1
        if level > numCourses {
            return true
        }
        for item in node.nexts {
            if dst(item, level) {
                return true
            }
            // return dst(item, &level)
        }
        return false
    }
    
    // 用字典 --  不行
//    func canFinish2(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//        var dicInfo:[Int: [Int]] = Dictionary()
//        for item in prerequisites {
//            let num0 = item[0]
//            let num1 = item[1]
//
//            if dicInfo[num1] != nil {
//                // 判断是有有环
//                let list = dicInfo[num1]
//                for num in list! {
//                    if num == num0 {
//                        return false
//                    }
//                }
//            }
//
//            if dicInfo[num0] == nil {
//                // 如果为空
//                dicInfo[num0] = [num1]
//            }else {
//                var list = dicInfo[num0]
//                list?.append(num1)
//                dicInfo[num0] = list
//            }
//        }
//        return true
//    }
    
    func test() {
        print(canFinish(3 ,[[0,1],[0,2],[1,2]]))
        // true
        
        print(canFinish(4, [[2,0],[1,0],[3,1],[3,2],[1,3]]))
        // print(canFinish(3, [[1, 0], [2, 0]]))
        // false
        
        print(canFinish(2, [[1, 0]]))
        // true
        
        print(canFinish(2, [[1,0],[0,1]]))
        // false
        
        print(canFinish(3, [[2,1],[2,0],[0, 2]]))
        // false
        
        print(canFinish(3, [[2,1],[1,0],[0, 2]]))
        // false
        // 2->1, 2->0, 0-> 2
        
        print(canFinish(4, [[4,3],[3,2],[2, 1], [1,3]]))
        // false
    }
}

class GraphNode : Hashable{
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
    var value: Int?
    var nexts: [GraphNode] = Array()

    init(value:Int) {
        self.value = value
    }

}
