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
    
    var tripIndexToEdit: Int?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            // Use weak self to avoid a potential memory leak
            popup.tripIndexToEdit = tripIndexToEdit
            popup.doneSaving = { [weak self] in
                
                self?.tableView.reloadData()
            }
            
            
        
        
        }
    }
    
    func addTrip(title: String) {
        
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you suere you want to delete the trip \"\(trip.title)?\"", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform delete
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                // Call actionPerformed(true) to let the system know that the action was performed
                actionPerformed(true)
            }))
      
            self.present(alert, animated: true)
        }
        
        delete.image = #imageLiteral(resourceName: "Delete")

        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualView, view, actionPerformed) in
            // Edit the trip
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "showAddTripSegue", sender: nil)
            actionPerformed(true)
            
        }
        edit.image = #imageLiteral(resourceName: "Edit")
        edit.backgroundColor = UIColor(named: "EditColor")
        
        
        
        return UISwipeActionsConfiguration(actions: [edit])
        
    }
    
}
