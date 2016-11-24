//
//  VCPlus.swift
//  MyCalculator
//
//  Created by Cam Loan on 11/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class VCPlus: UIViewController {
    
<<<<<<< HEAD
    var result: Double = 0
=======
    var result: Int = 0
>>>>>>> master

    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
<<<<<<< HEAD
        lblResult.text = "Ket qua phep tinh la "
    }
    override func viewDidAppear(_ animated: Bool) {
        lblResult.text = "Ket qua phep tinh la \(String(result))"
    }
=======
        lblResult.text = "Ket qua phep tinh la \(String(result))"
    }

>>>>>>> master
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
