//
//  TreeNode.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
