//
//  ViewController.swift
//  OpenCVTest
//
//  Created by Lemon on 2022/4/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let image = UIImage(named: "green")!
        
        PictureColorTest().calculateColor(from: image)
        
        
        let label = UILabel()
        label.backgroundColor = .red
        view.addSubview(label)
        label.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
    }


}

