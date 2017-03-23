//
//  PhotoDetailViewController.swift
//  ImageViewWithJSON_20170323
//
//  Created by 김재정 on 2017. 3. 23..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class RandomPhotoViewController: UIViewController {

    var saveData : [String:Any] = [:]
    var randomNumber : Int = 0
    
    let backButton = UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 70))
    
    let imageView = UIImageView(frame: CGRect(x: 50, y: 200, width: 270, height: 300))
    
    let titleLabel = UILabel(frame: CGRect(x: 50, y: 650, width: 350, height: 20))
    let contentLabel = UILabel(frame: CGRect(x: 50, y: 670, width: 350, height: 20))
    let commentLabel = UILabel(frame: CGRect(x: 50, y: 690, width: 350, height: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(closedView(_:)), for: .touchUpInside)
        backButton.setTitleColor(UIColor.white,for: .normal)
        backButton.backgroundColor=UIColor.black
        
        titleLabel.center = CGPoint(x: 170, y: 520)
        titleLabel.textAlignment = .center
        contentLabel.center = CGPoint(x: 170, y: 550)
        contentLabel.textAlignment = .center
        commentLabel.center = CGPoint(x: 170, y: 580)
        commentLabel.textAlignment = .center
        
        self.view.addSubview(backButton)
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(contentLabel)
        self.view.addSubview(commentLabel)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        titleLabel.text = saveData["title"] as! String?
        contentLabel.text = saveData["content"] as! String?
        commentLabel.text = String("댓글 \(randomNumber)개")
        imageView.image = UIImage(named: saveData["image"] as! String)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func closedView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
