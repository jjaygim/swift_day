//
//  FirstViewController.swift
//  ImageViewWithJSON_20170323
//
//  Created by 김재정 on 2017. 3. 23..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let pickPhoto = UIImagePickerController()
    var pickButton=UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 70))
    var imageView=UIImageView(frame: CGRect(x: 12, y: 200, width: 350, height: 300))
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    pickPhoto.delegate = self
    pickButton.setTitle("Picker", for: .normal)
    pickButton.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchUpInside)
    pickButton.setTitleColor(UIColor.white,for: .normal)
    pickButton.backgroundColor=UIColor.black
    
    self.view.addSubview(pickButton)
    self.view.addSubview(imageView)
    

    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let chosenImage = info[UIImagePickerControllerOriginalImage]
    imageView.contentMode = .scaleAspectFit
    imageView.image = chosenImage as! UIImage?
    
    picker.dismiss(animated: true, completion: nil)
    }
    
    
    func buttonTouched(_ sender: UIButton){
    pickPhoto.sourceType = .camera
    present(pickPhoto, animated: true, completion: nil)
    }



}

