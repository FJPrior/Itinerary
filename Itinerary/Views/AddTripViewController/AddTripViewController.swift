//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by P on 6/1/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var popupView: UIView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tittleLabel.font = UIFont(name: Theme.mainFont, size: 24)
        

        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func savePressed(_ sender: Any) {
        if let doneSaving = doneSaving {
            doneSaving()
        }        
        dismiss(animated: true)
    }
    

}
