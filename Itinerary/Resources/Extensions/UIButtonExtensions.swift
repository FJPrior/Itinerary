//
//  UIButtonExtensions.swift
//  Itinerary
//
//  Created by P on 6/1/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

extension UIButton {
    func creatFloatingActionButton() {
        // Personalizing the addButton
        backgroundColor = Theme.tintColor
        layer.cornerRadius = self.frame.height/2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }

}
