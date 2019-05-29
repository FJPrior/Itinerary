//
//  AppUIButton.swift
//  Itinerary
//
//  Created by P on 5/28/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)

        
    }

}
