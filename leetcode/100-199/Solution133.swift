//
//  Solution133.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 字典
//2. dfs
//3. bfs
class Solution133 {
    
    // 深度遍历 DFS
//    func cloneGraph2(_ node:Node?)->Node? {
//        // todo
//        return nil
//    }
//    
//    // 广度遍历 BFS
//    func cloneGraph3(_ node:Node?)->Node? {
//        // todo
//        return nil
//    }
//    
//    var visitedmap = Dictionary<UnsafeMutableRawPointer, Node>()
//    //1. 字典
//    func cloneGraph(_ node:Node?)->Node? {
//        
//        if node == nil {
//            return nil
//        }
//        
//        let copy = Node(node!.val)
//        let objAddress = Unmanaged.passUnretained(node as AnyObject).toOpaque()
//        visitedmap[objAddress] = copy
//        for itemNode in node!.neighbors {
//            let address = Unmanaged.passUnretained(itemNode as AnyObject).toOpaque()
//            if visitedmap[address] != nil {
//                // 如果已经包含在内了，把复制node添加进来
//                copy.neighbors.append(visitedmap[address]!)
//            }else {
//                // 未包含在内的
//                copy.neighbors.append(cloneGraph(itemNode))
//            }
//        }
//        return copy
//    }
//    
//    func test() {
//        let one:Node = Node.init(1)
//        let two:Node = Node.init(2)
//        let three:Node = Node.init(3)
//        let four:Node = Node.init(4)
//        
//        one.neighbors = [two, three]
//        two.neighbors = [one, four]
//        three.neighbors = [one, four]
//        four.neighbors = [two, three]
//        
//        let copy = cloneGraph(one)
//        
//        print("finish")
//    }
}
