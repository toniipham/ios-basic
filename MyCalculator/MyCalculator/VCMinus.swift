//
//  VCMinus.swift
//  MyCalculator
//
//  Created by Cam Loan on 11/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class VCMinus: UIViewController {

    
    @IBOutlet weak var lblResult: UILabel!
    
    var result: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblResult.text = "Ket qua phep tinh la "
    }
    override func viewDidAppear(_ animated: Bool) {
        lblResult.text = "Ket qua phep tinh la \(String(result))"
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
