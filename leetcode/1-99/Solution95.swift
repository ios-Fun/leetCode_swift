//
//  Solution95.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 生成所有的不同的二叉树
// 采用递归（左右子树）
class Solution95 {
    
    // 递归
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        
        return binary(1, n)
        //return resultList
    }
    
    func binary(_ left: Int, _ right: Int) ->[TreeNode?]{
        var node:TreeNode!
        if left == right {
            node = TreeNode.init(left)
            return [node]
        }
        
        var result: [TreeNode?] = Array()
        for i in (left...right) {
            //node = TreeNode.init(i)
            if i == left {
                for item in binary(left+1, right) {
                    node = TreeNode.init(i)
                    node.right = item
                    result.append(node)
                }
            }else if i == right {
                for item in binary(left, right-1) {
                    
                    node = TreeNode.init(i)
                    node.left = item
                    result.append(node)
                }
            }else {
                for item in binary(left, i-1) {
                    //print("left", item?.val)
//                    node = TreeNode.init(i)
//                    node.left = item
                    for item1 in binary(i+1, right) {
                        
                        node = TreeNode.init(i)
                        node.left = item
                        // print("right", item1?.val)
                        node.right = item1
                        result.append(node)
                    }
                }
            }
            
        }
        return result
    }
    
    func test() {
        var list1 = generateTrees(3)
        print("a")
        
//        DispatchQueue.main.async {
//            <#code#>
//        }
    }
}
