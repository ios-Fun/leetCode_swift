//
//  Solution297.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二叉树的序列化
// 层序遍历 -- 广度优先遍历
// 深度遍历
class Solution297 {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else{
            return "nil"
        }
        var resultStr = ""
        // 先序遍历
        var stack:[TreeNode?] = Array()
        stack.append(root)
        while stack.count > 0 {
            let node = stack.last!
            stack.removeLast()
            if node != nil {
                stack.append(node?.right)
                stack.append(node?.left)
            }
            
            if node != nil {
                resultStr.append(contentsOf: "\(node!.val),")
            }else {
                resultStr.append(contentsOf: "nil,")
            }
        }
        return resultStr
    }
    
    // 反序列化 -- 采用递归， 或者是迭代
    
    func deserialize(_ data: String) -> TreeNode? {
        
        let array = data.split(separator: ",").map(String.init)
        if array.count == 0 {
            return nil
        }
        if array[0] == "nil" {
            return nil
        }
        
        let root:TreeNode = TreeNode.init(Int.init(array[0])!)
        
        var stack:[TreeNode?] = [root]
        
        var index = 1
        // true表示左，right表示右
        var isLeft = true
        while !stack.isEmpty && index < array.count{
            
            let peekNode = stack.last!
            
            // 在右边 并且 node == nil
            if !isLeft {
                stack.removeLast()
            }
            
            let node:TreeNode?
            // 如果左边是nil，
            if array[index] == "nil" {
                node = nil
            }else {
                node = TreeNode.init(Int.init(array[index])!)
                stack.append(node)
            }
            if isLeft {
                peekNode?.left = node
            }else {
                peekNode?.right = node
            }
            
            if node == nil {
                isLeft = false
            }else {
                isLeft = true
            }
            index = index + 1
        }
        return root
    }
    
    func test() {
        let node1:TreeNode? = nil
        // let node1 = TreeNode.init(1)
        let node2 = TreeNode.init(2)
        let node3 = TreeNode.init(3)
        let node4 = TreeNode.init(4)
        let node5 = TreeNode.init(5)
        let node6 = TreeNode.init(6)
//        node1.left = node2
//        node1.right = node3
//        node3.left = node4
//        node3.right = node5
//        node4.right = node6
        
        let result = serialize(node1)
        print(result)
        
        //1,2,nil,nil,3,4,nil,nil,5,nil,nil,
        // 1,2,nil,nil,3,4,nil,nil,nil,
        let node = deserialize(result)
        print(node)
    }
}

//     1
//  2     3
//      4  5
