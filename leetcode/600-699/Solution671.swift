//
//  Solution671.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/6.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution671 {
    // 1. 递归
    // 2. 层次遍历
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        return find(root, root.val)
    }
    
    private func find(_ node: TreeNode, _ rootValue: Int) -> Int {
        if node.val != rootValue {
            return node.val
        }
        if node.left == nil {
            // 左右子树都是空
            return -1
        }
        let leftMin = find(node.left!, rootValue)
        let rightMin = find(node.right!, rootValue)
        if leftMin == -1 {
            return rightMin
        }
        if rightMin == -1 {
            return leftMin
        }
        // 都不是 -1
        return min(leftMin, rightMin)
    }
        
//        if root.left == nil && root.right == nil {
//            return -1
//        }else {
//            if root.left!.val == root.right!.val {
//                let leftValue = findSecondMinimumValue(root.left)
//                let rightValue = findSecondMinimumValue(root.right)
//                if leftValue == rightValue {
//                    return -1
//                }else {
//                    return max(leftValue, rightValue)
//                }
//            }else {
//                // return max(root.left!.val, root.right!.val)
//                let leftValue = findSecondMinimumValue(root.left)
//                let rightValue = findSecondMinimumValue(root.right)
//                if root.left!.val > root.right!.val {
//                    // 左边 > 右边
//                    if rightValue != -1 && rightValue != root.val {
//                        return rightValue
//                    }else {
//                        return leftValue
//                    }
//                }else {
//                    // 左边 < 右边
//                    if leftValue != -1 && leftValue != root.val {
//                        return leftValue
//                    }else {
//                        return rightValue
//                    }
//                }
//            }
//
//        }
//    }
    
    func test() {
//        let a1 = TreeNode(2)
//        let a2 = TreeNode(2)
//        let a3 = TreeNode(5)
//        let a4 = TreeNode(5)
//        let a5 = TreeNode(7)
//        a1.left = a2
//        a1.right = a3
//        a3.left = a4
//        a3.right = a5
//        print(findSecondMinimumValue(a1))
//
//        let b1 = TreeNode(2)
//        let b2 = TreeNode(2)
//        let b3 = TreeNode(2)
//        b1.left = b2
//        b1.right = b3
//        print(findSecondMinimumValue(b1))
        
        let c1 = TreeNode(1)
        let c2 = TreeNode(1)
        let c3 = TreeNode(3)
        let c4 = TreeNode(1)
        let c5 = TreeNode(1)
        let c6 = TreeNode(1)
        let c7 = TreeNode(2)
        
        c1.left = c2
        c1.right = c3
        c2.left = c4
        c2.right = c5
        c5.left = c6
        c5.right = c7
        print(findSecondMinimumValue(c1))
    }
}

//        1
//    1        3
//  1   1
