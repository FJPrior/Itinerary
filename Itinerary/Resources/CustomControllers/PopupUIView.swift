//
//  PopupUIView.swift
//  Itinerary
//
//  Created by P on 5/28/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        backgroundColor = Theme.backgroundColor
        
    }

}
