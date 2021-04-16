//
//  BTreeNode.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// B树
class BTreeNode {
    var t: Int
    var h :Int = 1
    var keys = [Int]()
    //var values = [Value]()
    var children: [BTreeNode] = []
    
    // 是否是叶子结点
    var isLeaf: Bool {
        return children.count == 0
    }
    
    var numberOfKeys: Int {
        return keys.count
    }
    
    init(t :Int) {
        self.t = t
    }
    
//    convenience init(keys: [Int], children: [BTreeNode]? = nil) {
//        self.init(t: <#Int#>)
//        self.keys += keys
//        // self.values += values
//        self.children = children
//    }
}
