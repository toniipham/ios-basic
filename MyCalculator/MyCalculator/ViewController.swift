//
//  ViewController.swift
//  MyCalculator
//
//  Created by Cam Loan on 11/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD
    
    
    var result: Double = 0
=======
    // khai bao mot mang cac so nguyen va dau
    // moi lan nhan so se push vao mang so nguyen
    // moi lan nhan dau se push vao mang dau
    // hoac push ca hai vao mot mang
    // tuy thuoc vao dau kieu gi ma chuyen toi man hinh ket qua do
    // de tinh ket qua thi pop mang do ra roi tinh dua tren dau
    
    var result: Int = 0
>>>>>>> master
    var value: String = "", lastValue: String = ""
    var pheptinh: String = ""
    var checkDau: Bool = false
    
<<<<<<< HEAD
    func Plus() -> Double{
        var num1: Double? = Double(lastValue)
        var num2: Double? = Double(txtValue.text!)
        var res: Double = 0
        if num1 != nil
        {
            num1 = Double(lastValue)
        }
        if num2 != nil
        {
            num2 = Double(txtValue.text!)
        }
        else
        {
            num2 = 0
        }
        
        res = num1! + num2!
        return res
    }
    func Minus() -> Double{
        var num1: Double? = Double(lastValue)
        var num2: Double? = Double(txtValue.text!)
        var res: Double = 0
        if num1 != nil
        {
            num1 = Double(lastValue)
        }
        if num2 != nil
        {
            num2 = Double(txtValue.text!)
        }
        else
        {
            num2 = 0
        }
        
        res = num1! - num2!
        return res
    }
    func Multiply() -> Double{
        var num1: Double? = Double(lastValue)
        var num2: Double? = Double(txtValue.text!)
        var res: Double = 0
        if num1 != nil
        {
            num1 = Double(lastValue)
        }
        else
        {
            num1 = 0
        }
        if num2 != nil
        {
            num2 = Double(txtValue.text!)
        }
        else
        {
            num2 = 0
        }
        
        res = num1! * num2!
        return res
    }
    func Divide() -> Double{
        var num1: Double? = Double(lastValue)
        var num2: Double? = Double(txtValue.text!)
        var res: Double = 0
        if num1 != nil
        {
            num1 = Double(lastValue)
        }
        if num2 != nil
        {
            num2 = Double(txtValue.text!)
        }
        else
        {
            num2 = 0
        }
        if (num2! != 0)
        {
            res = num1! / num2!
        }
        else {
            res = 0
        }
        return res
=======
    func Plus() -> Int{
        let num1: Int = Int(lastValue)!
        let num2: Int = Int(txtValue.text!)!
        return num1 + num2
    }
    func Minus() -> Int{
        let num1: Int = Int(lastValue)!
        let num2: Int = Int(txtValue.text!)!
        return num1 - num2
>>>>>>> master
    }
    
    @IBAction func abtncalcPlus(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "+"
        checkDau = true
<<<<<<< HEAD
        txtValue.text = ""
=======
>>>>>>> master
    }
    @IBAction func abtncalcMinus(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "-"
        checkDau = true
<<<<<<< HEAD
        txtValue.text = ""
    }
    @IBAction func abtncalcMultiply(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "*"
        checkDau = true
        txtValue.text = ""
    }
    @IBAction func abtncalcDivide(_ sender: Any) {
        lastValue = txtValue.text!
        pheptinh = "/"
        checkDau = true
        txtValue.text = ""
=======
>>>>>>> master
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
<<<<<<< HEAD
            vc.result = result
            self.navigationController?.pushViewController(vc, animated: true)
        case "*":
            result = Multiply()
            txtValue.text = String(result)
            let vc:VCMultiply = storyboard?.instantiateViewController(withIdentifier: "SIDMultiply") as! VCMultiply
            vc.result = result
            self.navigationController?.pushViewController(vc, animated: true)
        case "/":
            result = Divide()
            txtValue.text = String(result)
            let vc:VCDivide = storyboard?.instantiateViewController(withIdentifier: "SIDDivide") as! VCDivide
            vc.result = result
=======
            //vc.result = result
>>>>>>> master
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
<<<<<<< HEAD
        txtValue.text = ""
=======
>>>>>>> master
    }
    
    
    
<<<<<<< HEAD
    @IBAction func abtnPoint(_ sender: Any) {
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "."
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnAC(_ sender: Any) {
        txtValue.text = ""
        value = ""
        lastValue = ""
        pheptinh = ""
        checkDau = false
    }
=======
>>>>>>> master
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
<<<<<<< HEAD
    @IBAction func abtnNum4(_ sender: Any) {
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "4"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum5(_ sender: Any){
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "5"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum6(_ sender: Any){
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "6"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum7(_ sender: Any){
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "7"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum8(_ sender: Any){
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "8"
        txtValue.text = value
        checkDau = false
    }
    @IBAction func abtnNum9(_ sender: Any){
        if checkDau {
            txtValue.text = ""
            value = ""
        }
        value += "9"
        txtValue.text = value
        checkDau = false
    }
=======
    
>>>>>>> master
    
    @IBOutlet weak var txtValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
        txtValue.text = ""
    }
    override func viewDidAppear(_ animated: Bool) {
        txtValue.text = String(result)
        checkDau = true
    }
=======
    }

>>>>>>> master
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

