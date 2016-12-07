//
//  ResetPasswordViewController.swift
//  CafePin
//
//  Created by Cam Loan on 12/5/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    var db: DBFIRApp! = nil
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBAction func abtnResetPassword(_ sender: Any) {
        if (txtEmail.text == ""){
            let alert = UIAlertController(title: "Error", message: "Please input email to reset password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let dict: Dictionary<String,String> = ["email":txtEmail.text!]
            db.resetPassword(params: dict as NSDictionary, completion: {(error) in
                var title = ""
                var message = ""
                if error != nil {
                    title = "Error!"
                    message = error!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.txtEmail.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {(ok) in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC")
                    self.present(vc!, animated: true, completion: nil)
                })
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            
            })
        }
    }
    
    @IBAction func abtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = DBFIRApp()
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
