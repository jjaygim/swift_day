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
    
    init() {
        stocks = [Beverage]()
        cash = Int()
        stocksDict = [String:Int]()
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
    

