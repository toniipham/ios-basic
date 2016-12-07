//
//  AddNewRestaurant.swift
//  SimpleTable
//
//  Created by Cam Loan on 12/5/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import CoreData

class AddNewRestaurant: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imgPicker = UIImagePickerController()
    var isVisited = false
    var restaurants: RestaurantMO!
    
    // MARK: OUTLET
    @IBOutlet weak var imgRestaurantPicker: UIImageView!
    @IBOutlet weak var txtRestaurantName: UITextField!
    @IBOutlet weak var txtRestaurantType: UITextField!
    @IBOutlet weak var txtRestaurantLocation: UITextField!
    @IBOutlet weak var txtRestaurantPhone: UITextField!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBAction func toggleYesNo(_ sender: UIButton) {
        
        if sender == btnYes{
            isVisited = true
            btnYes.backgroundColor = UIColor(red: 218/255, green: 100/255, blue: 70/255, alpha: 1)
            btnNo.backgroundColor = UIColor(red: 218/255, green: 223/255, blue: 225/255, alpha: 1)
        }else if sender == btnNo{
            isVisited = false
            btnNo.backgroundColor = UIColor(red: 218/255, green: 100/255, blue: 70/255, alpha: 1)
            btnYes.backgroundColor = UIColor(red: 218/255, green: 223/255, blue: 225/255, alpha: 1)
        }
       
    }

    @IBAction func abtnShowLibPhotos(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)  {
            imgPicker.allowsEditing = false
            imgPicker.sourceType = .photoLibrary
            imgPicker.modalPresentationStyle = .popover
            self.present(imgPicker, animated: true, completion: nil)
            //imgPicker.popoverPresentationController?.barButtonItem = sender
        }
    }
    
    @IBAction func abtnOpenCamera(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgPicker.allowsEditing = false
            imgPicker.sourceType = .camera
            imgPicker.cameraCaptureMode = .photo
            imgPicker.modalPresentationStyle = .fullScreen
            self.present(imgPicker, animated: true, completion: nil)
            //imgPicker.popoverPresentationController?.barButtonItem = sender
            
        }else{
            let alert = UIAlertController(title: "No Camera",
                                          message: "Sorry, this device has no camera",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style:.default,
                handler: nil)
            alert.addAction(okAction)
            present(alert,
                    animated: true,
                    completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "New Restaurant"
        imgPicker.delegate = self
        
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.abtnCamera(_:)))
        //imgRestaurantPicker.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view
    @IBAction func save(sender: AnyObject){
        // check textfield isempty or not
        if (txtRestaurantName.text == "") || (txtRestaurantType.text == "") || (txtRestaurantLocation.text == ""){
            let alert = UIAlertController(title: "Information", message: "Please note all field are required", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            restaurants = RestaurantMO(context: appDelegate.persistContainer.viewContext)
            restaurants.name = txtRestaurantName.text
            restaurants.location = txtRestaurantLocation.text
            restaurants.type = txtRestaurantType.text
            restaurants.isVisited = isVisited
            restaurants.phone = txtRestaurantPhone.text
            
            if let imgRestaurant = imgRestaurantPicker.image{
                if let imgResData = UIImagePNGRepresentation(imgRestaurant){
                    restaurants.image = NSData(data: imgResData)
                }
            }
            
            appDelegate.saveContex()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imgRestaurantPicker.image = selectedImage
            imgRestaurantPicker.contentMode = .scaleAspectFit
            imgRestaurantPicker.clipsToBounds = true
        }
        // set layout contraints for selected image
        // leading
        let leading = NSLayoutConstraint(item: imgRestaurantPicker, attribute: .leading, relatedBy: .equal, toItem: imgRestaurantPicker.superview, attribute: .leading, multiplier: 1, constant: 0)
        leading.isActive = true
        // trailing
        let trailing = NSLayoutConstraint(item: imgRestaurantPicker, attribute: .trailing, relatedBy: .equal, toItem: imgRestaurantPicker.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailing.isActive = true
        // top
        let top = NSLayoutConstraint(item: imgRestaurantPicker, attribute: .top, relatedBy: .equal, toItem: imgRestaurantPicker.superview, attribute: .top, multiplier: 1, constant: 0)
        top.isActive = true
        // bottom
        let bottom = NSLayoutConstraint(item: imgRestaurantPicker, attribute: .bottom, relatedBy: .equal, toItem: imgRestaurantPicker.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottom.isActive = true
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
