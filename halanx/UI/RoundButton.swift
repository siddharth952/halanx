//
//  RoundButton.swift
//  halanx
//
//  Created by Siddharth Sen on 23/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
