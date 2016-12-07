//
//  RestaurantDetailViewController.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/30/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController {

    var restaurants: RestaurantMO!

    @IBOutlet weak var imgRestaurantDetail: UIImageView!
    
    @IBOutlet weak var tblRestaurantDetail: UITableView!
    
    @IBOutlet weak var vwMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = restaurants.name
        imgRestaurantDetail.image = UIImage(data: restaurants.image as! Data)
        
        tblRestaurantDetail.estimatedRowHeight = 45
        tblRestaurantDetail.rowHeight = UITableViewAutomaticDimension
        tblRestaurantDetail.delegate = self
        tblRestaurantDetail.dataSource = self
        
        tblRestaurantDetail.backgroundColor = UIColor(red: 103/255, green: 65/255, blue: 114/244, alpha: 0.8)
        //tblRestaurantDetail.sectionHeaderHeight = 0
        //tblRestaurantDetail.tableHeaderView = UIView(frame: CGRect.zero)
        //tblRestaurantDetail.tableFooterView = UIView(frame: CGRect.zero)
        tblRestaurantDetail.separatorColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        
        navigationController?.hidesBarsOnSwipe = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMap))
        vwMap.addGestureRecognizer(tapGesture)
    }
    func showMap(){
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview"{
            let vc = segue.destination as! ReviewViewController
            vc.restaurants = restaurants
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // unwind segue of review view
    @IBAction func close(segue: UIStoryboardSegue){
        
    }
    @IBAction func abtnRating(segue: UIStoryboardSegue){
        if let rating = segue.identifier{
            restaurants.isVisited = true
            switch rating {
            case "great":
                restaurants.rating = "Absolutely love it! Must try."
            case "good":
                restaurants.rating = "Pretty good."
            case "dislike":
                restaurants.rating = "I don't like it."
            default:
                break
            }
        }
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.saveContex()
        }
        tblRestaurantDetail.reloadData()
    }
    
    
}
extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Detail", for: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.lblField.text = "Name"
            cell.lblValue.text = restaurants.name
        case 1:
            cell.lblField.text = "Location"
            cell.lblValue.text = restaurants.location
        case 2:
            cell.lblField.text = "Type"
            cell.lblValue.text = restaurants.type
        case 3:
            cell.lblField.text = "Phone"
            cell.lblValue.text = restaurants.phone
        case 4:
            cell.lblField.text = "Been here?"
            if let rating = restaurants.rating {
                
                cell.lblValue.text = restaurants.isVisited ? "Yes, already been here.\r\n Rate: \(rating)" : "No"
            }else{
                cell.lblValue.text = ""
            }
        default:
            cell.lblField.text = ""
            cell.lblValue.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
