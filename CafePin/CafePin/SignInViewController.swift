//
//  SignInViewController.swift
//  CafePin
//
//  Created by Cam Loan on 12/5/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    var db: DBFIRApp! = nil
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func abtnSignIn(_ sender: Any) {
        if (txtUsername.text == "") || (txtPassword.text == "") {
            let alert = UIAlertController(title: "Error", message: "Please input email and password to sign in", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let dict: Dictionary<String,String> = ["email":txtUsername.text!,"password":txtPassword.text!]
            let queue = DispatchQueue(label: "fbdata", qos: .utility)
            queue.async {
                self.db = DBFIRApp()
                self.db.logByEmailAccount(params: dict as NSDictionary, completion: {(dictUserProfile,error) in
                    if error != nil{
                        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }else{
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HOME") as! ViewController
                        
                        vc.userInfo = "Name: \(dictUserProfile["email"]!) "
                        self.present(vc, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func abtnSignUp(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func abtnResetPassword(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.becomeFirstResponder()
        let queue = DispatchQueue(label: "fb", qos: .background)
        queue.async {
            self.db = DBFIRApp()
        }
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
