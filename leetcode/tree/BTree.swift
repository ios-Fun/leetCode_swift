//
//  BTree.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// B树 -- 建立后就是有序
// 提供方法： 增加，删除，查找，排序

// B+树（应用于操作系统和数据库系统中）：非叶子结点仅具有索引左右，信息存放在叶子结点中
// B-树（应用于文件系统中）：多路搜索树
// B树（二叉搜索树BST）
// 堆？
// 二叉堆？
// 字典树--前缀树
class BTree {
    // 根节点
    private var root: BTreeNode!
    
    // 度数
    private let t:Int!
    
    init (t:Int) {
        self.t = t < 3 ? 3 : t
        root = BTreeNode(t: self.t)
    }
    
    func sort() -> [Int] {
        return self.sort(node: self.root)
    }
    
    // 排序--只是遍历
    private func sort(node: BTreeNode) -> [Int] {
        if node.isLeaf {
            return node.keys
        }
        var list:[Int] = Array()
        let count = node.keys.count
        for i in 0..<count {
            list = list + self.sort(node: node.children[i])
            list.append(node.keys[i])
        }
        list = list + self.sort(node: node.children[count])
        return list
    }
    

    // 查找key
    func search(_ key: Int) -> (node:BTreeNode, keyLocation:Int)? {
        return self.search(node: self.root, key: key)
    }
    
    // 查找key
    private func search(node: BTreeNode, key:Int) -> (node:BTreeNode, keyLocation:Int)? {
        var i:Int = 0
        // 查看在哪个范围
        while(i < node.keys.count && key > node.keys[i]) {
            i  = i + 1
        }
        if (i < node.keys.count && key == node.keys[i]) {
            // 刚好在node的keys上
            return (node, i)
        }else if node.isLeaf {
            return nil
        }else {
            // 去孩子节点查找
            return self.search(node: node.children[i], key: key)
        }
    }
    
    // 插入key
    private func insert(key: Int) {
        if root.h == 1 {
            // 高度只有一层。 插入自己的keys列表
            root = self.insertLeaf(node: self.root, key: key)
        }else {
            if let root = self.insert(node: self.root, key: key){
                self.root = root
            }
        }
    }
    
    // node中插入数据key
    private func insert(node: BTreeNode, key: Int) -> BTreeNode? {
        if node.isLeaf {
            let leaf = self.insertLeaf(node: node, key: key)
            if leaf.h == 2 {
                // 已经有两层了
                return leaf
            }
            // 还是叶子结点
            return nil
        }else {
            // 先找到要插入的位置
            let index = self.insertIndex(node: node, key: key)
            // 插入到孩子节点
            if let child = self.insert(node: node.children[index], key: key) {
                // 最后插入到某个孩子（或子孙）的叶子结点上
                // 某个孩子有两层了
                node.keys.insert(child.keys[0], at: index)
                
                // 父node把子node的左右孩子添加进来
                node.children[index] = child.children[1]
                node.children.insert(child.children[0], at: index)
                if node.keys.count > 2 * t - 1 {
                    // 如果当前node 超过 2t-1 拆分 为 两个孩子的树
                    return self.splitChild(node: node)
                }
            }
        }
        return nil
    }
    
    // 叶子结点插入数据
    private func insertLeaf(node: BTreeNode, key:Int) ->BTreeNode {
        let index = self.insertIndex(node: node, key: key)
        node.keys.insert(key, at: index)
        // 最多2t-1
        if node.keys.count == 2 * t - 1 {
            return self.splitChild(node: node)
        }
        return node
    }
    
    // 寻找要插入的位置
    private func insertIndex(node: BTreeNode, key: Int) -> Int {
        let count = node.keys.count
        if count != 0 {
            // keys 数量不为空
            if key <= node.keys.first! {
                // 比头还小
                return 0
            }else if key >= node.keys.last! {
                return count
            }
            //中间 -- 有没有必要采用二分查找？
            for i in 1..<count {
                if node.keys[i-1] <= key && key <= node.keys[i] {
                    return i
                }
            }
        }
        // 为空时返回0
        return 0
    }
    
    // 删除key
    func delete(key: Int) {
        if self.root.keys.count == 0 {
            // 树为空
            return
        }
        let newRoot = self.delete(node: self.root, key: key)
        
        self.root = newRoot.keys.count != 0 || newRoot.isLeaf ? newRoot : newRoot.children.first!
    }
    
