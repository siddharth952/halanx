//
//  dropShadowUIView.swift
//  halanx
//
//  Created by Siddharth Sen on 25/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 8.0
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
