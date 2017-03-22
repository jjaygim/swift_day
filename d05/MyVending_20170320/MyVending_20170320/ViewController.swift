//
//  ViewController.swift
//  MyVending_20170320
//
//  Created by 김재정 on 2017. 3. 20..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myMachine = VendingMachine()
    
    private let coke = SparklingColdBeverage()
    private let appleJuice = JuiceColdBerverage()
    private let iceAmericano = CoffeeColdBeverage()
    private let peppermint = TeaHotBeverage()
    private let americano = CoffeeHotBeverage()
    private let milkTea = MilkHotBeverage()
    
    @IBOutlet weak var cokeLabel: UILabel!
    @IBOutlet weak var appleJuiceLabel: UILabel!
    @IBOutlet weak var iceAmericanoLabel: UILabel!
    @IBOutlet weak var peppermintLabel: UILabel!
    @IBOutlet weak var americanoLabel: UILabel!
    @IBOutlet weak var milkTeaLabel: UILabel!
    
    @IBOutlet weak var cokeQuantityLabel: UILabel!
    @IBOutlet weak var appleJuiceQuantityLabel: UILabel!
    @IBOutlet weak var iceAmericanoQuantityLabel: UILabel!
    @IBOutlet weak var peppermintQuantityLabel: UILabel!
    @IBOutlet weak var americanoQuantityLabel: UILabel!
    @IBOutlet weak var milkTeaQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cokeLabel.text = coke.getBrand()
        appleJuiceLabel.text = appleJuice.getBrand()
        iceAmericanoLabel.text = iceAmericano.getBrand()
        peppermintLabel.text = peppermint.getBrand()
        americanoLabel.text = americano.getBrand()
        milkTeaLabel.text = milkTea.getBrand()
        
        cokeQuantityLabel.text = String(myMachine.countBeverage(coke.getBrand()))
        appleJuiceQuantityLabel.text = String(myMachine.countBeverage(appleJuice.getBrand()))
        iceAmericanoQuantityLabel.text = String(myMachine.countBeverage(iceAmericano.getBrand()))
        peppermintQuantityLabel.text = String(myMachine.countBeverage(peppermint.getBrand()))
        americanoQuantityLabel.text = String(myMachine.countBeverage(americano.getBrand()))
        milkTeaQuantityLabel.text = String(myMachine.countBeverage(milkTea.getBrand()))
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadList), name: NSNotification.Name(rawValue: "reload"), object: nil)
        let saveLabel = Notification(name: Notification.Name("stock"), object: nil, userInfo: myMachine.getAllStocks())
        reloadList(notification: saveLabel)
        
        //print(iceAmericano == americano)
        //print("뷰디드로드 겟올스탁:", myMachine.getAllStocks())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func test() {
//        if coke == milkTea {
//            print("같다")
//        }
//        else {
//            print("다르다")
//        }
//    }
    
    func reloadList(notification: Notification) {
        let stocks = notification.userInfo!
        DispatchQueue.main.async {
            if let coke = stocks["Coke"] {
            self.cokeQuantityLabel.text = String(describing: coke)
            }
            if let apple = stocks["Applejuice"] {
                self.appleJuiceQuantityLabel.text = String(describing: apple)
            }
            if let iceAme = stocks["ICE Americano"] {
                self.iceAmericanoQuantityLabel.text = String(describing: iceAme)
            }
            if let pepper = stocks["Peppermint"] {
                self.peppermintQuantityLabel.text = String(describing: pepper)
            }
            if let ame = stocks["Americano"] {
                self.americanoQuantityLabel.text = String(describing: ame)
            }
            if let milk = stocks["Milktea"] {
                self.milkTeaQuantityLabel.text = String(describing: milk)
            }
            
            /*
            self.cokeQuantityLabel.text = String(self.myMachine.countBeverage(self.coke.getBrand()))
            self.appleJuiceQuantityLabel.text = String(self.myMachine.countBeverage(self.appleJuice.getBrand()))
            self.iceAmericanoQuantityLabel.text = String(self.myMachine.countBeverage(self.iceAmericano.getBrand()))
            self.peppermintQuantityLabel.text = String(self.myMachine.countBeverage(self.peppermint.getBrand()))
            self.americanoQuantityLabel.text = String(self.myMachine.countBeverage(self.americano.getBrand()))
            self.milkTeaQuantityLabel.text = String(self.myMachine.countBeverage(self.milkTea.getBrand()))
            */
        }
        /*
        self.cokeQuantityLabel.reloadInputViews()
        self.appleJuiceQuantityLabel.reloadInputViews()
        self.iceAmericanoQuantityLabel.reloadInputViews()
        self.peppermintQuantityLabel.reloadInputViews()
        self.americanoQuantityLabel.reloadInputViews()
        self.milkTeaQuantityLabel.reloadInputViews()
         */
    }
    
    //func getStocks() -> [String: Int] {
      //  return myMachine.getStockDict()
    //}
    
    func saveDataIn(){
        myMachine.saveData()
    }
    
    func loadDataIn(){
        myMachine.loadDate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCokeButton(_ sender: Any) {
        myMachine.setBeverage(coke)
        //print(myMachine.getAllStocks())
        //print(coke.getBrand(), myMachine.countBeverage(coke.getBrand()))
    }
    
    @IBAction func addAppleJuiceButton(_ sender: Any) {
        myMachine.setBeverage(appleJuice)
        //print(myMachine.getAllStocks())
        //print(appleJuice.getBrand(), myMachine.countBeverage(appleJuice.getBrand()))
    }
    
    @IBAction func addIceAmericanoButton(_ sender: Any) {
        myMachine.setBeverage(iceAmericano)
        //print(myMachine.getAllStocks())
        //print(iceAmericano.getBrand(), myMachine.countBeverage(iceAmericano.getBrand()))
    }

    @IBAction func addPeppermintButton(_ sender: Any) {
        myMachine.setBeverage(peppermint)
        //print(myMachine.getAllStocks())
        //print(peppermint.getBrand(), myMachine.countBeverage(peppermint.getBrand()))
    }
    
    @IBAction func addAmericanoButton(_ sender: Any) {
        myMachine.setBeverage(americano)
        //print(myMachine.getAllStocks())
        //print(americano.getBrand(), myMachine.countBeverage(americano.getBrand()))
    }
    
    @IBAction func addMilkTeaButton(_ sender: Any) {
        myMachine.setBeverage(milkTea)
        //print(myMachine.getAllStocks())
        //print(milkTea.getBrand(), myMachine.countBeverage(milkTea.getBrand()))
    }

}

