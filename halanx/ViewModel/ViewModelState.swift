//
//  ViewModelState.swift
//  halanx
//
//  Created by Siddharth Sen on 23/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import Foundation

enum ViewModelState: Equatable {
    case loading
    case error(String)
    case idle
}
