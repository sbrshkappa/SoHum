//
//  UIImage.swift
//  So Hum
//
//  Created by Sabareesh Kappagantu on 2/10/18.
//  Copyright © 2018 Sabareesh Kappagantu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setSquare() {
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = true
    }
    
}
