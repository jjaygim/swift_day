//
//  penHolder.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class PenHolder {
    private var pens: [CXPen]
    private var usage: Double
    private let capacity : Double
    
    init(withcapacity: Double) {
        pens = [CXPen]()
        usage = Double()
        capacity = withcapacity
    }
    func add(pen: CXPen) {
        pens.append(pen)
    }
    func remove(penIndex: Int) {
        pens.remove(at: penIndex)
    }
    func penHolderUsage() -> Double {
        usage = Double(pens.count) / capacity * 100
        return usage
    }
    func printDescription() {
        //let panList = pens.map{ String($0) }
        print("*보유중인 팬*")
        for i in pens {
            i.printDescription()
        }
        print("*팬 수*", pens.count,"개")
        print("*필통 사용량* ",penHolderUsage(),"%")
    }
}
