//
//  Solution437.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归 -- 做复杂了
class Solution437 {
    
    var sum:Int!
    var count: Int = 0
    
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
      if root == nil {
        return 0
      }
      
      let res = totalPaths(root, sum)
      let left = pathSum(root!.left, sum)
      let right = pathSum(root!.right, sum)
      
      return res + left + right
    }
    
    func totalPaths(_ root: TreeNode?, _ sum: Int) -> Int {
      guard let root = root else {
        return 0
      }
      
      var res = 0
      if sum == root.val {
        res += 1
      }
      
      res += totalPaths(root.left, sum - root.val)
      res += totalPaths(root.right, sum - root.val)
      
      return res
    }
    
    func pathSum2(_ root: TreeNode?, _ sum: Int) -> Int {
        self.sum = sum
        count = 0
        // var numList:[Int] = Array()
        binary( root, [])
        return count
    }
    
    func binary(_ node: TreeNode? , _ numList: [Int]) {
        guard let node  = node else {
            return
        }
        // for
        if node.val == sum {
            count = count + 1
        }
        for item in numList {
            if item + node.val == sum {
                count = count + 1
            }
        }
        
        var numList = numList
        
        if node.left != nil || node.right != nil {
            numList = numList.map {
                $0 + node.val
            }
            numList.append(node.val)
            // print("numList count:", numList.count)
        }
        binary(node.left, numList)
        binary(node.right, numList)
//        if node.left != nil || node.right != nil {
//            numList.removeLast()
//        }
    }
    
    func test() {
        let a_1 = TreeNode.init(0)
        let a_2 = TreeNode.init(5)
        let a_3 = TreeNode.init(-3)
        let a_4 = TreeNode.init(3)
        let a_5 = TreeNode.init(2)
        let a_6 = TreeNode.init(11)
        let a_7 = TreeNode.init(3)
        let a_8 = TreeNode.init(-2)
        let a_9 = TreeNode.init(1)
        
        a_1.left = a_2
        a_1.right = a_3
        a_2.left = a_4
        a_2.right = a_5
        a_3.right = a_6
        a_4.left = a_7
        a_4.right = a_8
        a_5.right = a_9
        
        print(pathSum(a_1, 8))
    }
}
