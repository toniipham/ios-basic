//
//  ViewController.swift
//  MyLoginApp
//
//  Created by Cam Loan on 11/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // kiem tra du lieu nhap vao va dang ky su dung nsuserdefault
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtDisplayName: UITextField!

    @IBAction func abtnLogin(_ sender: Any) {
        let vc: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDLogin") as! VCLogin
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func abtnRegister(_ sender: Any) {
//        let displayname: String? = txtDisplayName.text
//        let username: String? = txtUsername.text
//        let password: String? = txtPassword.text
//        
//        if let displayname = displayname{
//            txtDisplayName.becomeFirstResponder()
//        }
//        else if let username = username{
//            txtUsername.becomeFirstResponder()
//        }
//        else if let password = password{
//            txtPassword.becomeFirstResponder()
//        }
//        let usrDefaults: UserDefaults = UserDefaults()
//        usrDefaults.set(displayname, forKey: "displayname")
//        usrDefaults.set(username, forKey: "username")
//        usrDefaults.set(password, forKey: "password")
    }
    
    @IBAction func abtnRegWithFBID(_ sender: Any) {
        /// thu tinh nang alert
        // create the alert
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

