//
//  VCFailedLogin.swift
//  MyLoginApp
//
//  Created by Cam Loan on 11/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class VCFailedLogin: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    var timerCounter = 10
    var timer: Timer = Timer()
    
    func backToLogin(){
        self.timerCounter -= 1
        if self.timerCounter < 0 {
            timer.invalidate()
            let vcLogin: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDLogin") as! VCLogin
            present(vcLogin, animated: true, completion: nil)
        } else {
            lblMessage.text = "You've got \(timerCounter) second to back login screen. Please waiting..."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblMessage.text = ""
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(backToLogin), userInfo: nil, repeats: true)
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
