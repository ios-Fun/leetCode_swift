//
//  RBTree.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/11.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 红黑树

//特性
// 1. 节点是红色或者黑色
// 2. 根是黑色
// 3. 所有叶子（nil节点）为黑色
// 4. 每个红色节点必须有两个黑色的子节点（从每个叶子到根的所有路径上不能有两个连续的红色节点）
// 5. 从任一节点到其每个叶子到所有简单路径都包含相同数目的

// 插入
// 1. 父红叔红 -> 父叔黑，爷红
// 2-a 父红叔黑，左左 -> 父黑爷红，爷右旋
// 2-b 父红叔黑，右右 -> 父黑爷红, 爷左旋
// 2-c 父红叔黑，左右 -> 父左旋， 变成了2-a
// 2-d 父红叔黑，右左 -> 父右旋， 变成了2-b
// 3. 叔为nil -> 就是叔黑

// 删除
// 1. 删除的节点没有孩子
// 2. 删除的节点只有左子树
// 3. 删除的节点只有右子树
// 4. 删除的节点拥有左子树和右子树（删除后继节点，变成了前三种情况）

// 1. 删除的节点只有左子树或只有右子树 -> 用左或右子树替换当前，然后删除左右子树（应该是找前驱或者后继），到条件2
// 2. 删除的节点没有孩子
// 2-a. 待删除节点是红色的 -> 直接删除
// 2-c. 待删除节点是黑色，父节点是黑色，兄弟是红色-> 父红兄黑，待删节点是左子树父左旋，否则右旋，结果到2-d或2-e
// 2-d. 待删除节点是黑色， 兄弟是黑色，远侄子是红色 -> 交换父和兄弟的颜色，远侄子为黑色，在对父节点做左旋或右旋，待删节点删除
// 2-e. 待删除节点是黑色， 兄弟是黑色，近侄子是红色 -> 兄弟红色，近侄子黑色，兄弟左旋或右旋，结果到2-d
// 2-g. 待删除节点是黑色， 兄弟是黑色，兄弟的孩子也都是黑色(即兄弟是叶子节点) -> 兄弟变红色，父如果是红变黑，父如果是黑到2-c

class RBTree {
    
    var root: RBTreeNode?
    var size: Int = 0
    init() {
        
    }
    
    // 中序遍历
    func inorderWalk(){
        if self.root != nil {
            var numList:[Int] = Array()
            print(inorder(self.root!, &numList))
        }
    }
    
    // 中序遍历
    private func inorder(_ node:RBTreeNode, _ numsList: inout [Int]){
        if node.left == nil && node.right == nil {
            numsList.append(node.key)
            return
        }
        if node.left != nil && node.right == nil {
            inorder(node.left!, &numsList)
            numsList.append(node.key)
        }else if node.right != nil && node.left == nil {
            numsList.append(node.key)
            inorder(node.right!, &numsList)
        }else {
            inorder(node.left!, &numsList)
            numsList.append(node.key)
            inorder(node.right!, &numsList)
        }
    }
    
    // 查找key的节点
    func search(_ key:Int, _ tree:RBTreeNode?) -> RBTreeNode? {
        var cursor:RBTreeNode?
        if tree == nil {
            cursor = root
        }else {
            cursor = tree
        }
        while cursor != nil {
            if cursor!.key == key {
                return cursor
            }else if cursor!.key < key {
                cursor = cursor!.right
            }else {
                cursor = cursor!.left
            }
        }
        return nil
    }
    
    // 左旋
    private func leftRotate(_ node: RBTreeNode) {
        guard let right = node.right else {
            assertionFailure("right node is not nil")
            return
        }
        
        if let parent = node.parent {
            if parent.left === node {
                parent.left = right
            }else {
                parent.right = right
            }
            right.parent = parent
        }else {
            // node is root
            right.parent = nil
            root = right
        }
        right.left?.parent = node
        node.right = right.left
        node.parent = right
        right.left = node
    }
    
