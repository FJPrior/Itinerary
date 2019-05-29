//
//  TripModel.swift
//  Itinerary
//
//  Created by P on 5/18/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import Foundation

class TripModel {
    let id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
    
}
