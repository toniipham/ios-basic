//
//  VCLogin.swift
//  MyLoginApp
//
//  Created by Cam Loan on 11/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class VCLogin: UIViewController {

    var iCount: Int = 0 // kiem tra so lan nhap sai neu so lan nhap sai lon hon 5 thi chuyen sang man hinh yyy doi xxx giay
    let usrDefaults: UserDefaults = UserDefaults()
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func abtnSignin(_ sender: Any) {
        // gia su username: abc pass: 123
        let usrName: String? = txtUsername.text
        let pwd: String? = txtPassword.text
        
        if !(checkUsername(usr: usrName) && checkPassword(pwd: pwd))
        {
            iCount += 1
        }
        else{
            
            usrDefaults.set(usrName, forKey: "usrName")
            
            let vcOK: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDSucceededLogin") as! VCSucceededLogin
            present(vcOK, animated: true, completion: nil)
        }
        if iCount > 5
        {
            let vcFailure: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDFailedLogin") as! VCFailedLogin
            present(vcFailure, animated: true, completion: nil)
        }
    }
    func checkUsername(usr: String?) -> Bool
    {
        if let usrName = usr
        {
            if usrName != "abc"
            {
                lblMessage.text = ""
                lblMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                lblMessage.text = "Username not correct"
                txtUsername.becomeFirstResponder()
                return false
            }
        }
        return true
    }
    func checkPassword(pwd: String?) -> Bool
    {
        if let pwd = pwd
        {
            if pwd != "123"
            {
                lblMessage.text = ""
                lblMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                lblMessage.text = "Password not correct"
                txtPassword.becomeFirstResponder()
                return false
            }
        }
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let msg = usrDefaults.object(forKey: "msgLoggingOut")
        let usrName = usrDefaults.object(forKey: "usrName")
        txtUsername.text = usrName as? String
        lblMessage.text = msg as? String
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
