//
//  ViewController_01.swift
//  CafePin
//
//  Created by Cam Loan on 12/6/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_01: UIViewController {

    var userInfo = ""
    var db:DBFIRApp! = nil
    
    @IBOutlet weak var lblUser: UILabel!
    
    @IBAction func abtnLogout(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInVC")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = DBFIRApp()
        // Do any additional setup after loading the view.
        lblUser.text = "\(userInfo) logged in system"
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