    //  右旋
    private func rightRotate(_ node: RBTreeNode) {
        guard let left = node.left else {
            assertionFailure("left node is not nil")
            return
        }
        if let parent = node.parent {
            left.parent = parent
            if parent.left === node {
                parent.left = left
            } else {
                parent.right = left
            }
        } else {
            // node is root
            left.parent = nil
            // update root
            root = left
        }
        left.right?.parent = node
        node.left = left.right
        node.parent = left
        left.right = node
    }
    // 插入key
    func insert(_ key: Int){
        var cursor = root
        var parent = cursor?.parent
        while cursor != nil {
            if cursor!.key == key {
                assertionFailure("\(key) already exist.")
            }
            parent = cursor
            if cursor!.key > key {
                cursor = cursor!.left
            }else {
                cursor = cursor!.right
            }
        }
        guard let notNilParent = parent else{
            assertionFailure("parent is not nil")
            return
        }
        let node = RBTreeNode.init(key: key)
        node.color = .Red
        if notNilParent.key > key {
            notNilParent.left = node
            node.parent = notNilParent
        }else {
            notNilParent.right = node
            node.parent = notNilParent
        }
        size = size + 1
        fixInsert(node)
    }
    
    //删除key
    func delete(_ key:Int, _ tree: RBTreeNode?) -> Bool{
        guard let node = self.search(key, tree) else {
            return false
        }
        if node.left == nil && node.right == nil {
            guard let parent = node.parent else {
                assertionFailure("delete the root node")
                return false
            }
            if parent.left === node {
                parent.left = nil
            }else {
                parent.right = nil
            }
            if node.color != RBTreeNodeColor.Red {
                fixDelete(nil, parent)
            }
            size = size - 1
        }else if (node.left != nil) != (node.right != nil) {
            // 只有一个子树
            let substitute = node.left == nil ? node.right! : node.left!
            node.key = substitute.key
            node.left = nil
            node.right = nil
            if !node.isRed() && !substitute.isRed() {
                // 待删节点是黑，子节点也是黑
                print("error")
                fixDelete(node, node.parent)
            }else if node.isRed() && !substitute.isRed() {
                // 待删节点是红，子节点是黑
                node.color = .Black
            }
            size = size - 1
        }else {
            // 有两个子树
            if let substitute = findPredeccessor(node) {
                node.key = substitute.key
                _ = self.delete(substitute.key, substitute)
            }
        }
        return true
    }
    
    // 插入节点后的修复
    private func fixInsert(_ node:RBTreeNode) {
        guard let parent = node.parent else {
            // 根节点
            if node.isRed() {
                node.color = .Black
            }
            return
        }
        if !parent.isRed() {
            // 父节点为黑
            return
        }
        
        let uncle = getUncle(node)
        if uncle != nil && uncle!.isRed() {
            //状态：父红，叔红
            
            // 改变状态： 父黑，叔黑，爷红
            parent.color = .Black
            uncle!.color = .Black
            parent.parent!.color = .Red
            fixInsert(parent.parent!)
            return
        }
        
        // 这里叔节点必然为空
        if uncle != nil {
            assertionFailure("uncle must be nil")
        }
        
        if uncle == nil || !uncle!.isRed(){
            // 叔为空 || 叔为黑
            // 父红，叔黑
            guard let grandpa = parent.parent else {
                return
            }
            
            if parent.left === node {
                if grandpa.left === parent {
                    // 左左 --> 父黑爷红， 爷右旋
                    grandpa.color = .Red
                    parent.color = .Black
                    rightRotate(grandpa)
                    return
                }
                if grandpa.right === parent {
                    // 右左 -> 父右旋 -> 回到右右
                    rightRotate(parent)
                    fixInsert(parent)
                    return
                }
            }
            if parent.right === node {
                if grandpa.left === parent {
                    // 左右 -> 父左旋 -> 回到左左
                    leftRotate(parent)
                    fixInsert(parent)
                    return
                }
                if grandpa.right === parent {
                    // 右右 --> 父黑爷红， 爷左旋
                    grandpa.color = .Red
                    parent.color = .Black
                    leftRotate(grandpa)
                    return
                }
            }
        }
    }
    
