//
//  VendingMachine.swift
//  p02_VendingMachine_20170316
//
//  Created by 김재정 on 2017. 3. 18..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class VendingMachine : NSObject, NSCoding {

    private var vcCash: Int  //자판기에 들어간 돈
    private var stocksDict: [String: Int]  //재고(세팅) 딕셔너리
    private var brandPrice: [String: Int]  //브랜드 별 가격 정리된 딕셔너리 (얘도 저장을 해야할거 같음)
    //private var purchaseDict: [String: Int]  //구매리스트 딕셔너리  //잔액, 재고 고려하여 구매가능한 딕셔너리
    private var purchaseList: [[String: Int]]  //구매리스트 어레이
    
    override init() {
        vcCash = Int()
        stocksDict = [String:Int]()
        brandPrice = [String: Int]()
        //purchaseDict = [String: Int]()
        purchaseList = [[String: Int]]()
    }
    
    required init?(coder aDecoder: NSCoder) {  //압출풀기
        vcCash = aDecoder.decodeInteger(forKey: "vsCash")
        stocksDict = aDecoder.decodeObject(forKey: "stocksDict") as! [String : Int]
        brandPrice = aDecoder.decodeObject(forKey: "brandPrice") as! [String : Int]
        //purchaseDict = aDecoder.decodeObject(forKey: "availableList") as! [String : Int]
        purchaseList = aDecoder.decodeObject(forKey: "purchaseList") as! [[String : Int]]
    }
    
    func encode(with aCoder: NSCoder) {  //압축하기
        aCoder.encode(vcCash, forKey: "vcCash")
        aCoder.encode(stocksDict, forKey: "stocksDict")
        aCoder.encode(brandPrice, forKey: "brandPrice")
        //aCoder.encode(purchaseDict, forKey: "availableList")
        aCoder.encode(purchaseList, forKey: "purchaseList")
    }
    
    //유저디폴트에는 클래스 인스턴스를 저장하는 방법이 없다 그래서 아카이빙이 필요함 데이터 형식으로 변환-앤에스코딩을 구현
    
    //UserDefaults 데이터 로드해서 프로퍼티에 저장
    func loadDate2(dict: [String:Int]) {
        stocksDict = dict
    }
    
    func setBeverage(_ beverage: Beverage) {
        if let key = stocksDict[beverage.getBrand()] {
            stocksDict[beverage.getBrand()] = key + 1
        } else {
            stocksDict[beverage.getBrand()] = 1
        }
        
        if brandPrice[beverage.getBrand()] == nil {
            brandPrice[beverage.getBrand()] = beverage.getPrice()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil, userInfo: getAllStocks())
    }
    
    func getAllStocks() -> [String:Int] {
        return stocksDict
    }
    
    func countBeverage(_ brand: String) -> Int {
        if let beverCount = stocksDict[brand] {
            return beverCount
        }
        else {
            return 0
        }
    }
    
    
    //    - 금액을 입력하면 구매가능한 음료 목록을 리턴하는 함수
    func purchableList(_ coin: Int) -> [String : String] {
        vcCash = coin
        var result = [String : String]()
        for (key, value) in brandPrice {
            if coin >= value {
                result[key] = "\(value)원"
            }
        }
        return result
    }
    
    //    - 특정 음료를 구매하면 잔액을 리턴하는 함수
    func buyBeverage(_ beverage: Beverage) -> String {
        // 잔액
        for (key, val) in brandPrice {
            var purchaseDict = [String: Int]()
            if beverage.getBrand() == key {
                if vcCash >= val {
                    if let stock = stocksDict[beverage.getBrand()] {
                        purchaseDict[beverage.getBrand()] = val
                        purchaseList.append(purchaseDict)
                        vcCash -= val
                        stocksDict[beverage.getBrand()] = stock - 1
                    }
                    else {
                        print("재고가 없습니다")
                    }
                }
                else {
                    print("잔액이 부족합니다")
                }
            }
        }
        // 재고관리
        if stocksDict[beverage.getBrand()] == 0 {  //재고가 0이면 키삭제??
            stocksDict.removeValue(forKey: beverage.getBrand())
        }
        return "남은 잔액은 \(vcCash)원입니다"
    }
    
    //    - 실행 이후 구매한 음료 이름과 금액을 사전으로 추상화(buyBeverage() - purchaseDict)하고 전체 구매 목록을 배열로 리턴하는 함수
    func getPurchaseArr() -> [[String: Int]] {  //실행 이후? 유저디폴트 ㅇ (아카이브 할 때는purchaseList를 저장하지 말아야 하나)
        return purchaseList
    }
    
    
    
    
    
    
    
    /*
     
     //private var stocks: [Beverage]
     //private var stocks2: [String:[Beverage]]
     //private var balance: Int
     //private var sellLog: (Int, [Any])
     
     //stocks = [Beverage]()
     //stocks2 = [String:[Beverage]]()  //키 타입 애니도안됨
     //balance = Int()  //0
     //sellLog = (0, [Any]())
     
     
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
     */
    
    /*
     
     
     
     /*
     //UserDefaults 데이터 저장
     func saveData() {
     let ud = UserDefaults.standard
     ud.set(stocksDict, forKey: "name")
     print("va save: ", stocksDict)
     }
     
     //UserDefaults 데이터 로드
     func loadDate() {
     let ld = UserDefaults.standard.dictionary(forKey: "name") as? [String: Int]
     if let a = ld {
     stocksDict = a
     print("va load: ", stocksDict)
     }
     }
     */
     
     
     func add(_ beverage: Beverage) {
     stocks.append(beverage)
     
     var tempDict = [String:Int]()
     for item in getNamesOfStocks() {
     let filtered: [Beverage] = stocks.filter { $0.getBrand() == item }
     tempDict[filtered[0].getBrand()] = filtered.count
     }
     stocksDict = tempDict
     
     //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil, userInfo: getAllStocks())
     
     //디폴트는 싱글톤
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
     
     func getAvailable(price: Int) -> [String] {
     var tempArray = [String]()
     for item in getNamesOfStocks() {
     if getBeveragePrice(name: item) <= price {
     tempArray.append(item)
     }
     }
     return tempArray
     }
     
     func buy(name: String, inputPrice: Int, amount: Int) {
     if getAvailable(price: inputPrice).contains(name) != false {
     return
     }
     if getBeveragePrice(name: name) * amount > inputPrice {
     return
     }
     }
     
     
     
     func setStock(stored: [String:Int]) {
     var temp = [String:[Beverage]]()
     let beverClass: Beverage = Beverage()
     for (key, value) in stored {
     var tempArray = [Beverage]()
     for _ in 1...value {
     let bever = beverClass.getBrand(key)
     tempArray.append(bever)
     }
     temp[key] = tempArray
     }
     stocks = temp
     }
     
     */

}


