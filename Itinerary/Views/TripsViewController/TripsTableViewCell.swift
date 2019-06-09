//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by P on 5/20/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
   
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFont, size: 32)
        cardView.layer.backgroundColor = Theme.accent?.cgColor
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    // We pass all the model so we can on a later stage, set more properties of the cell
    func setup (tripModel: TripModel) {        
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }


}
