//
//  Solution721.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 并查集
class Solution721 {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var res:[[String]] = accounts
        
        var uf = UnionFind.init(accounts.count)
        var dic:[String: Int] = Dictionary()
        for i in 0..<accounts.count {
            for j in 1..<accounts[i].count {
                if dic[accounts[i][j]] == nil {
                    dic[accounts[i][j]] = i
                }else {
                    uf.union(dic[accounts[i][j]]!, i)
                }
            }
        }
        
        for i in (0..<accounts.count) {
            let index = uf.find(i)
            if index == i {
                res[index] = Set(res[index]).sorted()
                continue
            }else {
                res[index].append(contentsOf: accounts[i][1..<accounts[i].count])
                res[i].removeAll()
            }
        }
        res = res.filter{$0.count > 0}.map{Set($0).sorted()}
        return res
    }
    
    func test() {
        print(accountsMerge([["Alex","Alex5@m.co","Alex4@m.co","Alex0@m.co"],["Ethan","Ethan3@m.co","Ethan3@m.co","Ethan0@m.co"],["Kevin","Kevin4@m.co","Kevin2@m.co","Kevin2@m.co"],["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe2@m.co"],["Gabe","Gabe3@m.co","Gabe4@m.co","Gabe2@m.co"]]))
        
        print(accountsMerge([["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]))
        
//        [["Alex","Alex5@m.co","Alex4@m.co","Alex0@m.co"],["Ethan","Ethan3@m.co","Ethan3@m.co","Ethan0@m.co"],["Kevin","Kevin4@m.co","Kevin2@m.co","Kevin2@m.co"],["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe2@m.co"],["Gabe","Gabe3@m.co","Gabe4@m.co","Gabe2@m.co"]]
//
//        [["Alex","Alex0@m.co","Alex4@m.co","Alex5@m.co"],["Ethan","Ethan0@m.co","Ethan3@m.co","Ethan3@m.co"],["Kevin","Kevin2@m.co","Kevin2@m.co","Kevin4@m.co"],["Gabe","Gabe0@m.co","Gabe2@m.co","Gabe3@m.co","Gabe4@m.co"]]
//
//        [["Alex","Alex0@m.co","Alex4@m.co","Alex5@m.co"],["Ethan","Ethan0@m.co","Ethan3@m.co"],["Gabe","Gabe0@m.co","Gabe2@m.co","Gabe3@m.co","Gabe4@m.co"],["Kevin","Kevin2@m.co","Kevin4@m.co"]]
    }
}
