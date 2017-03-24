//
//  DetailViewController.swift
//  camClient
//
//  Created by 김재정 on 2017. 3. 24..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    let camImageView = UIImageView(frame: CGRect(x: 50, y: 200, width: 270, height: 300))
    
    let task = URLSession(configuration: URLSessionConfiguration.default).streamTask(withHostName: "127.0.0.1", port: 8000)
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(camImageView)
        
        task.resume()
        showImage()
        
        self.configureView()
    }
    
    func showImage() {
        task.readData(ofMinLength: 0, maxLength: 8, timeout: 0) { (data, bool, error) in
            let str = String(data: data!, encoding: String.Encoding.utf8)
            
            self.task.readData(ofMinLength: 0, maxLength: Int(str!)!, timeout: 0, completionHandler: { (data, bool, error) in
                DispatchQueue.main.async {
                    self.camImageView.image = UIImage(data: data!)
                }
            })
            self.showImage()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    


}

