//
//  BellmanFord.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/4.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 顶点
public struct Vertex<T: Hashable>: Equatable {
    var data: T
    var indexInMatrix: Int
}

// 边
//public struct Edge<T:Hashable>: Equatable {
//    var vertexFrom: Vertex<T>   // 入度点
//    var vertexTo: Vertex<T>   // 入度点
//    var weight: Double?         // 权值
//}






