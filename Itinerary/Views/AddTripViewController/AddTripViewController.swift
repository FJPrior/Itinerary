//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by P on 6/1/19.
//  Copyright © 2019 Francisco Prior. All rights reserved.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var popupView: UIView!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tittleLabel.font = UIFont(name: Theme.mainFont, size: 24)
        imageView.layer.cornerRadius = 10
        
        // Dropshadow on title
        tittleLabel.layer.shadowOpacity = 1
        tittleLabel.layer.shadowColor = UIColor.white.cgColor
        tittleLabel.layer.shadowOffset = CGSize.zero
        tittleLabel.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            tripTextField.text = trip.title
            tittleLabel.text = "Edit Trip"
            imageView.image = trip.image
        }

        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func addFotoPressed(_ sender: UIButton) {
        // First check if the foto library is available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // Request authorization
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.presentPhotoPickerController()

                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo LibraryDennied Restricted", message: "Photo Library acces was previously denied. Please update your settings if you wish to change this", preferredStyle: .alert)
                    let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default, handler: { (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                    })
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    
                    alert.addAction(cancelAction)
                    alert.addAction(goToSettingsAction)
                    
                    self.present(alert, animated: true)
                    
                @unknown default:
                    break
                }
            }
        }
        
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            // If the user has not entered text, present a warning
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = #imageLiteral(resourceName: "Warning")
            tripTextField.rightView = imageView
            
            // Alternatives
//            tripTextField.backgroundColor = #colorLiteral(red: 1, green: 0.8215045333, blue: 0.8275071979, alpha: 1)
            
//            tripTextField.layer.borderColor = UIColor.red.cgColor
//            tripTextField.layer.borderWidth = 1
//            tripTextField.layer.cornerRadius = 5
//            tripTextField.placeholder = "Trip name required"
            
            tripTextField.rightViewMode = .always
            
            
            return
        }
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        }
        
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName,image: imageView.image))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }        
        dismiss(animated: true)
    }
    

}
// Creating an extenesion to receive the image selected
extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Checking if the user selected an Image
        if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
