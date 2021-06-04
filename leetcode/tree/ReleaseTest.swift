//
//  ReleaseTest.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/4/21.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class RelaseTest {
    
    // test2
    func test2() {
        print("test2")
        var node1: ListNode? = ListNode(1)
        var node2:ListNode? = ListNode(2)
        node1?.next = node2
        node2?.next = node1
        
        node2 = nil
        print("test2_end")
    }
    
//     a->b->c
//     在test作用域内
//     a 引用计数是1，b是2， c是2
//     出了test作用域，a, b, c都执行一次release, 这个时候 a 引用计数是0， b 引用计数是1， c 引用计数是1
//     a 引用计数是0，执行dealloc，因为b是a的属性，dealloc初执行 b release
//     a 被释放掉了， b 引用计数是0， c 引用计数是1
//     b 执行dealloc，因为c是b的属性，dealloc初执行 c release
//     b 被释放掉了，c 引用计数是0，后c 被释放掉
//    
//     dealloc 内部实现应该是这样，对持有的属性执行release
//     a
//     propert next
//    - (void)dealloc {
//      [next release];
//      [super dealloc];
//    }
    func test() {
        let c = ListNode(3);
        let b = ListNode(2);
        let a = ListNode(1);

        a.next = b;
        b.next = c;
    }
    
    public class func getProxyStatus() -> Bool {
        guard let dict = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? Dictionary<String, Any> else {
            return false
        }
        if dict[kCFNetworkProxiesHTTPProxy as String] != nil {
            print(dict)
            return true
        }
        return false
    }
}
