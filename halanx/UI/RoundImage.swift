//
//  RoundImage.swift
//  halanx
//
//  Created by Siddharth Sen on 23/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//
import UIKit

@IBDesignable class MyImage: UIImageView
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
        layer.cornerRadius = rounded ? frame.size.width / 2 : 0
    }
}

