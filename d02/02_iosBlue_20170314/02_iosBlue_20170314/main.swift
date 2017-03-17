//
//  main.swift
//  02_iosBlue_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation


let rect1 = MyRect.init()
print(rect1)

var rect2 = MyRect(origin: CGPoint(x: 2, y: 7), width: 5, height: 3)
print(rect2)
rect2.moveTo(delta: CGPoint(x: -3, y: 1.5))
print(rect2)

var rectClass1 = MyRectClass(origin: CGPoint(x: 2, y: 7), width: 5, height: 3)
print(rectClass1)
rectClass1.moveTo(delta: CGPoint(x: -3, y: 1.5))
print(rectClass1)



