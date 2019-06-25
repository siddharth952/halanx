//
//  ViewController.swift
//  halanx
//
//  Created by Siddharth Sen on 22/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var backImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.dropShadow()
        facebookBtn.dropShadow()
    }
}


