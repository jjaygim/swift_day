//: Playground - noun: a place where people can play

import UIKit

class Beverage: Equatable {
    var ice: Bool
    //var kindArr: Array<String>
    var company: String
    var capacity: Int
    var price: Int
    var brand: String
    var expiry: Date
    
    init(withIce: Bool) {
        ice = withIce
        //kindArr = ["SPARKLING", "ENERGY", "JUICE", "TEA", "COFFEE", "MILK", "WATER"]
        company = String()
        capacity = Int()
        price = Int()
        brand = String()
        expiry = Date()
    }
    
    static func == (lhs: Beverage , rhs: Beverage) -> Bool {
        return
            lhs.getBrand() == rhs.getBrand() &&
                lhs.getCapacity() == rhs.getCapacity() &&
                lhs.getCompany() == rhs.getCompany() &&
                lhs.getExpiry() == rhs.getExpiry() &&
                lhs.getPrice() == rhs.getPrice()
    }
    
    func getCompany() -> String {
        return company
    }
    func getCapacity() -> Int {
        return capacity
    }
    func getPrice() -> Int {
        return price
    }
    func getBrand() -> String {
        return brand
    }
    func getExpiry() -> Date {
        return expiry
    }
    
    func setCompany(_ 제조사: String) {
        company = 제조사
    }
    func setCapacity(_ 용량: Int) {
        capacity = 용량
    }
    func setPrice(_ 가격: Int) {
        price = 가격
    }
    func setBrand(_ 이름: String) {
        brand = 이름
    }
    func setExpiry(_ 유통기한: Date) {
        expiry = 유통기한
    }
}

class ColdBeverage: Beverage {
    var kind: String
    var addPrice: Int
    
    init(kindOf: String) {
        kind = kindOf
        addPrice = 100
        super.init(withIce: true)
    }
    
    override func setPrice(_ 가격: Int) {
        price = 가격 + addPrice
    }
}

class SparklingColdBeverage: ColdBeverage {
    init() {
        super.init(kindOf: "SPARKLING")
        setBrand("Coke")
        setPrice(800)
        setCompany("Cocacola")
        setExpiry(Date(timeInterval: 30000, since: Date()))
    }
}

class JuiceColdBerverage: ColdBeverage {
    init() {
        super.init(kindOf: "JUICE")
        setBrand("Applejuice")
        setPrice(2000)
        setCompany("Gold Medal")
        setExpiry(Date(timeInterval: 10000, since: Date()))
    }
}

class CoffeeColdBeverage: ColdBeverage {
    init() {
        super.init(kindOf: "COFFEE")
        setBrand("Americano")
        setPrice(1000)
        setCompany("Coffe Bean")
        setExpiry(Date(timeInterval: 20000, since: Date()))
    }
    override func setBrand(_ 이름: String) {
        brand = "ICE " + 이름
    }
}

class HotBeverage: Beverage {
    var kind: String
    
    init(kindOf: String) {
        kind = kindOf
        super.init(withIce: false)
    }
}

class TeaHotBeverage: HotBeverage {
    init() {
        super.init(kindOf: "TEA")
        setBrand("Peppermint")
        setPrice(1200)
        setCompany("Lipton")
        setExpiry(Date(timeInterval: 15000, since: Date()))
    }
}

class CoffeeHotBeverage: HotBeverage {
    init() {
        super.init(kindOf: "COFFEE")
        setBrand("Americano")
        setPrice(1000)
        setCompany("Coffe Bean")
        setExpiry(Date(timeInterval: 20000, since: Date()))
    }
}

class MilkHotBeverage: HotBeverage {
    init() {
        super.init(kindOf: "MILK")
        setBrand("Milktea")
        setPrice(1500)
        setCompany("Gongcha")
        setExpiry(Date(timeInterval: 5000, since: Date()))
    }
}

private let coke = SparklingColdBeverage()
private let appleJuice = JuiceColdBerverage()
private let iceAmericano = CoffeeColdBeverage()
private let peppermint = TeaHotBeverage()
private let americano = CoffeeHotBeverage()
private let milkTea = MilkHotBeverage()

print(iceAmericano == americano)

func test() {
    if coke == milkTea {
        print("같다")
    }
    else {
        print("다르다")
    }
}
test()
