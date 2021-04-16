//
//  RBTreeNode.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

enum RBTreeNodeColor {
    case Red
    case Black
}

// 红黑树节点
class RBTreeNode {
    var key: Int!
    
    var color: RBTreeNodeColor  = RBTreeNodeColor.Black
    
    var parent: RBTreeNode?
    
    var left: RBTreeNode?
    
    var right: RBTreeNode?
    
    init(key: Int) {
        self.key = key
    }
    
    
    func isRed() -> Bool {
        return color == .Red
    }
}
