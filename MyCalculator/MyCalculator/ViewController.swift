//
//  ViewController.swift
//  MyCalculator
//
//  Created by Cam Loan on 11/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // khai bao mot mang cac so nguyen va dau
    // moi lan nhan so se push vao mang so nguyen
    // moi lan nhan dau se push vao mang dau
    // hoac push ca hai vao mot mang
    // tuy thuoc vao dau kieu gi ma chuyen toi man hinh ket qua do
    // de tinh ket qua thi pop mang do ra roi tinh dua tren dau
    
    var result: Int = 0
    var value: String = "", lastValue: String = ""
    var pheptinh: String = ""
    var checkDau: Bool = false
    
    func Plus() -> Int{
        let num1: Int = Int(lastValue)!
        let num2: Int = Int(txtValue.text!)!
        return num1 + num2
    }
    func Minus() -> Int{
        let num1: Int = Int(lastValue)!
        let num2: Int = Int(txtValue.text!)!
        return num1 - num2
    }
    
    @IBAction func abtncalcPlus(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "+"
        checkDau = true
    }
    @IBAction func abtncalcMinus(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "-"
        checkDau = true
    }
    
    @IBAction func abtnEqual(_ sender: Any) {
        switch pheptinh {
        case "+":
            result = Plus()
            txtValue.text = String(result)
            let vc:VCPlus = storyboard?.instantiateViewController(withIdentifier: "SIDPlus") as! VCPlus
            vc.result = result
            self.navigationController?.pushViewController(vc, animated: true)
        case "-":
            result = Minus()
            txtValue.text = String(result)
            let vc:VCMinus = storyboard?.instantiateViewController(withIdentifier: "SIDMinus") as! VCMinus
            //vc.result = result
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
    }
    
    
    
    @IBAction func abtnNum0(_ sender: Any) {
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "0"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum1(_ sender: Any) {
         if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "1"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum2(_ sender: Any) {
          if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "2"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum3(_ sender: Any) {
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "3"
        txtValue.text = value
        checkDau = false
    }
    
    
    @IBOutlet weak var txtValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

