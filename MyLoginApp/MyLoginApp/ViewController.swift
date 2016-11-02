//
//  ViewController.swift
//  MyLoginApp
//
//  Created by Cam Loan on 11/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func abtnLogin(_ sender: Any) {
        let vc: UIViewController = storyboard?.instantiateViewController(withIdentifier: "SIDLogin") as! VCLogin
        self.navigationController?.pushViewController(vc, animated: true)
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

