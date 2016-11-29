//
//  ViewController_01.swift
//  MyJsonMySQL
//
//  Created by Cam Loan on 11/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_01: UIViewController {

    var linkBH: String = ""
    
    @IBOutlet weak var wvPlayer: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
print(linkBH)
        // Do any additional setup after loading the view.
        let url: URL = URL(string: linkBH)!
        let request: URLRequest = URLRequest(url: url)
        
        wvPlayer.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
       return true
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
