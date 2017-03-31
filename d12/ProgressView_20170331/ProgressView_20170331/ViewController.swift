//
//  ViewController.swift
//  ProgressView_20170331
//
//  Created by 김재정 on 2017. 3. 31..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    /*
    let readButton: UIButton = UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 70))
    
    let progressView: UIProgressView = UIProgressView(frame: CGRect(x: 10, y: 300, width: 350, height: 10))
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        readButton.setTitle("Read", for: .normal)
        readButton.setTitleColor(UIColor.white,for: .normal)
        readButton.backgroundColor=UIColor.black
        readButton.addTarget(self, action: #selector(readButtonTouched(_:)), for: .touchUpInside)
        self.view.addSubview(readButton)
        
        self.view.addSubview(progressView)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
     @IBAction func readButtonTouched(_ sender: Any) {
        self.progressView.progress = 0
        DispatchQueue.global().async {
            self.beginProgress()
        }
    }
    
    func beginProgress() {
        let fileContent = try? String.init(contentsOfFile:
            Bundle.main.path(forResource: "bookfile", ofType: "txt")!,
                                           encoding: String.Encoding.utf8)
        var spaceCount = 0
        var progress : Float = 0
        var nIndex = 0
        let length = fileContent?.unicodeScalars.count
        
        for char in (fileContent?.unicodeScalars)! {
            if char == " ".unicodeScalars.first {
                spaceCount += 1
            }
            progress = Float(nIndex) / Float(length!)
            nIndex += 1
            DispatchQueue.main.async {
                self.progressView.progress = progress
            }
        }
        let alert = UIAlertController.init(title: "Result",
                                           message: "찾았다. \(spaceCount)개", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        

}

