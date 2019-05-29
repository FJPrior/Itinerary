//
//  TripsViewController.swift
//  Itinerary
//
//  Created by P on 5/20/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
        TripFunctions.readTrips(completition:  { [weak self] in
            self?.tableView.reloadData()
        })
        
        
        view.backgroundColor = Theme.backgroundColor
        // Personalizing the addButton''
        addButton.creatFloatingActionButton()
        
    }
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell

        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
    
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
   
    
}
