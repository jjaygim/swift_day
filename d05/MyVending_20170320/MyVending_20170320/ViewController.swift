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
        //print(myMachine.getAllStocks())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reloadList() {
        
        cokeQuantityLabel.text = String(myMachine.countBeverage(coke.getBrand()))
        appleJuiceQuantityLabel.text = String(myMachine.countBeverage(appleJuice.getBrand()))
        iceAmericanoQuantityLabel.text = String(myMachine.countBeverage(iceAmericano.getBrand()))
        peppermintQuantityLabel.text = String(myMachine.countBeverage(peppermint.getBrand()))
        americanoQuantityLabel.text = String(myMachine.countBeverage(americano.getBrand()))
        milkTeaQuantityLabel.text = String(myMachine.countBeverage(milkTea.getBrand()))
        /*
        self.cokeQuantityLabel.reloadInputViews()
        self.appleJuiceQuantityLabel.reloadInputViews()
        self.iceAmericanoQuantityLabel.reloadInputViews()
        self.peppermintQuantityLabel.reloadInputViews()
        self.americanoQuantityLabel.reloadInputViews()
        self.milkTeaQuantityLabel.reloadInputViews()
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCokeButton(_ sender: Any) {
        myMachine.add(coke)
        print(myMachine.getAllStocks())
        print(coke.getBrand(), myMachine.countBeverage(coke.getBrand()))
    }
    
    @IBAction func addAppleJuiceButton(_ sender: Any) {
        myMachine.add(appleJuice)
        print(myMachine.getAllStocks())
        print(appleJuice.getBrand(), myMachine.countBeverage(appleJuice.getBrand()))
    }
    
    @IBAction func addIceAmericanoButton(_ sender: Any) {
        myMachine.add(iceAmericano)
        print(myMachine.getAllStocks())
        print(iceAmericano.getBrand(), myMachine.countBeverage(iceAmericano.getBrand()))
    }

    @IBAction func addPeppermintButton(_ sender: Any) {
        myMachine.add(peppermint)
        print(myMachine.getAllStocks())
        print(peppermint.getBrand(), myMachine.countBeverage(peppermint.getBrand()))
    }
    
    @IBAction func addAmericanoButton(_ sender: Any) {
        myMachine.add(americano)
        print(myMachine.getAllStocks())
        print(americano.getBrand(), myMachine.countBeverage(americano.getBrand()))
    }
    
    @IBAction func addMilkTeaButton(_ sender: Any) {
        myMachine.add(milkTea)
        print(myMachine.getAllStocks())
        print(milkTea.getBrand(), myMachine.countBeverage(milkTea.getBrand()))
    }

}

