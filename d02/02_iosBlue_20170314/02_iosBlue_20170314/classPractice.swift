//
//  classPractice.swift
//  02_iosBlue_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class MyRectClass {
    var pointA: CGPoint
    var pointB: CGPoint
    var pointC: CGPoint
    var pointD: CGPoint
    init() {
        pointA = CGPoint(x: 0, y: 0)
        pointB = CGPoint(x: 0, y: 0)
        pointC = CGPoint(x: 0, y: 0)
        pointD = CGPoint(x: 0, y: 0)
    }
    //init(origin: CGPoint, width: CGFloat, height: CGFloat)  //CGFloat 타입
    init(origin: CGPoint, width: Double, height: Double){
        pointA = origin
        pointB = CGPoint(x: Double(origin.x), y: Double(origin.y) - height)  //CGRect -> Double 형변환
        pointC = CGPoint(x: origin.x + CGFloat(width), y: origin.y - CGFloat(height))  //Double -> CGFloat 형변환
        pointD = CGPoint(x: Double(origin.x) + width, y: Double(origin.y))
    }
    func moveTo(delta: CGPoint)  {
        pointA = CGPoint(x: delta.x + pointA.x, y: delta.y + pointA.y)
        pointB = CGPoint(x: delta.x + pointB.x, y: delta.y + pointB.y)
        pointC = CGPoint(x: delta.x + pointC.x, y: delta.y + pointC.y)
        pointD = CGPoint(x: delta.x + pointD.x, y: delta.y + pointD.y)
        
        //return pointA, pointB, pointC, pointD
    }
}
