//
//  ViewController.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/28/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_01: UIViewController {
    @IBOutlet weak var tblRestaurant: UITableView!
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
                           "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantPhotos = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional",
                            "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
                               "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea","Coffee  & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tblRestaurant.rowHeight = UITableViewAutomaticDimension
        //tblRestaurant.estimatedRowHeight = 80
        tblRestaurant.delegate = self
        tblRestaurant.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
}

extension ViewController_01: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01") as! RestaurantTableViewCell_01
        cell.imgRestaurant.image = UIImage(named: restaurantPhotos[indexPath.row])
        cell.lblResName.text = restaurantNames[indexPath.row]
        cell.lblResLocation.text = restaurantLocations[indexPath.row]
        cell.lblResType.text = restaurantTypes[indexPath.row]
        return cell
    }
}
extension NSLayoutConstraint {
    
    override open var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}
