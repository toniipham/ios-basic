//
//  ViewController.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/28/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import CoreData
import FBSDKShareKit
import FBSDKCoreKit
import Bolts

class ViewController: UIViewController {
    @IBOutlet weak var tblRestaurant: UITableView!

//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
//        "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//    var restaurantPhotos = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional",
//                           "barrafina", "donostia", "royaloak", "caskpubkitchen"]
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
//                               "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea","Coffee  & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//    //var restaurantVisited = [false, false, false, false, false, false, false,false, false, false, false, false, false, false, false, false, false, false,false, false, false]
//    var restaurantVisited = Array(repeating: false, count: 21)
    
    var restaurants:[RestaurantMO] = []
    /*
        = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", image:"cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phone: "234-834322", image: "posatelier.jpg",isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phone: "734-232323", image:
            "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phone: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", image: "confessional.jpg", isVisited:false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phone: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phone: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phone: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", image: "caskpubkitchen.jpg", isVisited: false)
        ]
    */
    
    var fetchResult: NSFetchedResultsController<RestaurantMO>!
    var searchBarController: UISearchController!
    var searchResults:[RestaurantMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tblRestaurant.rowHeight = UITableViewAutomaticDimension
        //tblRestaurant.estimatedRowHeight = 80
        tblRestaurant.separatorColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target:nil, action: nil)
        
        navigationController?.hidesBarsOnSwipe = true
        searchBarController = UISearchController(searchResultsController: nil)
        tblRestaurant.tableHeaderView = searchBarController.searchBar
        searchBarController.searchResultsUpdater = self
        searchBarController.dimsBackgroundDuringPresentation = false
        searchBarController.searchBar.placeholder = "Search restaurants..."
        searchBarController.searchBar.tintColor = UIColor.white
        searchBarController.searchBar.barTintColor = UIColor(red: 224/255.0, green:
            130/255.0, blue: 131/255.0, alpha: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
        // fetch data from store
        let fetchRequest: NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let context = appDelegate.persistContainer.viewContext
            fetchResult = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResult.delegate = self
            do{
                try fetchResult.performFetch()
                if let fetchObject = fetchResult.fetchedObjects{
                    restaurants = fetchObject
                }
            }catch{
                let err = error as NSError
                fatalError("Unresolved error \(err), \(err.userInfo)")
            }
        }
    }
    
    @IBAction func abtnAddNew(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VCAddNew") as! AddNewRestaurant
        navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: Content Change
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tblRestaurant.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                tblRestaurant.insertRows(at: [newIndexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath{
                tblRestaurant.reloadRows(at: [indexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath{
                tblRestaurant.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            tblRestaurant.reloadData()
        }
        if let fetchedObject = controller.fetchedObjects{
            restaurants = fetchedObject as! [RestaurantMO]
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tblRestaurant.endUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool{
        return false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowRestaurantDetail" {
            if let indexPathSelected = tblRestaurant.indexPathForSelectedRow{
                let vc = segue.destination as! RestaurantDetailViewController
                let restaurantSearching = (searchBarController.isActive) ? searchResults[indexPathSelected.row] : restaurants[indexPathSelected.row]
                vc.restaurants = restaurantSearching
            }
        }
    }
    @IBAction func unwindToHome(segue: UIStoryboardSegue)
    {
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        searchBarController.searchBar.text = ""
        searchBarController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, UISearchResultsUpdating{
    
    func filterContents(for searchText: String){
        searchResults = restaurants.filter({(restaurant)->Bool in
            if let name = restaurant.name, let location = restaurant.location{
                return name.localizedCaseInsensitiveContains(searchText) || location.localizedCaseInsensitiveContains(searchText)
            }
            return false
        })
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let txtSearching = searchController.searchBar.text{
            filterContents(for: txtSearching)
            self.tblRestaurant.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBarController.isActive{
            return searchResults.count
        }else{
            return restaurants.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RestaurantTableViewCell
        
        let restaurantSearching = (searchBarController.isActive) ? searchResults[indexPath.row] : restaurants[indexPath.row]
        cell.imgThumbnail.image = UIImage(data: restaurantSearching.image as! Data)
        //cell.imgThumbnail.image = UIImage(named: restaurants[indexPath.row].image)
        cell.lblName.text = restaurantSearching.name
        cell.lblLocation.text = restaurantSearching.location
        cell.lblType.text = restaurantSearching.type
        
        if restaurantSearching.isVisited{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "What would do you want", preferredStyle: .actionSheet)
        let callAction = UIAlertAction(title: "Call +123-000-\(indexPath.row)", style: .default, handler: {
            (action: UIAlertAction) in
            let msg = UIAlertController(title: "Service Unavaillable", message: "Please retry", preferredStyle: .alert)
            msg.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(msg, animated: true, completion: nil)
        })
        let checkInTitle = self.restaurants[indexPath.row].isVisited ? "Undo Check in" : "Check in"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            if self.restaurants[indexPath.row].isVisited == true{
                self.restaurants[indexPath.row].isVisited = false
                cell?.accessoryType = .none
            }else{
                self.restaurants[indexPath.row].isVisited = true
                cell?.accessoryType = .checkmark
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(callAction)
        alert.addAction(checkInAction)
        //self.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            restaurants.remove(at: indexPath.row)
//            restaurants.remove(at: indexPath.row)
//            restaurants.remove(at: indexPath.row)
//            restaurants.remove(at: indexPath.row)
//            restaurants.remove(at: indexPath.row)
//        }
//        tblRestaurant.reloadData()
//    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchBarController.isActive{
            return false
        }else{
            return true
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // share on facebook
        let shareFB = UITableViewRowAction(style: .default, title: "Facebook", handler: {(action, indexPath) in
            let msg = "Just check in at \(self.restaurants[indexPath.row].name!)"
            guard let img = UIImage(data: self.restaurants[indexPath.row].image as! Data) else{
                return
            }
            
            let photo = FBSDKSharePhoto()
            photo.image = img
            
            let photoContent = FBSDKSharePhotoContent()
            photoContent.ref = msg
            photoContent.photos = [photo]
            photoContent.hashtag = FBSDKHashtag(string: msg)
            
            let fbDialog = FBSDKShareDialog()
            fbDialog.fromViewController = self
            fbDialog.shareContent = photoContent
            fbDialog.mode = .automatic
            let isShowed = fbDialog.show()
            if isShowed == false{
                let alert = UIAlertController(title: "Error", message: "Please login Facebook first", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            //FBSDKShareDialog.show(from: self, with: sharedContent, delegate: nil)
        })
        // share
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {
            (action,indexPath) in
            let msg = "Just check in at \(self.restaurants[indexPath.row].name!)"
            guard let img = UIImage(data: self.restaurants[indexPath.row].image as! Data) else{
                return
            }
            let activityController = UIActivityViewController(activityItems: [msg, img], applicationActivities: nil)
            activityController.popoverPresentationController?.sourceView = self.view
            
            self.present(activityController, animated: true, completion: nil)
        })
        // delete
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) in
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                let context = appDelegate.persistContainer.viewContext
                let restDelete = self.fetchResult.object(at: indexPath)
                context.delete(restDelete)
                appDelegate.saveContex()
                self.tblRestaurant.reloadData()
            }
        })
        shareFB.backgroundColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        shareAction.backgroundColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 0.8)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0,
                                               blue: 203.0/255.0, alpha: 0.6)
        return [deleteAction, shareAction, shareFB]
    }
}
