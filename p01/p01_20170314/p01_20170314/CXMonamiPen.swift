//
//  CXMonamiPen.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 15..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

//
//  CXPen.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class CXPen2: CustomStringConvertible {
    fileprivate var brand: String
    fileprivate var color: String
    fileprivate var usage: Double
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

class CXMonamiPen: CXPen2 {
    private var model: String
    init(withModel: String) {
        model = withModel
        super.init(withBrand: "Monami")
    }
    override func printDescription() {
            print("BRAND: ", getBrand(), "MODEL: ", model, "/ COLOR: ", getColor(), "/ USAGE: ", getUsage(),"%")
    }
}

class CXMonamiRedPen: CXMonamiPen {
    init() {
        super.init(withModel: "MNM-Red")
        setColor("RED")  //?? 겟함수는 수퍼가 필요한데 셋함수는 수퍼가 필요없는 이유? 구현상속?
    }
    override func printDescription() {
        super.printDescription()
    }
}

class CXMonamiBluePen: CXMonamiPen {
    init() {
        super.init(withModel: "MNM-Blue")
        setColor("BLUE")  //?? 겟함수는 수퍼가 필요한데 셋함수는 수퍼가 필요없는 이유? 구현상속?
    }
    override func printDescription() {
        super.printDescription()
    }
}

class CXMonamiBlackPen: CXMonamiPen {
    init(withusage: Int) {
        super.init(withModel: "MNM-Black")
        setColor("BLACK")  //?? 겟함수는 수퍼가 필요한데 셋함수는 수퍼가 필요없는 이유? 구현상속?
    }
    convenience init() {
        self.init(withusage: 0)  //??
    }
    override func printDescription() {
        super.printDescription()
    }
}

class CXSharpPen: CXPen2 {
    private var model: String
    init(withModel: String) {
        model = withModel
        super.init(withBrand: "Sharp")
    }
    override func printDescription() {
        super.printDescription()
        print("MODEL: \(model)")
    }
}
