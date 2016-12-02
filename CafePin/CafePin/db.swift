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

class DBFIRApp{
    var refRoot:FIRDatabaseReference! = nil
        
    init() {
        FIRApp.configure()
        refRoot = FIRDatabase.database().reference()
    }
    func getNewNode(urlString: String)-> String{
        return refRoot.child(urlString).childByAutoId().key
    }
    func loadData(urlString: String, completion: @escaping (Any)-> ()){
        // ex: read from root test->test1->test2 and retrieve id and name of testdata
        refRoot.child(urlString).observe(FIRDataEventType.value, with: {(data) in
            let obj: Dictionary<String,Any> = data.value as! Dictionary<String,Any>
            completion(obj)
        })
    }
    func insertData(urlString: String, params: NSDictionary){
        // insert new value with param's key to be fieldname and param's value to be value
        
        refRoot.child(urlString).setValue(params)
    }
    func updateData(urlString: String, params: NSDictionary){
        refRoot.child(urlString).updateChildValues(params as! [AnyHashable : Any])
    }
}
