//
//  AppDelegate.swift
//  MyVending_20170320
//
//  Created by 김재정 on 2017. 3. 20..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 
//    var stock = [String:Int]()
//    let ud = UserDefaults.standard
//    var save = [String:Int]()
 

//    func application(_ application: UIApplication, willFinishLanchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        return false
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //print(#file, #line, #function)
        //print("save : \(save)")
        
        print(#function)
        let vc = window?.rootViewController as! ViewController
        //vc.loadDataIn(save)//********************************************************
        //print("애플리케이션 로드: ", vc.loadDataIn())
        if let machine = UserDefaults.standard.object(forKey: "machine") as? Data {
            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: machine) as? VendingMachine {
                vc.setMachine(machine: unarch)
            }
        }
        /*
        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? [String:Int] {
            if stocks.count != 0 {
                print("application", stocks)
                //vc.setStocks(stocks: stocks)
            }
        }
         */
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        print(#function)
        //let vc = window?.rootViewController as! ViewController
        //vc.saveDataIn()********************************************************
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //let vc = self.window?.rootViewController as! ViewController
        /*
         let vc = window?.rootViewController as! ViewController
        let stocks = vc.getStocks()
        UserDefaults.standard.set(stocks, forKey: "stocks")
        print("applicationDidEnterBackground")
        */
        
        //var stock = [String:Int]()
        //vc.myMachine.add(vc.appleJuice)
        //stock = vc.myMachine.getAllStocks()
        
        //let ud = UserDefaults.standard
        //ud.set(stock, forKey: "stock")  // 저장되는 문장
        //save = UserDefaults.standard.value(forKey: "stock")
        //let save = UserDefaults.standard.value(forKey: "stock")  // 저장된거 확인하는 문장 (save변수에 저장)
        //print("save : \(save)")
        
        print(#function)
        let vc = window?.rootViewController as! ViewController
        //vc.saveDataIn()********************************************************
        //let ud = UserDefaults.standard
        //ud.set(vc.myMachine.getAllStocks() , forKey: "name")
        //save = UserDefaults.standard.dictionary(forKey: "name") as! [String : Int]
        //print("백그라운드 세이브: ", vc.saveDataIn())
        let machine = vc.getMachine()
        let dataOfMachine: Data = NSKeyedArchiver.archivedData(withRootObject: machine)
        UserDefaults.standard.set(dataOfMachine, forKey: "machine")
    }
    
    //홈(백그라운드)갔다가 다시 로드될 때 포어그라운드
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
        print(#function)
        let vc = window?.rootViewController as! ViewController
        //vc.loadDataIn()********************************************************
        if let machine = UserDefaults.standard.object(forKey: "machine") as? Data {
            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: machine) as? VendingMachine {
                vc.setMachine(machine: unarch)
            }
        }
        /*
         if let stocks = UserDefaults.standard.object(forKey: "stocks") as? [String:Int] {
         if stocks.count != 0 {
         //vc.setStocks(stocks: stocks)
         }
         }
         */
        //let vc = window?.rootViewController as! ViewController
    }
    
    //새로 켜면(터미네이트되고 재실행) 비컴액티브
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print(#function)
        let vc = window?.rootViewController as! ViewController
        //vc.loadDataIn()********************************************************
        //print("액티브 로드: ", vc.loadDataIn())
        if let machine = UserDefaults.standard.object(forKey: "machine") as? Data {
            if let unarch = NSKeyedUnarchiver.unarchiveObject(with: machine) as? VendingMachine {
                vc.setMachine(machine: unarch)
            }
        }

        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print(#function)
        //let vc = window?.rootViewController as! ViewController
        //vc.saveDataIn()********************************************************
        
    }


}

