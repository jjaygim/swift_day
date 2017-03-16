//
//  CXPen.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class CXPen {
    private var brand: String
    private var color: String
    private var usage: Double
    init(withBrand: String){
        brand = withBrand
        color = String()
        usage = Double()
    }
    public func getBrand() -> String {
        return brand
    }
    public func getColor() -> String {
        return color
    }
    public func getUsage() -> Double {
        return usage
    }
    public func setBrand(_ sb: String) {
        brand = sb
    }
    public func setColor(_ sc: String) {
        color = sc
    }
    public func setUsage(_ su: Double) {
        usage = su
    }
    public func printDescription()  //컴퓨티드 프로퍼티
    {
        print("BRAND: ", getBrand(), "/ COLOR: ", getColor(), "/ USAGE: ", getUsage(),"%")
    }
    var description: String {
        return "CXPen description : brand=\(brand)"
    }
}


