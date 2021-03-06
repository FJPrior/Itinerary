//
//  TripFunctions.swift
//  Itinerary
//
//  Created by P on 5/18/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class TripFunctions {
    
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completition: @escaping () -> ()) {
        // Excecute on a background thread so it doesn´t stop the app
        // TODO: - Watch Video Threading and Closures, links in video Part 8
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Viva Mexico"))
                Data.tripModels.append(TripModel(title: "Rusian Trip"))
                
            }
            DispatchQueue.main.async {
                completition()
            }
        }
        

        

    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
        
    
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    
    }
    
}
