//
//  ViewController.swift
//  tapBar_20170317
//
//  Created by 김재정 on 2017. 3. 17..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pointBegin: CGPoint
    var pointMove: CGPoint
    var moveX : CGFloat
    var moveY : CGFloat
    
    init() {
        pointBegin = CGPoint()
        pointMove = CGPoint()
        moveX = CGFloat()
        moveY = CGFloat()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        pointBegin = CGPoint()
        pointMove = CGPoint()
        moveX = CGFloat()
        moveY = CGFloat()
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        //changedColor(fp: pointBegin, mp: pointMove)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch =  touches.first{
            pointBegin = touch.location(in: view)
            print("\(pointBegin)")
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch =  touches.first{
            pointMove = touch.location(in: view)
            moveX = CGFloat(abs(Float(1) - Float(1) / Float(pointMove.x - pointBegin.x)))
            moveY = CGFloat(Float(100) / abs(Float(pointMove.y - pointBegin.y)))
            //view.backgroundColor = UIColor(white: moveX, alpha: moveY)
            self.view.alpha = moveY
            print("\(pointMove)")
        }
        //changedColor(fp: pointBegin, mp: pointMove)
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        //moveX = CGFloat(0)
        //moveY = CGFloat(1)
        //view.backgroundColor = UIColor(white: moveX, alpha: moveY)
        self.view.alpha = 1
    }
    
/*
    func changedColor(fp: CGPoint, mp: CGPoint) {
        if fp.y - mp.y > 100 {
            //self.view.backgroundColor = UIColor(white: 1, alpha: 0.5)
            self.view.alpha = 1.0
        }
    }
*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
