//
//  VendingMachine.swift
//  p02_VendingMachine_20170316
//
//  Created by 김재정 on 2017. 3. 18..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stocks: [Beverage]
    private var cash: Int
    private var stocksDict: [String:Int]
    
    private var stocks2: [String:[Beverage]]
    private var balance: Int
    private var sellLog: (Int, [Any])
    
    init() {
        stocks = [Beverage]()
        cash = Int()
        stocksDict = [String:Int]()
        
        stocks2 = [String:[Beverage]]()  //키 타입 애니도안됨
        balance = Int()  //0
        sellLog = (0, [Any]())
    }
    
    //특정 음료수 추가
    func add2(_ beverage: Beverage) {
        if let number = stocks2[beverage.getBrand()] {
            if number.count > 0 {
                stocks2[beverage.getBrand()]!.append(beverage)
            }
        } else {
            var tempArr = [Beverage]()
            tempArr.append(beverage)
            stocks2[beverage.getBrand()] = tempArr
        }
    }
    
    //전체 음료수 재고
    func getStockDict() -> [String:Int] {
        var tempDict = [String:Int]()
        for (key, value) in stocks2 {
            tempDict[key] = value.count
        }
        return tempDict
    }
    
    //코인 추가(텍스트 필드)
    func insertCoin(_ coin: Int) {
        print("자판기에 투입할 금액을 입력하세요. |잔액 : \(balance)원|")
        let currentCoint = coin
        balance += currentCoint
    }
    
    //금액 입력시 구매 가능 음료수(버튼 활성화)
    func availableProduct(currentCoin : Int) -> [String:String] {
        var resultArray = [String:String]()
        for item in stocks2.keys {
            let filtering = stocks2[item]?.filter{$0.getPrice() <= currentCoin}
            if filtering?.isEmpty == false {  //품절
                resultArray[item] = "\(filtering![0].getPrice())원"
            }
        }
        return resultArray
    }
    
    //음료수 구매시 재고, 로그, 잔액
    func buyProduct(_ beverage: Beverage) {
        var logDic = [String:Int]()
        print("\(beverage.getBrand()) 1개를 구매하셨습니다.\n")
        stocks2[beverage.getBrand()]?.removeFirst() // 재고 처리
        
        // 로그 기록
        logDic[beverage.getBrand()] = beverage.getPrice()
        sellLog.0 += beverage.getPrice()
        sellLog.1.append(logDic)
        
        balance -= beverage.getPrice()  // 잔액 반영
    }
    
    //특정 음료수 재고
    func countBeverage2(_ beverage: Beverage) -> Int {
        if let beverCount = stocks2[beverage.getBrand()] {
            return beverCount.count  //빈 어레이 카운트 0인지 확인
        }
        else {
            return 0
        }
    }

    
    

    
    func add(_ beverage: Beverage) {
        stocks.append(beverage)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
    }
    
    func getNamesOfStocks() -> [String] {
        var tempSet = Set<String>()
        for item in stocks {
            tempSet.insert(item.getBrand())
        }
        return Array(tempSet)
    }
    
    func getBeveragePrice(name: String) -> Int {
        let filtered = stocks.filter { $0.getBrand() == name }
        return filtered[0].getPrice()
    }
    
    func getAllStocks() -> [String:Int] {
        var tempDict = [String:Int]()
        for item in getNamesOfStocks() {
            let filtered: [Beverage] = stocks.filter { $0.getBrand() == item }
            tempDict[filtered[0].getBrand()] = filtered.count
        }
        stocksDict = tempDict
        return tempDict
        
    }
    
    func getAvailable(price: Int) -> [String] {
        var tempArray = [String]()
        for item in getNamesOfStocks() {
            if getBeveragePrice(name: item) <= price {
                tempArray.append(item)
            }
        }
        return tempArray
    }
    
    func countBeverage(_ brand: String) -> Int {
        if let beverCount = stocksDict[brand] {
            return beverCount
        }
        else {
            return 0
        }
    }
    
    func buy(name: String, inputPrice: Int, amount: Int) {
        if getAvailable(price: inputPrice).contains(name) != false {
            return
        }
        if getBeveragePrice(name: name) * amount > inputPrice {
            return
        }
    }
}
    

