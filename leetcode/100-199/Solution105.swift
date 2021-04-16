//
//  Solution105.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//由前序和中序构造二叉树
//1. 递归 --速度太慢
//2. 遍历
// 时间复杂度 O(n*n)
class Solution105 {
    
    // 遍历 -- 采用栈
    func buildTree2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        let root = TreeNode.init(preorder.first!)
        var stack:[TreeNode] = Array()
        stack.append(root)
        var inorderIndex = 0
        for i in 1..<preorder.count {
            let preVal = preorder[i]
            var preNode = stack.last!
            
            if preNode.val != inorder[inorderIndex] {
                // 左节点
                // preNode.left = TreeNode.init(preorder[i])
                preNode.left = TreeNode.init(preVal)
                stack.append(preNode.left!)
            }else {
                while (stack.count != 0 && stack.last!.val == inorder[inorderIndex]) {
                    preNode = stack.last!
                    stack.removeLast()
                    inorderIndex = inorderIndex + 1
                }
                
                preNode.right = TreeNode.init(preVal)
                stack.append(preNode.right!)
            }
        }
        
        return root
    }
    
    // 递归
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        
        let root = TreeNode.init(preorder.first!)
        
        let rootIndex = findRootIndex(inorder, root.val)
        if rootIndex == 0 {
            root.left = nil
            root.right = buildTree(Array(preorder[rootIndex+1..<preorder.count]), Array(inorder[rootIndex+1..<inorder.count]))
        }else if rootIndex == preorder.count - 1 {
            root.right = nil
            root.left = buildTree(Array(preorder[1...rootIndex]), Array(inorder[0..<rootIndex]))
        }else {
            root.left = buildTree(Array(preorder[1...rootIndex]), Array(inorder[0..<rootIndex]))
            root.right = buildTree(Array(preorder[rootIndex+1..<preorder.count]), Array(inorder[rootIndex+1..<inorder.count]))
        }
        
        
        return root
    }
    
    // 题目中规定没有重复元素，可以直接查找
    func findRootIndex(_ inorder: [Int], _ rootValue: Int) -> Int {
        if inorder.count == 0 {
            return -1
        }
        for i in (0..<inorder.count) {
            if inorder[i] == rootValue {
                return i
            }
        }
        return -1
    }
    
    func test() {
        
        
        //let root2 = buildTree2([1,2], [2,1])
        
        let root1 = buildTree2([3,9,20,15,7], [9,3,15,20,7])
        
        print("aaa")
    }
}

// 遍历

// root 3

// node(9) 在3 左边， 3->left = 9 , 9入栈

// 9的left, 9的right 为nil ，9 出栈

// 20，为 3的right, 3 出栈， 20入栈

// 15，为20 的left， 15入栈，

// 7， 15的left,right为nil, 15 出栈，
