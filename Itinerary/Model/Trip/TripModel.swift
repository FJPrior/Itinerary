//
//  TripModel.swift
//  Itinerary
//
//  Created by P on 5/18/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import Foundation
import UIKit

class TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    

    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
    
}
