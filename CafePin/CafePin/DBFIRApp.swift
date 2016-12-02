//
//  db.swift
//  CafePin
//
//  Created by Cam Loan on 12/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import GoogleMobileAds

class DBFIRApp{
    var refRoot:FIRDatabaseReference! = nil
        
    init() {
        FIRApp.configure()
        // admob id
        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")
        
        refRoot = FIRDatabase.database().reference()
    }
    func getNewNode(urlString: String)-> String{
        return refRoot.child(urlString).childByAutoId().key
    }
    func loadData(urlString: String, completion: @escaping (Any)-> ()){
        // ex: read from root test->test1->test2 and retrieve id and name of testdata
        refRoot.child(urlString).observe(FIRDataEventType.value, with: {(snapshot) in
            if let data = snapshot.value as? Dictionary<String,Any>{
                completion(data)
            }
        })
    }
    func insertData(urlString: String, params: NSDictionary){
        // insert new value with param's key to be fieldname and param's value to be value
        
        refRoot.child(urlString).setValue(params)
    }
    func updateData(urlString: String, params: NSDictionary){
        refRoot.child(urlString).updateChildValues(params as! [AnyHashable : Any])
    }
    func deleteData(urlString: String){
        refRoot.child(urlString).setValue(nil)
    }
    func delete(urlString: String) {
        refRoot.child(urlString).removeValue()
    }
    func sortByNode(urlString: String){
        refRoot.child(urlString).queryOrdered(byChild: "node")
    }
    
    //admob
    func showBanner(vwBanner: GADBannerView, rootView: UIViewController){
        vwBanner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        vwBanner.rootViewController = rootView
        vwBanner.load(GADRequest())
    }
}