    // 删除key
    private func delete(node: BTreeNode, key: Int) ->BTreeNode {
        var node = node
        if node.isLeaf {
            // 是叶子结点
            for (index, value) in node.keys.enumerated() {
                if value == key {
                    // 在叶子结点中查找到了key, 直接删除
                    node.keys.remove(at: index)
                    break
                }
            }
        }else {
            // 非叶子结点 嵌套往下
            var index = -1
            let count = node.keys.count
            if key > node.keys.last! {
                // 去 最后 一个 child 中 找
                index = count
            }else {
                for i in 0..<count {
                    if node.keys[i] == key {
                        // 在非叶子结点中找到了key
                        // 把 [i] 和 [i+1] 的children合并为树
                        let bTree = self.mergeChild(left: node.children[i], right: node.children[i+1])
                        self.replaceNode(node: &node, index: i, bTree: bTree)
                        break
                    }else if key < node.keys[i] {
                        // 找到children
                        index = i
                        break
                    }
                }
            }
            // 嵌套返回
            if index != -1 {
                // 递归，去孩子节点中查找
                var bTree = self.delete(node: node.children[index], key: key)
                if bTree.keys.count == self.t - 2 {
                    //降key操作
                    let keyIndex = index == count ? index-1 : index
                    bTree = self.mergeKeyChild(left: node.children[keyIndex], key: node.keys[keyIndex], right: node.children[keyIndex+1])
                    self.replaceNode(node: &node, index: keyIndex, bTree: bTree)
                }
            }
        }
        return node
    }
    
    // B树替换节点中right，key，left
    private func replaceNode(node: inout BTreeNode, index: Int, bTree: BTreeNode) {
        if node.h == bTree.h {
            // 树高相同，替换 key, left, right
            node.keys[index] = bTree.keys[0]
            node.children[index] = bTree.children[0]
            node.children[index + 1] = bTree.children[1]
        }else {
            // 树高不同，替换left， 删除key和right
            node.keys.remove(at: index)
            node.children[index] = bTree
            node.children.remove(at: index+1)
        }
        
        // 是否需要合并
        if node.keys.count > 2 * t - 1 {
            node = self.splitChild(node: node)
        }
     }
    
    // left, key ,right 合并--
    //(left.key + key + right.key
    // left.children + right.children
    private func mergeKeyChild(left: BTreeNode, key: Int, right: BTreeNode) -> BTreeNode {
        left.keys.append(key)
        left.keys = left.keys + right.keys
        left.children = left.children + right.children
        if left.keys.count >= 2 * t - 1 {
            return self.splitChild(node: left)
        }
        return left
    }
    
    // 合并左右子节点
    private func mergeChild(left: BTreeNode, right: BTreeNode) -> BTreeNode {
        if left.isLeaf {
            left.keys = left.keys + right.keys
        }else {
            let bTree = self.mergeChild(left: left.children.last!, right: right.children.first!)
            left.children.removeLast()
            right.children.removeFirst()
            if bTree.h == left.h {
                left.keys.append(bTree.keys[0])
                left.children = left.children + bTree.children
            }else {
                left.children.append(bTree)
            }
            left.keys = left.keys + right.keys
            left.children = left.children + right.children
        }
        if left.children.count > 2 * t - 1{
            return self.splitChild(node: left)
        }
        return left
    }
    
    // 分裂节点成为一棵B树, 自身keys取中间mid，left节点的keys为[0, mid-1]
    // right的keys为[mid+1, count-1]
    private func splitChild(node: BTreeNode) ->BTreeNode {
        let split = node.keys.count / 2
        let r = BTreeNode(t: t)
        // r.isLeaf = false
        let rLeft = BTreeNode(t: t)
        let rRight = BTreeNode(t: t)
        r.h = node.h + 1
        rLeft.h = node.h
        rRight.h = node.h
        r.keys.append(node.keys[split])
        // rLeft.keys.append(contentsOf: node.keys)
        for i in 0..<split {
            // 左孩子key
            rLeft.keys.append(node.keys[i])
        }
        r.children.append(rLeft)
        for i in split+1..<node.keys.count {
            // 右孩子key
            rRight.keys.append(node.keys[i])
        }
        r.children.append(rRight)
        if node.children.count > self.t {
            for i in 0...split {
                rLeft.children.append(node.children[i])
            }
            
            for i in split+1..<node.children.count {
                rRight.children.append(node.children[i])
            }
        }
        return r
    }
    
    func test() {
        var list = Array<Int>()
        let count = 100
        for i in 1..<count {
            list.append(Int(arc4random())%count)
        }
        // let listSort = list.sorted()
        let bTree = BTree(t: 4)
        for value in list {
            bTree.insert(key: value)
        }
        
        print(bTree.sort())
        
        // 查找
        if let searchIndex = bTree.search(50) {
            print("searchIndex:", searchIndex)
            bTree.delete(key: 50)
        }else {
            bTree.insert(key: 50)
        }
        print(bTree.sort())
        
        print("aaa")
    }
}