    // 删除节点后的修复
    private func fixDelete(_ node: RBTreeNode?, _ parent: RBTreeNode?) {
        guard let parent = parent, let sibling = parent.left === node ? parent.right : parent.left else {
            return
        }
        // 如果兄弟节点是红色
        if sibling.isRed() {
            //2-c. 待删除节点是黑色，父节点是黑色，兄弟是红色-> 父红兄黑，待删节点是左子树父左旋，否则右旋，结果到2-b
            parent.color = .Red
            sibling.color = .Black
            if parent.left === sibling {
                rightRotate(parent)
            }else {
                leftRotate(parent)
            }
            fixDelete(node, parent)
        }else {
            // 兄弟节点是黑色
            if (sibling.left == nil || !sibling.left!.isRed()) && (sibling.right == nil || !sibling.right!.isRed()) {
                // 兄弟的孩子都是黑
                // 2-g. 兄弟是黑色，兄弟的孩子也都是黑色 -> 兄弟变红色，父如果是红变黑，父如果是黑到2-c
                sibling.color = .Red
                if parent.isRed() {
                    parent.color = .Black
                }else {
                    fixDelete(parent, parent.parent)
                }
            }else if parent.left === sibling && sibling.right?.isRed() == true && (sibling.left == nil || !sibling.left!.isRed()) {
                // 近侄儿是红色
                // 2-e. 待删除节点是黑色， 兄弟是黑色，近侄子是红色 -> 兄弟红色，近侄子黑色，兄弟左旋或右旋，结果到2-d
                sibling.color = .Red
                sibling.right?.color = .Black
                leftRotate(sibling)
                fixDelete(node, parent)
            }else if parent.right === sibling && sibling.left?.isRed() == true && (sibling.right == nil || !sibling.right!.isRed()) {
                // 近侄儿是红色
                // 2-e. 待删除节点是黑色， 兄弟是黑色，近侄子是红色 -> 兄弟红色，近侄子黑色，兄弟左旋或右旋，结果到2-d
                sibling.color = .Red
                sibling.left?.color = .Black
                rightRotate(sibling)
                fixDelete(node, parent)
            }else if parent.left === sibling && sibling.left != nil && sibling.left!.isRed() {
                // 2-d. 待删除节点是黑色， 兄弟是黑色，远侄子是红色 -> 交换父和兄弟的颜色，远侄子为黑色，在对父节点做左旋或右旋，待删节点删除
                sibling.color = parent.color
                parent.color = .Black
                sibling.left!.color = .Black
                rightRotate(parent)
            }else if parent.right === sibling && sibling.right != nil && sibling.right!.isRed() {
                sibling.color = parent.color
                parent.color = .Black
                sibling.right!.color = .Black
                leftRotate(parent)
            }
        }
    }
    
    // 找前驱节点
    private func findPredeccessor(_ node: RBTreeNode) -> RBTreeNode? {
        var cursor = node.left
        if cursor == nil {
            return nil
        }
        
        while cursor!.right != nil {
            cursor = cursor!.right
        }
        return cursor
    }
}


extension RBTree {
    // 获取兄弟
    private func getSibling(_ node: RBTreeNode) -> RBTreeNode?{
        guard let parent = node.parent else {
            return nil
        }
        if parent.left === node {
            return parent.right
        }else {
            return parent.left
        }
    }
    
    private func getUncle(_ node: RBTreeNode) -> RBTreeNode? {
        guard let parent = node.parent, let ancestor = parent.parent else {
            return nil
        }
        if ancestor.left === parent {
            return ancestor.right
        }else {
            return ancestor.left
        }
    }
}
