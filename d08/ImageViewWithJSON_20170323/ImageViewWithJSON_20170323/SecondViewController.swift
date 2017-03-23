//
//  SecondViewController.swift
//  ImageViewWithJSON_20170323
//
//  Created by 김재정 on 2017. 3. 23..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var myModel = MyModel(makeArray:[])
    var randomButton = UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 70))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = "[{\"title\":\"\u{c0c8}\u{b85c}\",\"image\":\"01.jpg\",\"content\":\"\u{c601}\u{d654}\u{bcf4}\u{b7ec}\u{ac00}\u{c790}\",\"comments\":[{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\":4,\"user\":\"cook\",\"comment\":\"apple\"}]}, {\"title\":\"\u{d1a0}\u{c774}\u{c2a4}\u{d1a0}\u{b9ac}\",\"image\":\"02.jpg\", \"content\":\"Pixar\",\"comments\":[]}, {\"title\":\"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\u{c6b0}\u{b514}\u{ac00}\u{cd5c}\u{ace0}\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\":\"Microsoft\"}]}, {\"title\":\"\u{adf9}\u{c7a5}\u{c740}\",\"image\":\"04.jpg\",\"content\":\"\u{c5b4}\u{b514}\u{b85c}\",\"comments\":[{\"id\":4,\"user\":\"cook\",\"comment\":\"apple\"}]}]".data(using: .utf8)
        
        myModel.makeJsonArray(jsonData:jsonData!)
        
        randomButton.setTitle("Random", for: .normal)
        randomButton.setTitleColor(UIColor.white,for: .normal)
        randomButton.backgroundColor=UIColor.black
        randomButton.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchUpInside)
        self.view.addSubview(randomButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func buttonTouched(_ sender:UIButton){
        
        let result :RandomPhotoViewController = storyboard?.instantiateViewController(withIdentifier: "RandomPhoto") as! RandomPhotoViewController
        
        
        if let resultButton = self.navigationController{self.present(result, animated: true, completion: nil)
            
            let ranNum = Int(arc4random_uniform(4))
            //let ranNum = Int(arc4random_uniform(UInt32((jsonData?.count)!)))
            result.saveData = myModel.item(atIndex: ranNum)
            result.randomNumber = ranNum
        }
    }


}

