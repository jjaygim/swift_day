//
//  ViewController.swift
//  ConstraintsGesture_20170323
//
//  Created by 김재정 on 2017. 3. 23..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(getter: ViewController.splitView))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 3
        self.view.addGestureRecognizer(tapRecognizer)
    
    func responseToTapGesture(rec : UITapGestureRecognizer) {
        if (rec.state == .ended) {
            self.view.backgroundColor = UIColor.black
        }
    }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





/*
//topView.backgroundColor = UIColor.yellow
//splitView.backgroundColor = UIColor.orange
//bottomView.backgroundColor = UIColor.cyan

//self.view.addSubview(UIImageView)

view.addConstraint(NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
view.addConstraint(NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute:.top, multiplier: 1, constant: 20))
view.addConstraint(NSLayoutConstraint(item: topView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 300))
view.addConstraint(NSLayoutConstraint(item: topView, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0))
*/
