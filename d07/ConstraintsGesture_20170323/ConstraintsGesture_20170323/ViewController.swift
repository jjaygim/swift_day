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
    
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var splitViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecgnizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.responseToPan))
        
        self.splitView.addGestureRecognizer(panGestureRecgnizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func responseToPan(res: UIPanGestureRecognizer) {
        topViewHeight.constant = res.location(in: self.view).y - 12
    }
 
    /*
    func responseToPan(res: UIPanGestureRecognizer) {
        splitViewHeight.constant = res.location(in: self.view).y
    }
 */

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
