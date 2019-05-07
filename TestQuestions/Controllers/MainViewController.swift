//
//  ViewController.swift
//  TestQuestions
//
//  Created by Di Gain on 04/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: nil, action: nil)
    }


}

