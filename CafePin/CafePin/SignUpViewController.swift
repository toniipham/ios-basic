//
//  SignUpViewController.swift
//  CafePin
//
//  Created by Cam Loan on 12/5/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var db: DBFIRApp = DBFIRApp()
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func abtnCreateAccount(_ sender: Any) {
        if txtEmail.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please input email to create new account", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let dict: Dictionary<String,String> = ["email":txtEmail.text!,"password":txtPassword.text!]
            db.createAccount(params: dict as NSDictionary, completion: {(user,error) in
                if error != nil{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC")
                    self.present(vc!, animated: true, completion: nil)
                }
            })
        }
    }

    @IBAction func abtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
