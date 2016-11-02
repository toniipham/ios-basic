//
//  VCSucceededLogin.swift
//  MyLoginApp
//
//  Created by Cam Loan on 11/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class VCSucceededLogin: UIViewController {
    
    @IBOutlet weak var lblUserName: UILabel!
    
    
    @IBAction func abtnSignout(_ sender: Any) {
        let str = "User \(usrName) logged out"
        usrDefault.set(str, forKey: "msgLoggingOut")
        let vcLogin: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDLogin") as! VCLogin
        present(vcLogin, animated: true, completion: nil)
    }

    let usrDefault: UserDefaults = UserDefaults()
    var usrName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        usrName = usrDefault.object(forKey: "usrName") as! String
        
        lblUserName.text = "Welcome \(usrName) to app"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
