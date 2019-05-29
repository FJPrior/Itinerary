//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by P on 5/31/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

extension UIView {
    // Use extension to organize your code
    func addShadowAndRoundedCorners() -> Void {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10        
    }
    
    
    
    
}
