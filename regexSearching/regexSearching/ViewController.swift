//
//  ViewController.swift
//  regexSearching
//
//  Created by Cam Loan on 1/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtPattern.becomeFirstResponder()
        txtPattern.text = "([A-Z])"
        txtTestView.text = "dddd aaaaaaaSANJIbbbbb eeeee"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///MARK: OUTLET
    @IBOutlet weak var txtPattern: UITextField!
    
    @IBOutlet weak var txtTestView: UITextView!

    @IBAction func abtnSearch(_ sender: Any) {
        let pattern = txtPattern.text
        let strTest = txtTestView.text
        let match = matches(for: pattern!, in: strTest!) // check unwrap optional
        let alert = UIAlertController(title: "Information", message: "Matches Found\r\n\(match)", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func matches(for regex: String, in text: String) -> [String] {
        var res = [String]()
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            for match in results{
                for n in 0..<match.numberOfRanges-1{
                    let rangeX = match.rangeAt(n)
                    let m = nsString.substring(with: rangeX)
                    res.append(m)
                }
            }
            return res
            //return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    
}

